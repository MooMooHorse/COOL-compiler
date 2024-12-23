; sccp_nested_branches.ll
; Multiple levels of constant conditions

define i32 @test_nested() {
entry:
  %a = add i32 1, 2          ; %a = 3
  %cond1 = icmp eq i32 %a, 3 ; always true
  br i1 %cond1, label %mid, label %alt

mid:
  %b = add i32 %a, 10        ; %b = 13
  %cond2 = icmp sgt i32 %b, 5; always true
  br i1 %cond2, label %then, label %else

then:
  %c = add i32 %b, 100       ; %c = 113
  ret i32 %c

else:
  %d = sub i32 %b, 1
  ret i32 %d

alt:
  %e = mul i32 %a, 2         ; unreachable
  ret i32 %e
}
