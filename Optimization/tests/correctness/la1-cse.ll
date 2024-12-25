; ModuleID = '<stdin>'
source_filename = "tests/correctness/la1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %p) #0 {
entry:
  %mul = mul nsw i32 5, 5
  %add = add nsw i32 %mul, 5
  %sub = sub nsw i32 %add, %mul
  br label %do.body

do.body:                                          ; preds = %do.cond12, %entry
  %y.0 = phi i32 [ %mul, %entry ], [ %y.1, %do.cond12 ]
  %x.0 = phi i32 [ 5, %entry ], [ %x.1, %do.cond12 ]
  %z.0 = phi i32 [ %sub, %entry ], [ %add11, %do.cond12 ]
  br label %while.cond

while.cond:                                       ; preds = %do.end, %do.body
  %y.1 = phi i32 [ %y.0, %do.body ], [ %y.3, %do.end ]
  %x.1 = phi i32 [ %x.0, %do.body ], [ %mul6, %do.end ]
  %add2 = add nsw i32 %x.1, %y.1
  %cmp = icmp slt i32 %add2, %z.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add3 = add nsw i32 %x.1, 1
  %add4 = add nsw i32 %y.1, 1
  br label %do.body5

do.body5:                                         ; preds = %do.cond, %while.body
  %y.2 = phi i32 [ %add4, %while.body ], [ %y.3, %do.cond ]
  %x.2 = phi i32 [ %add3, %while.body ], [ %mul6, %do.cond ]
  %mul6 = mul nsw i32 %x.2, %x.2
  %cmp7 = icmp sgt i32 %mul6, 10
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %do.body5
  %mul8 = mul nsw i32 %y.2, %y.2
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body5
  %y.3 = phi i32 [ %mul8, %if.then ], [ %y.2, %do.body5 ]
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %mul9 = mul nsw i32 %p, %p
  %cmp10 = icmp slt i32 %mul6, %mul9
  br i1 %cmp10, label %do.body5, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %add11 = add nsw i32 %z.0, 1
  br label %do.cond12

do.cond12:                                        ; preds = %while.end
  %cmp13 = icmp slt i32 %x.1, %p
  br i1 %cmp13, label %do.body, label %do.end14, !llvm.loop !9

do.end14:                                         ; preds = %do.cond12
  ret i32 %add11
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @crazy_loops(i32 noundef 1000)
  ret i32 %call
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
