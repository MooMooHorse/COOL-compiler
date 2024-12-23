; ModuleID = '<stdin>'
source_filename = "tests/correctness/la2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %21, %1
  %.04 = phi i32 [ 25, %1 ], [ %.15, %21 ]
  %.01 = phi i32 [ 5, %1 ], [ %.12, %21 ]
  %.0 = phi i32 [ 5, %1 ], [ %20, %21 ]
  br label %3

3:                                                ; preds = %18, %2
  %.15 = phi i32 [ %.04, %2 ], [ %.37, %18 ]
  %.12 = phi i32 [ %.01, %2 ], [ %10, %18 ]
  %4 = add nsw i32 %.12, %.15
  %5 = icmp slt i32 %4, %.0
  br i1 %5, label %6, label %19

6:                                                ; preds = %3
  %7 = add nsw i32 %.12, 1
  %8 = add nsw i32 %.15, 1
  br label %9

9:                                                ; preds = %15, %6
  %.26 = phi i32 [ %8, %6 ], [ %.37, %15 ]
  %.23 = phi i32 [ %7, %6 ], [ %10, %15 ]
  %10 = mul nsw i32 %.23, %.23
  %11 = icmp sgt i32 %10, 10
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = mul nsw i32 %.26, %.26
  br label %14

14:                                               ; preds = %12, %9
  %.37 = phi i32 [ %13, %12 ], [ %.26, %9 ]
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
  %22 = icmp slt i32 %.12, %0
  br i1 %22, label %2, label %23, !llvm.loop !9

23:                                               ; preds = %21
  br label %24

24:                                               ; preds = %43, %23
  %.48 = phi i32 [ %.15, %23 ], [ %.59, %43 ]
  %.3 = phi i32 [ 50, %23 ], [ %.4, %43 ]
  %.1 = phi i32 [ %20, %23 ], [ %42, %43 ]
  br label %25

25:                                               ; preds = %40, %24
  %.59 = phi i32 [ %.48, %24 ], [ %.711, %40 ]
  %.4 = phi i32 [ %.3, %24 ], [ %32, %40 ]
  %26 = add nsw i32 %.4, %.59
  %27 = icmp slt i32 %26, %.1
  br i1 %27, label %28, label %41

28:                                               ; preds = %25
  %29 = add nsw i32 %.4, 1
  %30 = add nsw i32 %.59, 1
  br label %31

31:                                               ; preds = %37, %28
  %.610 = phi i32 [ %30, %28 ], [ %.711, %37 ]
  %.5 = phi i32 [ %29, %28 ], [ %32, %37 ]
  %32 = mul nsw i32 %.5, %.5
  %33 = icmp sgt i32 %32, 10
  br i1 %33, label %34, label %36

34:                                               ; preds = %31
  %35 = mul nsw i32 %.610, %.610
  br label %36

36:                                               ; preds = %34, %31
  %.711 = phi i32 [ %35, %34 ], [ %.610, %31 ]
  br label %37

37:                                               ; preds = %36
  %38 = mul nsw i32 %0, %0
  %39 = icmp slt i32 %32, %38
  br i1 %39, label %31, label %40, !llvm.loop !10

40:                                               ; preds = %37
  br label %25, !llvm.loop !11

41:                                               ; preds = %25
  %42 = add nsw i32 %.1, 1
  br label %43

43:                                               ; preds = %41
  %44 = icmp slt i32 %.4, %0
  br i1 %44, label %24, label %45, !llvm.loop !12

45:                                               ; preds = %43
  br label %46

46:                                               ; preds = %65, %45
  %.812 = phi i32 [ %.59, %45 ], [ %.9, %65 ]
  %.6 = phi i32 [ %0, %45 ], [ %.7, %65 ]
  %.2 = phi i32 [ %42, %45 ], [ %64, %65 ]
  br label %47

47:                                               ; preds = %62, %46
  %.9 = phi i32 [ %.812, %46 ], [ %.11, %62 ]
  %.7 = phi i32 [ %.6, %46 ], [ %54, %62 ]
  %48 = add nsw i32 %.7, %.9
  %49 = icmp slt i32 %48, %.2
  br i1 %49, label %50, label %63

50:                                               ; preds = %47
  %51 = add nsw i32 %.7, 1
  %52 = add nsw i32 %.9, 1
  br label %53

53:                                               ; preds = %59, %50
  %.10 = phi i32 [ %52, %50 ], [ %.11, %59 ]
  %.8 = phi i32 [ %51, %50 ], [ %54, %59 ]
  %54 = mul nsw i32 %.8, %.8
  %55 = icmp sgt i32 %54, 10
  br i1 %55, label %56, label %58

56:                                               ; preds = %53
  %57 = mul nsw i32 %.10, %.10
  br label %58

58:                                               ; preds = %56, %53
  %.11 = phi i32 [ %57, %56 ], [ %.10, %53 ]
  br label %59

59:                                               ; preds = %58
  %60 = mul nsw i32 %0, %0
  %61 = icmp slt i32 %54, %60
  br i1 %61, label %53, label %62, !llvm.loop !13

62:                                               ; preds = %59
  br label %47, !llvm.loop !14

63:                                               ; preds = %47
  %64 = add nsw i32 %.2, 1
  br label %65

65:                                               ; preds = %63
  %66 = icmp slt i32 %.7, %0
  br i1 %66, label %46, label %67, !llvm.loop !15

67:                                               ; preds = %65
  ret i32 %64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 @crazy_loops(i32 noundef 50)
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
