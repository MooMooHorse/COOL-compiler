define i32 @nested_branches() {
entry:
  %cond1 = icmp eq i32 2, 2
  br i1 %cond1, label %block1, label %block2

block1:
  %cond2 = icmp eq i32 3, 3
  br i1 %cond2, label %nested_true, label %nested_false

nested_true:
  ret i32 50

nested_false:
  ret i32 0

block2:
  ret i32 0
}