define void @dead_code_elimination() {
entry:
  %a = add i32 5, 0
  %cond = icmp eq i32 %a, 5
  br i1 %cond, label %reachable, label %unreachable

reachable:
  call void @do_something()
  ret void

unreachable:
  call void @do_nothing()
  ret void
}

declare void @do_something()
declare void @do_nothing()
