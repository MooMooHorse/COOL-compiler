void unreachable_code() {
    __builtin_unreachable(); // For unreachable code
}

int main() {
    unreachable_code();
    return 0;
}