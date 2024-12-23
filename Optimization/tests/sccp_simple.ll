define i32 @sccp_simple() {
entry:
  ; %x is always 15
  %x = add i32 5, 10

  ; This condition is always true
  %cond = icmp eq i32 %x, 15

  br i1 %cond, label %then, label %else

then:
  %y = add i32 %x, 1
  ret i32 %y

else:
  %z = add i32 %x, 2
  ret i32 %z
}