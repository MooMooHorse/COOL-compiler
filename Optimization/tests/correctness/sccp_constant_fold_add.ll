define i32 @constant_fold_add() {
entry:
  %a = add i32 10, 20
  ret i32 %a
}