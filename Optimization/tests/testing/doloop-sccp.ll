; ModuleID = '<stdin>'
source_filename = "tests/testing/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %n, ptr noalias noundef %p, ptr noalias noundef %q) #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %i.1, %do.cond ]
  %n.addr.0 = phi i32 [ %n, %entry ], [ %add1, %do.cond ]
  %cmp = icmp sgt i32 %i.0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  store i32 %n, ptr %p, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  %div = sdiv i32 %n, -3
  %add = add nsw i32 1, %i.0
  %sub = sub nsw i32 %div, %add
  %add1 = add nsw i32 %n.addr.0, %sub
  %cmp2 = icmp sgt i32 %i.0, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %i.1 = phi i32 [ %i.0, %if.then3 ], [ %sub, %if.end ]
  store i32 %n, ptr %q, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end4
  %cmp5 = icmp slt i32 0, %add1
  br i1 %cmp5, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  ret i32 %i.1
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git bd76a3d41b4001cc1224acf7e88bb2644f8829e2)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
