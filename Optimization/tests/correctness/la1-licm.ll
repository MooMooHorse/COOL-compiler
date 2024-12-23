; ModuleID = '<stdin>'
source_filename = "tests/correctness/la1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = mul nsw i32 5, 5
  %3 = mul nsw i32 5, 5
  %4 = add nsw i32 %3, 5
  %5 = sub nsw i32 %4, %2
  %6 = mul nsw i32 %0, %0
  br label %7

7:                                                ; preds = %25, %1
  %.02 = phi i32 [ %2, %1 ], [ %.13, %25 ]
  %.01 = phi i32 [ 5, %1 ], [ %.1, %25 ]
  %.0 = phi i32 [ %5, %1 ], [ %24, %25 ]
  br label %8

8:                                                ; preds = %22, %7
  %.13 = phi i32 [ %.02, %7 ], [ %.3, %22 ]
  %.1 = phi i32 [ %.01, %7 ], [ %15, %22 ]
  %9 = add nsw i32 %.1, %.13
  %10 = icmp slt i32 %9, %.0
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = add nsw i32 %.1, 1
  %13 = add nsw i32 %.13, 1
  br label %14

14:                                               ; preds = %20, %11
  %.24 = phi i32 [ %13, %11 ], [ %.3, %20 ]
  %.2 = phi i32 [ %12, %11 ], [ %15, %20 ]
  %15 = mul nsw i32 %.2, %.2
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = mul nsw i32 %.24, %.24
  br label %19

19:                                               ; preds = %17, %14
  %.3 = phi i32 [ %18, %17 ], [ %.24, %14 ]
  br label %20

20:                                               ; preds = %19
  %21 = icmp slt i32 %15, %6
  br i1 %21, label %14, label %22, !llvm.loop !6

22:                                               ; preds = %20
  br label %8, !llvm.loop !8

23:                                               ; preds = %8
  %24 = add nsw i32 %.0, 1
  br label %25

25:                                               ; preds = %23
  %26 = icmp slt i32 %.1, %0
  br i1 %26, label %7, label %27, !llvm.loop !9

27:                                               ; preds = %25
  ret i32 %24
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
