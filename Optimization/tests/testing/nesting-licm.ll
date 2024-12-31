; ModuleID = '<stdin>'
source_filename = "tests/testing/nesting.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %n) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %i.2, %if.end ]
  %n.addr.0 = phi i32 [ %n, %entry ], [ %add1, %if.end ]
  %cmp = icmp slt i32 0, %n.addr.0
  br i1 %cmp, label %while.body, label %while.end7

while.body:                                       ; preds = %while.cond
  %call = call i32 @rand() #2
  %rem = srem i32 %call, 7
  %add = add nsw i32 3, %i.0
  %sub = sub nsw i32 %rem, %add
  %add1 = add nsw i32 %n.addr.0, %sub
  %cmp2 = icmp sgt i32 %i.0, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  br label %if.end

if.else:                                          ; preds = %while.body
  br label %while.cond3

while.cond3:                                      ; preds = %while.body5, %if.else
  %j.0 = phi i32 [ %i.0, %if.else ], [ %mul, %while.body5 ]
  %i.1 = phi i32 [ %sub, %if.else ], [ %mul6, %while.body5 ]
  %cmp4 = icmp slt i32 %i.1, %j.0
  br i1 %cmp4, label %while.body5, label %while.end

while.body5:                                      ; preds = %while.cond3
  %mul = mul nsw i32 %j.0, 3
  %mul6 = mul nsw i32 %i.1, 4
  br label %while.cond3, !llvm.loop !6

while.end:                                        ; preds = %while.cond3
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  %i.2 = phi i32 [ %i.0, %if.then ], [ %i.1, %while.end ]
  br label %while.cond, !llvm.loop !8

while.end7:                                       ; preds = %while.cond
  ret i32 %i.0
}

; Function Attrs: nounwind
declare i32 @rand() #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git ce919e92afed6522fae11fdf69158b4b9ead2296)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
