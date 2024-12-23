define i32 @function_calls() {
entry:
  %a = add i32 10, 20
  call void @debug_print(i32 %a)
  ret i32 %a
}

declare void @debug_print(i32)