define i32 @neutral_elements(i32 %input) {
entry:
  %a = add i32 %input, 0
  %b = mul i32 %a, 1
  ret i32 %b
}