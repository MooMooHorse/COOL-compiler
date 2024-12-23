; ModuleID = '<stdin>'
source_filename = "tests/correctness/la2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = mul nsw i32 5, 5
  %3 = add nsw i32 %2, 5
  %4 = sub nsw i32 %3, %2
  br label %5

5:                                                ; preds = %24, %1
  %.04 = phi i32 [ %2, %1 ], [ %.15, %24 ]
  %.01 = phi i32 [ 5, %1 ], [ %.12, %24 ]
  %.0 = phi i32 [ %4, %1 ], [ %23, %24 ]
  br label %6

6:                                                ; preds = %21, %5
  %.15 = phi i32 [ %.04, %5 ], [ %.37, %21 ]
  %.12 = phi i32 [ %.01, %5 ], [ %13, %21 ]
  %7 = add nsw i32 %.12, %.15
  %8 = icmp slt i32 %7, %.0
  br i1 %8, label %9, label %22

9:                                                ; preds = %6
  %10 = add nsw i32 %.12, 1
  %11 = add nsw i32 %.15, 1
  br label %12

12:                                               ; preds = %18, %9
  %.26 = phi i32 [ %11, %9 ], [ %.37, %18 ]
  %.23 = phi i32 [ %10, %9 ], [ %13, %18 ]
  %13 = mul nsw i32 %.23, %.23
  %14 = icmp sgt i32 %13, 10
  br i1 %14, label %15, label %17

15:                                               ; preds = %12
  %16 = mul nsw i32 %.26, %.26
  br label %17

17:                                               ; preds = %15, %12
  %.37 = phi i32 [ %16, %15 ], [ %.26, %12 ]
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
  %25 = icmp slt i32 %.12, %0
  br i1 %25, label %5, label %26, !llvm.loop !9

26:                                               ; preds = %24
  br label %27

27:                                               ; preds = %46, %26
  %.48 = phi i32 [ %.15, %26 ], [ %.59, %46 ]
  %.3 = phi i32 [ 50, %26 ], [ %.4, %46 ]
  %.1 = phi i32 [ %23, %26 ], [ %45, %46 ]
  br label %28

28:                                               ; preds = %43, %27
  %.59 = phi i32 [ %.48, %27 ], [ %.711, %43 ]
  %.4 = phi i32 [ %.3, %27 ], [ %35, %43 ]
  %29 = add nsw i32 %.4, %.59
  %30 = icmp slt i32 %29, %.1
  br i1 %30, label %31, label %44

31:                                               ; preds = %28
  %32 = add nsw i32 %.4, 1
  %33 = add nsw i32 %.59, 1
  br label %34

34:                                               ; preds = %40, %31
  %.610 = phi i32 [ %33, %31 ], [ %.711, %40 ]
  %.5 = phi i32 [ %32, %31 ], [ %35, %40 ]
  %35 = mul nsw i32 %.5, %.5
  %36 = icmp sgt i32 %35, 10
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = mul nsw i32 %.610, %.610
  br label %39

39:                                               ; preds = %37, %34
  %.711 = phi i32 [ %38, %37 ], [ %.610, %34 ]
  br label %40

40:                                               ; preds = %39
  %41 = mul nsw i32 %0, %0
  %42 = icmp slt i32 %35, %41
  br i1 %42, label %34, label %43, !llvm.loop !10

43:                                               ; preds = %40
  br label %28, !llvm.loop !11

44:                                               ; preds = %28
  %45 = add nsw i32 %.1, 1
  br label %46

46:                                               ; preds = %44
  %47 = icmp slt i32 %.4, %0
  br i1 %47, label %27, label %48, !llvm.loop !12

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %68, %48
  %.812 = phi i32 [ %.59, %48 ], [ %.9, %68 ]
  %.6 = phi i32 [ %0, %48 ], [ %.7, %68 ]
  %.2 = phi i32 [ %45, %48 ], [ %67, %68 ]
  br label %50

50:                                               ; preds = %65, %49
  %.9 = phi i32 [ %.812, %49 ], [ %.11, %65 ]
  %.7 = phi i32 [ %.6, %49 ], [ %57, %65 ]
  %51 = add nsw i32 %.7, %.9
  %52 = icmp slt i32 %51, %.2
  br i1 %52, label %53, label %66

53:                                               ; preds = %50
  %54 = add nsw i32 %.7, 1
  %55 = add nsw i32 %.9, 1
  br label %56

56:                                               ; preds = %62, %53
  %.10 = phi i32 [ %55, %53 ], [ %.11, %62 ]
  %.8 = phi i32 [ %54, %53 ], [ %57, %62 ]
  %57 = mul nsw i32 %.8, %.8
  %58 = icmp sgt i32 %57, 10
  br i1 %58, label %59, label %61

59:                                               ; preds = %56
  %60 = mul nsw i32 %.10, %.10
  br label %61

61:                                               ; preds = %59, %56
  %.11 = phi i32 [ %60, %59 ], [ %.10, %56 ]
  br label %62

62:                                               ; preds = %61
  %63 = mul nsw i32 %0, %0
  %64 = icmp slt i32 %57, %63
  br i1 %64, label %56, label %65, !llvm.loop !13

65:                                               ; preds = %62
  br label %50, !llvm.loop !14

66:                                               ; preds = %50
  %67 = add nsw i32 %.2, 1
  br label %68

68:                                               ; preds = %66
  %69 = icmp slt i32 %.7, %0
  br i1 %69, label %49, label %70, !llvm.loop !15

70:                                               ; preds = %68
  ret i32 %67
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
