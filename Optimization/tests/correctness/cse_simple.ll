define i32 @main() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4

  store i32 10, ptr %a, align 4
  store i32 20, ptr %b, align 4
  
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %add1 = add i32 %0, %1
  store i32 %add1, ptr %c, align 4

  %2 = load i32, ptr %a, align 4
  %3 = load i32, ptr %b, align 4
  %add2 = add i32 %2, %3
  store i32 %add2, ptr %d, align 4

  %4 = load i32, ptr %c, align 4
  %5 = load i32, ptr %d, align 4
  call i32 (ptr, ...) @printf(ptr @.str, i32 %4, i32 %5)
  
  ret i32 0
}

@.str = private unnamed_addr constant [6 x i8] c"%d %d\0A\00", align 1
declare i32 @printf(ptr, ...)
