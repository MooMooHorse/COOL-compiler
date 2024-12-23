define i32 @conditional_mix() {
entry:
  %x = add i32 4, 4
  %cond = icmp eq i32 %x, 8
  br i1 %cond, label %true, label %false

true:
  ret i32 100

false:
  ret i32 0
}
