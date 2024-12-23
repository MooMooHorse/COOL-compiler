define i32 @constant_branch() {
entry:
  %cond = icmp eq i32 1, 1
  br i1 %cond, label %true, label %false

true:
  ret i32 42

false:
  ret i32 0
}