; ModuleID = '<stdin>'
source_filename = "tests/correctness/la1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = mul nsw i32 5, 5
  %3 = add nsw i32 %2, 5
  %4 = sub nsw i32 %3, %2
  br label %5

5:                                                ; preds = %24, %1
  %.02 = phi i32 [ %2, %1 ], [ %.13, %24 ]
  %.01 = phi i32 [ 5, %1 ], [ %.1, %24 ]
  %.0 = phi i32 [ %4, %1 ], [ %23, %24 ]
  br label %6

6:                                                ; preds = %21, %5
  %.13 = phi i32 [ %.02, %5 ], [ %.3, %21 ]
  %.1 = phi i32 [ %.01, %5 ], [ %13, %21 ]
  %7 = add nsw i32 %.1, %.13
  %8 = icmp slt i32 %7, %.0
  br i1 %8, label %9, label %22

9:                                                ; preds = %6
  %10 = add nsw i32 %.1, 1
  %11 = add nsw i32 %.13, 1
  br label %12

12:                                               ; preds = %18, %9
  %.24 = phi i32 [ %11, %9 ], [ %.3, %18 ]
  %.2 = phi i32 [ %10, %9 ], [ %13, %18 ]
  %13 = mul nsw i32 %.2, %.2
  %14 = icmp sgt i32 %13, 10
  br i1 %14, label %15, label %17

15:                                               ; preds = %12
  %16 = mul nsw i32 %.24, %.24
  br label %17

17:                                               ; preds = %15, %12
  %.3 = phi i32 [ %16, %15 ], [ %.24, %12 ]
  br label %18

18:                                               ; preds = %17
  %19 = mul nsw i32 %0, %0
  %20 = icmp slt i32 %13, %19
  br i1 %20, label %12, label %21, !llvm.loop !6

21:                                               ; preds = %18
  br label %6, !llvm.loop !8

22:                                               ; preds = %6
  %23 = add nsw i32 %.0, 1
  br label %24

24:                                               ; preds = %22
  %25 = icmp slt i32 %.1, %0
  br i1 %25, label %5, label %26, !llvm.loop !9

26:                                               ; preds = %24
  ret i32 %23
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
