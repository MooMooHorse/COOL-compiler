define i32 @unreachable_block() {
entry:
  br label %unreachable

unreachable:
  ret i32 0

reachable:
  ret i32 42
}