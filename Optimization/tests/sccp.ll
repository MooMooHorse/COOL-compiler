; ModuleID = 'sccp.c'
source_filename = "sccp.c"

define i32 @main() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4

  ; a = a + b
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %2 = add i32 %0, %1
  store i32 %2, i32* %a, align 4

  ; if (a < b) { b = a; c = 8; } else { a = b; c = 4; }
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %if.then, label %if.else

if.then:
  %6 = load i32, i32* %a, align 4
  store i32 %6, i32* %b, align 4
  store i32 8, i32* %c, align 4
  br label %if.end

if.else:
  %7 = load i32, i32* %b, align 4
  store i32 %7, i32* %a, align 4
  store i32 4, i32* %c, align 4
  br label %if.end

if.end:
  ; if (a + b >= c) return 1; 
  %8 = load i32, i32* %a, align 4
  %9 = load i32, i32* %b, align 4
  %10 = add i32 %8, %9
  %11 = load i32, i32* %c, align 4
  %12 = icmp uge i32 %10, %11
  br i1 %12, label %return1, label %return0

return1:
  ret i32 1

return0:
  ret i32 0
}
