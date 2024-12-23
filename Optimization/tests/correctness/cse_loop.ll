define i32 @main() {
entry:
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, ptr %sum, align 4
  store i32 0, ptr %i, align 4
  br label %loop

loop:
  %i_val = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %i_val, 10
  br i1 %cmp, label %body, label %exit

body:
  %x = mul i32 %i_val, 2
  %y = mul i32 %i_val, 2   ; Redundant
  %add1 = add i32 %x, %y
  %sum_val = load i32, ptr %sum, align 4
  %new_sum = add i32 %sum_val, %add1
  store i32 %new_sum, ptr %sum, align 4

  %next_i = add i32 %i_val, 1
  store i32 %next_i, ptr %i, align 4
  br label %loop

exit:
  %final_sum = load i32, ptr %sum, align 4
  call i32 (ptr, ...) @printf(ptr @.str, i32 %final_sum)
  ret i32 0
}

@.str = private unnamed_addr constant [9 x i8] c"Sum: %d\0A\00", align 1
declare i32 @printf(ptr, ...)
