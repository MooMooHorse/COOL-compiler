; ModuleID = '<stdin>'
source_filename = "tests/correctness/la3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = mul nsw i32 5, 5
  %3 = mul nsw i32 5, 5
  %4 = add nsw i32 %3, 5
  %5 = sub nsw i32 %4, %2
  br label %6

6:                                                ; preds = %15, %1
  %.08 = phi i32 [ %5, %1 ], [ %14, %15 ]
  %.02 = phi i32 [ %2, %1 ], [ %.13, %15 ]
  %.01 = phi i32 [ 5, %1 ], [ %.1, %15 ]
  br label %7

7:                                                ; preds = %10, %6
  %.13 = phi i32 [ %.02, %6 ], [ %12, %10 ]
  %.1 = phi i32 [ %.01, %6 ], [ %11, %10 ]
  %8 = add nsw i32 %.1, %.13
  %9 = icmp slt i32 %8, %.08
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = add nsw i32 %.1, 1
  %12 = add nsw i32 %.13, 1
  br label %7, !llvm.loop !6

13:                                               ; preds = %7
  %14 = add nsw i32 %.08, 1
  br label %15

15:                                               ; preds = %13
  %16 = icmp slt i32 %.1, %0
  br i1 %16, label %6, label %17, !llvm.loop !8

17:                                               ; preds = %15
  br label %18

18:                                               ; preds = %27, %17
  %.19 = phi i32 [ %14, %17 ], [ %26, %27 ]
  %.24 = phi i32 [ %.13, %17 ], [ %.35, %27 ]
  %.2 = phi i32 [ %.1, %17 ], [ %.3, %27 ]
  br label %19

19:                                               ; preds = %22, %18
  %.35 = phi i32 [ %.24, %18 ], [ %24, %22 ]
  %.3 = phi i32 [ %.2, %18 ], [ %23, %22 ]
  %20 = add nsw i32 %.3, %.35
  %21 = icmp slt i32 %20, %.19
  br i1 %21, label %22, label %25

22:                                               ; preds = %19
  %23 = add nsw i32 %.3, 1
  %24 = add nsw i32 %.35, 1
  br label %19, !llvm.loop !9

25:                                               ; preds = %19
  %26 = add nsw i32 %.19, 1
  br label %27

27:                                               ; preds = %25
  %28 = icmp slt i32 %.3, %0
  br i1 %28, label %18, label %29, !llvm.loop !10

29:                                               ; preds = %27
  store i32 %.3, ptr @m, align 16
  store i32 %.35, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %26, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %30 = load i32, ptr @m, align 16
  %31 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %34 = add nsw i32 %32, %33
  store i32 %34, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %35 = load i32, ptr @m, align 16
  %36 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %37 = add nsw i32 %35, %36
  %38 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %39 = sub nsw i32 %37, %38
  store i32 %39, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %40 = load i32, ptr @m, align 16
  %41 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %42 = sub nsw i32 %40, %41
  %43 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %44 = add nsw i32 %42, %43
  store i32 %44, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %45 = load i32, ptr @m, align 16
  %46 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %47 = sub nsw i32 %45, %46
  %48 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %49 = sub nsw i32 %47, %48
  store i32 %49, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 6), align 8
  br label %50

50:                                               ; preds = %59, %29
  %.011 = phi i32 [ 0, %29 ], [ %60, %59 ]
  %51 = icmp slt i32 %.011, 10
  br i1 %51, label %52, label %61

52:                                               ; preds = %50
  %53 = sext i32 %.011 to i64
  %54 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = add nsw i32 %55, 1
  %57 = sext i32 %.011 to i64
  %58 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %57
  store i32 %56, ptr %58, align 4
  br label %59

59:                                               ; preds = %52
  %60 = add nsw i32 %.011, 1
  br label %50, !llvm.loop !11

61:                                               ; preds = %50
  br label %62

62:                                               ; preds = %75, %61
  %.012 = phi i32 [ 1, %61 ], [ %76, %75 ]
  %63 = icmp slt i32 %.012, 10
  br i1 %63, label %64, label %77

64:                                               ; preds = %62
  %65 = sext i32 %.012 to i64
  %66 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = sub nsw i32 %.012, 1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = add nsw i32 %67, %71
  %73 = sext i32 %.012 to i64
  %74 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %73
  store i32 %72, ptr %74, align 4
  br label %75

75:                                               ; preds = %64
  %76 = add nsw i32 %.012, 1
  br label %62, !llvm.loop !12

77:                                               ; preds = %62
  br label %78

78:                                               ; preds = %91, %77
  %.013 = phi i32 [ 0, %77 ], [ %92, %91 ]
  %79 = icmp slt i32 %.013, 9
  br i1 %79, label %80, label %93

80:                                               ; preds = %78
  %81 = sext i32 %.013 to i64
  %82 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = add nsw i32 %.013, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = add nsw i32 %83, %87
  %89 = sext i32 %.013 to i64
  %90 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %89
  store i32 %88, ptr %90, align 4
  br label %91

91:                                               ; preds = %80
  %92 = add nsw i32 %.013, 1
  br label %78, !llvm.loop !13

93:                                               ; preds = %78
  br label %94

94:                                               ; preds = %121, %93
  %.210 = phi i32 [ %26, %93 ], [ %102, %121 ]
  %.46 = phi i32 [ %.35, %93 ], [ %.57, %121 ]
  %.4 = phi i32 [ %.3, %93 ], [ %.5, %121 ]
  br label %95

95:                                               ; preds = %98, %94
  %.57 = phi i32 [ %.46, %94 ], [ %100, %98 ]
  %.5 = phi i32 [ %.4, %94 ], [ %99, %98 ]
  %96 = add nsw i32 %.5, %.57
  %97 = icmp slt i32 %96, %.210
  br i1 %97, label %98, label %101

98:                                               ; preds = %95
  %99 = add nsw i32 %.5, 1
  %100 = add nsw i32 %.57, 1
  br label %95, !llvm.loop !14

101:                                              ; preds = %95
  %102 = add nsw i32 %.210, 1
  %103 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %104 = add nsw i32 %103, %.57
  store i32 %104, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  br label %105

105:                                              ; preds = %118, %101
  %.0 = phi i32 [ 0, %101 ], [ %119, %118 ]
  %106 = icmp slt i32 %.0, 9
  br i1 %106, label %107, label %120

107:                                              ; preds = %105
  %108 = sext i32 %.0 to i64
  %109 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = add nsw i32 %.0, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = add nsw i32 %110, %114
  %116 = sext i32 %.0 to i64
  %117 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %116
  store i32 %115, ptr %117, align 4
  br label %118

118:                                              ; preds = %107
  %119 = add nsw i32 %.0, 1
  br label %105, !llvm.loop !15

120:                                              ; preds = %105
  br label %121

121:                                              ; preds = %120
  %122 = load i32, ptr @m, align 16
  %123 = icmp slt i32 %122, %0
  br i1 %123, label %94, label %124, !llvm.loop !16

124:                                              ; preds = %121
  %125 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  ret i32 %125
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
