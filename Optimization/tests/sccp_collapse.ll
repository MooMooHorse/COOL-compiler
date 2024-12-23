; sccp_collapse.ll
; A collapse test for SCCP:
; - Multiple constants known at compile time
; - PHI nodes merging constants and undef
; - Nested branches that collapse to a single path
; - A select instruction that can be simplified
; - Blocks that become unreachable

define i32 @sccp_collapse() {
entry:
  ; Constant arithmetic
  %x = add i32 10, 20        ; %x = 30
  %y = mul i32 %x, 2         ; %y = 60
  %cond1 = icmp eq i32 %y, 60 ; always true
  br i1 %cond1, label %mid, label %alt

mid:
  ; Another known constant computation
  %z = sub i32 %y, 30        ; %z = 30
  %cond2 = icmp ult i32 %z, 50 ; always true
  br i1 %cond2, label %then, label %else

then:
  ; PHI node with only the known incoming edge
  %phi_val = phi i32 [ %z, %mid ] 
  ; At this point, only mid -> then is possible, so %phi_val = %z = 30

  ; A select that depends on a known condition
  %known_cond = icmp sgt i32 %z, 10 ; always true, %z=30
  %selected = select i1 %known_cond, i32 %z, i32 999 ; always %z = 30

  ; Another arithmetic operation on a known constant
  %res = add i32 %selected, 1 ; %res = 31
  ret i32 %res

else:
  ; This block will be unreachable
  %q = add i32 %z, 100
  ret i32 %q

alt:
  ; Also unreachable from entry due to %cond1 always true
  %r = add i32 %x, 999
  ret i32 %r
}
