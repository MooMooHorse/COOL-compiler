define i32 @constant_loop() {
entry:
  br label %loop

loop:
  %i = phi i32 [0, %entry], [%next, %loop]
  %next = add i32 %i, 1
  %cond = icmp eq i32 %next, 3
  br i1 %cond, label %exit, label %loop

exit:
  ret i32 %next
}
