; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = mul nsw i32 20, 30
  br label %2

2:                                                ; preds = %13, %0
  %.01 = phi i32 [ -10, %0 ], [ %.1, %13 ]
  %.0 = phi i32 [ 20, %0 ], [ %14, %13 ]
  %3 = icmp slt i32 %.0, 30
  br i1 %3, label %4, label %15

4:                                                ; preds = %2
  %5 = add nsw i32 %.0, 30
  %6 = icmp slt i32 %5, 50
  br i1 %6, label %7, label %10

7:                                                ; preds = %4
  %8 = sub nsw i32 %.0, 30
  %9 = sub nsw i32 %.0, 30
  br label %13

10:                                               ; preds = %4
  %11 = mul nsw i32 %.0, 30
  %12 = mul nsw i32 %.0, 30
  br label %13

13:                                               ; preds = %10, %7
  %.1 = phi i32 [ %9, %7 ], [ %12, %10 ]
  %14 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

15:                                               ; preds = %2
  ret i32 %.01
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
