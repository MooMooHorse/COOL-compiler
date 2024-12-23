; ModuleID = '<stdin>'
source_filename = "tests/correctness/la1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %21, %1
  %.02 = phi i32 [ 25, %1 ], [ %.13, %21 ]
  %.01 = phi i32 [ 5, %1 ], [ %.1, %21 ]
  %.0 = phi i32 [ 5, %1 ], [ %20, %21 ]
  br label %3

3:                                                ; preds = %18, %2
  %.13 = phi i32 [ %.02, %2 ], [ %.3, %18 ]
  %.1 = phi i32 [ %.01, %2 ], [ %10, %18 ]
  %4 = add nsw i32 %.1, %.13
  %5 = icmp slt i32 %4, %.0
  br i1 %5, label %6, label %19

6:                                                ; preds = %3
  %7 = add nsw i32 %.1, 1
  %8 = add nsw i32 %.13, 1
  br label %9

9:                                                ; preds = %15, %6
  %.24 = phi i32 [ %8, %6 ], [ %.3, %15 ]
  %.2 = phi i32 [ %7, %6 ], [ %10, %15 ]
  %10 = mul nsw i32 %.2, %.2
  %11 = icmp sgt i32 %10, 10
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = mul nsw i32 %.24, %.24
  br label %14

14:                                               ; preds = %12, %9
  %.3 = phi i32 [ %13, %12 ], [ %.24, %9 ]
  br label %15

15:                                               ; preds = %14
  %16 = mul nsw i32 %0, %0
  %17 = icmp slt i32 %10, %16
  br i1 %17, label %9, label %18, !llvm.loop !6

18:                                               ; preds = %15
  br label %3, !llvm.loop !8

19:                                               ; preds = %3
  %20 = add nsw i32 %.0, 1
  br label %21

21:                                               ; preds = %19
  %22 = icmp slt i32 %.1, %0
  br i1 %22, label %2, label %23, !llvm.loop !9

23:                                               ; preds = %21
  ret i32 %20
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 @crazy_loops(i32 noundef 1000)
  ret i32 %1
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
