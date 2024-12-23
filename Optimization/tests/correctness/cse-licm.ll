; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = add nsw i32 20, 30
  %2 = sub nsw i32 20, 30
  %3 = mul nsw i32 20, 30
  br label %4

4:                                                ; preds = %15, %0
  %.01 = phi i32 [ %2, %0 ], [ %.1, %15 ]
  %.0 = phi i32 [ 20, %0 ], [ %16, %15 ]
  %5 = icmp slt i32 %.0, 30
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = add nsw i32 %.0, 30
  %8 = icmp slt i32 %7, %1
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = sub nsw i32 %.0, 30
  %11 = sub nsw i32 %.0, 30
  br label %15

12:                                               ; preds = %6
  %13 = mul nsw i32 %.0, 30
  %14 = mul nsw i32 %.0, 30
  br label %15

15:                                               ; preds = %12, %9
  %.1 = phi i32 [ %11, %9 ], [ %14, %12 ]
  %16 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

17:                                               ; preds = %4
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
