; ModuleID = '<stdin>'
source_filename = "tests/correctness/la3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %11, %1
  %.08 = phi i32 [ 5, %1 ], [ %10, %11 ]
  %.02 = phi i32 [ 25, %1 ], [ %.13, %11 ]
  %.01 = phi i32 [ 5, %1 ], [ %.1, %11 ]
  br label %3

3:                                                ; preds = %6, %2
  %.13 = phi i32 [ %.02, %2 ], [ %8, %6 ]
  %.1 = phi i32 [ %.01, %2 ], [ %7, %6 ]
  %4 = add nsw i32 %.1, %.13
  %5 = icmp slt i32 %4, %.08
  br i1 %5, label %6, label %9

6:                                                ; preds = %3
  %7 = add nsw i32 %.1, 1
  %8 = add nsw i32 %.13, 1
  br label %3, !llvm.loop !6

9:                                                ; preds = %3
  %10 = add nsw i32 %.08, 1
  br label %11

11:                                               ; preds = %9
  %12 = icmp slt i32 %.1, %0
  br i1 %12, label %2, label %13, !llvm.loop !8

13:                                               ; preds = %11
  br label %14

14:                                               ; preds = %23, %13
  %.19 = phi i32 [ %10, %13 ], [ %22, %23 ]
  %.24 = phi i32 [ %.13, %13 ], [ %.35, %23 ]
  %.2 = phi i32 [ %.1, %13 ], [ %.3, %23 ]
  br label %15

15:                                               ; preds = %18, %14
  %.35 = phi i32 [ %.24, %14 ], [ %20, %18 ]
  %.3 = phi i32 [ %.2, %14 ], [ %19, %18 ]
  %16 = add nsw i32 %.3, %.35
  %17 = icmp slt i32 %16, %.19
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = add nsw i32 %.3, 1
  %20 = add nsw i32 %.35, 1
  br label %15, !llvm.loop !9

21:                                               ; preds = %15
  %22 = add nsw i32 %.19, 1
  br label %23

23:                                               ; preds = %21
  %24 = icmp slt i32 %.3, %0
  br i1 %24, label %14, label %25, !llvm.loop !10

25:                                               ; preds = %23
  store i32 %.3, ptr @m, align 16
  store i32 %.35, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %22, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %26 = load i32, ptr @m, align 16
  %27 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %30 = add nsw i32 %28, %29
  store i32 %30, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %31 = load i32, ptr @m, align 16
  %32 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %35 = sub nsw i32 %33, %34
  store i32 %35, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %36 = load i32, ptr @m, align 16
  %37 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %38 = sub nsw i32 %36, %37
  %39 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %41 = load i32, ptr @m, align 16
  %42 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %43 = sub nsw i32 %41, %42
  %44 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %45 = sub nsw i32 %43, %44
  store i32 %45, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 6), align 8
  br label %46

46:                                               ; preds = %55, %25
  %.011 = phi i32 [ 0, %25 ], [ %56, %55 ]
  %47 = icmp slt i32 %.011, 10
  br i1 %47, label %48, label %57

48:                                               ; preds = %46
  %49 = sext i32 %.011 to i64
  %50 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %.011 to i64
  %54 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %53
  store i32 %52, ptr %54, align 4
  br label %55

55:                                               ; preds = %48
  %56 = add nsw i32 %.011, 1
  br label %46, !llvm.loop !11

57:                                               ; preds = %46
  br label %58

58:                                               ; preds = %71, %57
  %.012 = phi i32 [ 1, %57 ], [ %72, %71 ]
  %59 = icmp slt i32 %.012, 10
  br i1 %59, label %60, label %73

60:                                               ; preds = %58
  %61 = sext i32 %.012 to i64
  %62 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = sub nsw i32 %.012, 1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = add nsw i32 %63, %67
  %69 = sext i32 %.012 to i64
  %70 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %69
  store i32 %68, ptr %70, align 4
  br label %71

71:                                               ; preds = %60
  %72 = add nsw i32 %.012, 1
  br label %58, !llvm.loop !12

73:                                               ; preds = %58
  br label %74

74:                                               ; preds = %87, %73
  %.013 = phi i32 [ 0, %73 ], [ %88, %87 ]
  %75 = icmp slt i32 %.013, 9
  br i1 %75, label %76, label %89

76:                                               ; preds = %74
  %77 = sext i32 %.013 to i64
  %78 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = add nsw i32 %.013, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = add nsw i32 %79, %83
  %85 = sext i32 %.013 to i64
  %86 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %85
  store i32 %84, ptr %86, align 4
  br label %87

87:                                               ; preds = %76
  %88 = add nsw i32 %.013, 1
  br label %74, !llvm.loop !13

89:                                               ; preds = %74
  br label %90

90:                                               ; preds = %117, %89
  %.210 = phi i32 [ %22, %89 ], [ %98, %117 ]
  %.46 = phi i32 [ %.35, %89 ], [ %.57, %117 ]
  %.4 = phi i32 [ %.3, %89 ], [ %.5, %117 ]
  br label %91

91:                                               ; preds = %94, %90
  %.57 = phi i32 [ %.46, %90 ], [ %96, %94 ]
  %.5 = phi i32 [ %.4, %90 ], [ %95, %94 ]
  %92 = add nsw i32 %.5, %.57
  %93 = icmp slt i32 %92, %.210
  br i1 %93, label %94, label %97

94:                                               ; preds = %91
  %95 = add nsw i32 %.5, 1
  %96 = add nsw i32 %.57, 1
  br label %91, !llvm.loop !14

97:                                               ; preds = %91
  %98 = add nsw i32 %.210, 1
  %99 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %100 = add nsw i32 %99, %.57
  store i32 %100, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  br label %101

101:                                              ; preds = %114, %97
  %.0 = phi i32 [ 0, %97 ], [ %115, %114 ]
  %102 = icmp slt i32 %.0, 9
  br i1 %102, label %103, label %116

103:                                              ; preds = %101
  %104 = sext i32 %.0 to i64
  %105 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = add nsw i32 %.0, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = add nsw i32 %106, %110
  %112 = sext i32 %.0 to i64
  %113 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %112
  store i32 %111, ptr %113, align 4
  br label %114

114:                                              ; preds = %103
  %115 = add nsw i32 %.0, 1
  br label %101, !llvm.loop !15

116:                                              ; preds = %101
  br label %117

117:                                              ; preds = %116
  %118 = load i32, ptr @m, align 16
  %119 = icmp slt i32 %118, %0
  br i1 %119, label %90, label %120, !llvm.loop !16

120:                                              ; preds = %117
  %121 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  ret i32 %121
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
