; ModuleID = '<stdin>'
source_filename = "tests/correctness/la2.c"
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
  %.04 = phi i32 [ %2, %1 ], [ %.15, %25 ]
  %.01 = phi i32 [ 5, %1 ], [ %.12, %25 ]
  %.0 = phi i32 [ %5, %1 ], [ %24, %25 ]
  br label %8

8:                                                ; preds = %22, %7
  %.15 = phi i32 [ %.04, %7 ], [ %.37, %22 ]
  %.12 = phi i32 [ %.01, %7 ], [ %15, %22 ]
  %9 = add nsw i32 %.12, %.15
  %10 = icmp slt i32 %9, %.0
  br i1 %10, label %11, label %23

11:                                               ; preds = %8
  %12 = add nsw i32 %.12, 1
  %13 = add nsw i32 %.15, 1
  br label %14

14:                                               ; preds = %20, %11
  %.26 = phi i32 [ %13, %11 ], [ %.37, %20 ]
  %.23 = phi i32 [ %12, %11 ], [ %15, %20 ]
  %15 = mul nsw i32 %.23, %.23
  %16 = icmp sgt i32 %15, 10
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = mul nsw i32 %.26, %.26
  br label %19

19:                                               ; preds = %17, %14
  %.37 = phi i32 [ %18, %17 ], [ %.26, %14 ]
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
  %26 = icmp slt i32 %.12, %0
  br i1 %26, label %7, label %27, !llvm.loop !9

27:                                               ; preds = %25
  %28 = mul nsw i32 %0, %0
  br label %29

29:                                               ; preds = %47, %27
  %.48 = phi i32 [ %.15, %27 ], [ %.59, %47 ]
  %.3 = phi i32 [ 50, %27 ], [ %.4, %47 ]
  %.1 = phi i32 [ %24, %27 ], [ %46, %47 ]
  br label %30

30:                                               ; preds = %44, %29
  %.59 = phi i32 [ %.48, %29 ], [ %.711, %44 ]
  %.4 = phi i32 [ %.3, %29 ], [ %37, %44 ]
  %31 = add nsw i32 %.4, %.59
  %32 = icmp slt i32 %31, %.1
  br i1 %32, label %33, label %45

33:                                               ; preds = %30
  %34 = add nsw i32 %.4, 1
  %35 = add nsw i32 %.59, 1
  br label %36

36:                                               ; preds = %42, %33
  %.610 = phi i32 [ %35, %33 ], [ %.711, %42 ]
  %.5 = phi i32 [ %34, %33 ], [ %37, %42 ]
  %37 = mul nsw i32 %.5, %.5
  %38 = icmp sgt i32 %37, 10
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = mul nsw i32 %.610, %.610
  br label %41

41:                                               ; preds = %39, %36
  %.711 = phi i32 [ %40, %39 ], [ %.610, %36 ]
  br label %42

42:                                               ; preds = %41
  %43 = icmp slt i32 %37, %28
  br i1 %43, label %36, label %44, !llvm.loop !10

44:                                               ; preds = %42
  br label %30, !llvm.loop !11

45:                                               ; preds = %30
  %46 = add nsw i32 %.1, 1
  br label %47

47:                                               ; preds = %45
  %48 = icmp slt i32 %.4, %0
  br i1 %48, label %29, label %49, !llvm.loop !12

49:                                               ; preds = %47
  %50 = mul nsw i32 %0, %0
  br label %51

51:                                               ; preds = %69, %49
  %.812 = phi i32 [ %.59, %49 ], [ %.9, %69 ]
  %.6 = phi i32 [ %0, %49 ], [ %.7, %69 ]
  %.2 = phi i32 [ %46, %49 ], [ %68, %69 ]
  br label %52

52:                                               ; preds = %66, %51
  %.9 = phi i32 [ %.812, %51 ], [ %.11, %66 ]
  %.7 = phi i32 [ %.6, %51 ], [ %59, %66 ]
  %53 = add nsw i32 %.7, %.9
  %54 = icmp slt i32 %53, %.2
  br i1 %54, label %55, label %67

55:                                               ; preds = %52
  %56 = add nsw i32 %.7, 1
  %57 = add nsw i32 %.9, 1
  br label %58

58:                                               ; preds = %64, %55
  %.10 = phi i32 [ %57, %55 ], [ %.11, %64 ]
  %.8 = phi i32 [ %56, %55 ], [ %59, %64 ]
  %59 = mul nsw i32 %.8, %.8
  %60 = icmp sgt i32 %59, 10
  br i1 %60, label %61, label %63

61:                                               ; preds = %58
  %62 = mul nsw i32 %.10, %.10
  br label %63

63:                                               ; preds = %61, %58
  %.11 = phi i32 [ %62, %61 ], [ %.10, %58 ]
  br label %64

64:                                               ; preds = %63
  %65 = icmp slt i32 %59, %50
  br i1 %65, label %58, label %66, !llvm.loop !13

66:                                               ; preds = %64
  br label %52, !llvm.loop !14

67:                                               ; preds = %52
  %68 = add nsw i32 %.2, 1
  br label %69

69:                                               ; preds = %67
  %70 = icmp slt i32 %.7, %0
  br i1 %70, label %51, label %71, !llvm.loop !15

71:                                               ; preds = %69
  ret i32 %68
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
