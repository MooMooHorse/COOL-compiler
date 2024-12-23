define i32 @phi_propagation() {
entry:
  %cond = icmp eq i32 1, 1
  br i1 %cond, label %block1, label %block2

block1:
  br label %merge

block2:
  br label %merge

merge:
  %val = phi i32 [10, %block1], [20, %block2]
  ret i32 %val
}
