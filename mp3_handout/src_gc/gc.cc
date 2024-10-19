#include <atomic>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <mutex>
#include <unordered_map>

// Global variable to track whether we are in the middle of a malloc/calloc/free
static std::mutex mtx;
static std::unordered_map<void *, size_t> allocs;
static std::atomic<bool> activated(false);
static bool print_malloc = false;

#define print_if_enabled(...) { if (print_malloc) { fprintf(stderr, __VA_ARGS__); } }

extern "C" {

// Underlying malloc implementation not exposed by glibc header
// but visible in the shared library.
void *__libc_malloc(size_t size);

// Shadow malloc and calloc implementations.
void *malloc(size_t size) __THROW __attribute_alloc_size__((1)) __wur {
  void *alloced = __libc_malloc(size);
  if (activated) {
    activated = false;
    std::lock_guard<std::mutex> lock(mtx);
    allocs.emplace(alloced, size);
    print_if_enabled("malloc(%zu) = %p\n", size, alloced);
    activated = true;
  }
  return alloced;
}
void *calloc(size_t nmemb, size_t size) __THROW
    __attribute_alloc_size__((1, 2)) __wur {
  size_t total = nmemb * size;
  void *p = malloc(total);
  return p ? memset(p, 0, total) : nullptr;
}

void *__libc_realloc(void *ptr, size_t size);
void *realloc(void *ptr, size_t size) __THROW __attribute_alloc_size__((2)) {
  void *alloced = __libc_realloc(ptr, size);
  if (activated) {
    activated = false;
    std::lock_guard<std::mutex> lock(mtx);
    allocs.erase(ptr);
    allocs.emplace(alloced, size);
    print_if_enabled("realloc(%p, %zu) = %p\n", ptr, size, alloced);
    activated = true;
  }
  return alloced;
}

void __libc_free(void *ptr);
void free(void *ptr) __THROW {
  if (activated) {
    activated = false;
    std::lock_guard<std::mutex> lock(mtx);
    auto it = allocs.find(ptr);
    if (it == allocs.end()) {
      print_if_enabled("free(%p) (not found)\n", ptr);
    } else {
      print_if_enabled("free(%p) (size = %zu)\n", ptr, it->second);
      allocs.erase(it);
    }
    activated = true;
  }
  __libc_free(ptr);
}

static void before_main(void) __attribute__((constructor));
static void before_main(void) {
  char* print_malloc_str = getenv("PRINT_MALLOC");
  if (print_malloc_str && std::string(print_malloc_str) == "1") {
    std::lock_guard<std::mutex> lock(mtx);
    print_malloc = true;
    print_if_enabled("hook before entering main()\n");
  }
  activated = true;
}

static void after_main(void) __attribute__((destructor));
static void after_main(void) {
  activated = false;
  print_if_enabled("hook after exiting main()\n");
  mtx.lock();
  bool found_printf_malloc = false;
  for (auto &[ptr, size] : allocs) {
    // printf likes to allocate a buffer at the first use, so ignore it.
    if (!found_printf_malloc && size > 512) {
      found_printf_malloc = true;
    } else {
      printf("leak: %p (size = %zu)\n", ptr, size);
    }
  }
  mtx.unlock();
}

} // extern "C"
