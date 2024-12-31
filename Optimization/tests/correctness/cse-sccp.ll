; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %mul = mul nsw i32 20, 30
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %b.0 = phi i32 [ -10, %entry ], [ %b.1, %if.end ]
  %x.0 = phi i32 [ 20, %entry ], [ %add7, %if.end ]
  %cmp = icmp slt i32 %x.0, 30
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add1 = add nsw i32 %x.0, 30
  %cmp2 = icmp slt i32 %add1, 50
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %sub3 = sub nsw i32 %x.0, 30
  %sub4 = sub nsw i32 %x.0, 30
  br label %if.end

if.else:                                          ; preds = %while.body
  %mul5 = mul nsw i32 %x.0, 30
  %mul6 = mul nsw i32 %x.0, 30
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %b.1 = phi i32 [ %sub4, %if.then ], [ %mul6, %if.else ]
  %add7 = add nsw i32 %x.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  ret i32 %b.0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
