; ModuleID = '<stdin>'
source_filename = "tests/correctness/la3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = mul nsw i32 5, 5
  %3 = add nsw i32 %2, 5
  %4 = sub nsw i32 %3, %2
  br label %5

5:                                                ; preds = %14, %1
  %.08 = phi i32 [ %4, %1 ], [ %13, %14 ]
  %.02 = phi i32 [ %2, %1 ], [ %.13, %14 ]
  %.01 = phi i32 [ 5, %1 ], [ %.1, %14 ]
  br label %6

6:                                                ; preds = %9, %5
  %.13 = phi i32 [ %.02, %5 ], [ %11, %9 ]
  %.1 = phi i32 [ %.01, %5 ], [ %10, %9 ]
  %7 = add nsw i32 %.1, %.13
  %8 = icmp slt i32 %7, %.08
  br i1 %8, label %9, label %12

9:                                                ; preds = %6
  %10 = add nsw i32 %.1, 1
  %11 = add nsw i32 %.13, 1
  br label %6, !llvm.loop !6

12:                                               ; preds = %6
  %13 = add nsw i32 %.08, 1
  br label %14

14:                                               ; preds = %12
  %15 = icmp slt i32 %.1, %0
  br i1 %15, label %5, label %16, !llvm.loop !8

16:                                               ; preds = %14
  br label %17

17:                                               ; preds = %26, %16
  %.19 = phi i32 [ %13, %16 ], [ %25, %26 ]
  %.24 = phi i32 [ %.13, %16 ], [ %.35, %26 ]
  %.2 = phi i32 [ %.1, %16 ], [ %.3, %26 ]
  br label %18

18:                                               ; preds = %21, %17
  %.35 = phi i32 [ %.24, %17 ], [ %23, %21 ]
  %.3 = phi i32 [ %.2, %17 ], [ %22, %21 ]
  %19 = add nsw i32 %.3, %.35
  %20 = icmp slt i32 %19, %.19
  br i1 %20, label %21, label %24

21:                                               ; preds = %18
  %22 = add nsw i32 %.3, 1
  %23 = add nsw i32 %.35, 1
  br label %18, !llvm.loop !9

24:                                               ; preds = %18
  %25 = add nsw i32 %.19, 1
  br label %26

26:                                               ; preds = %24
  %27 = icmp slt i32 %.3, %0
  br i1 %27, label %17, label %28, !llvm.loop !10

28:                                               ; preds = %26
  store i32 %.3, ptr @m, align 16
  store i32 %.35, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %25, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %29 = load i32, ptr @m, align 16
  %30 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %34 = load i32, ptr @m, align 16
  %35 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %38 = sub nsw i32 %36, %37
  store i32 %38, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %39 = load i32, ptr @m, align 16
  %40 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %41 = sub nsw i32 %39, %40
  %42 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %43 = add nsw i32 %41, %42
  store i32 %43, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %44 = load i32, ptr @m, align 16
  %45 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %46 = sub nsw i32 %44, %45
  %47 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %48 = sub nsw i32 %46, %47
  store i32 %48, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 6), align 8
  br label %49

49:                                               ; preds = %58, %28
  %.011 = phi i32 [ 0, %28 ], [ %59, %58 ]
  %50 = icmp slt i32 %.011, 10
  br i1 %50, label %51, label %60

51:                                               ; preds = %49
  %52 = sext i32 %.011 to i64
  %53 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = add nsw i32 %54, 1
  %56 = sext i32 %.011 to i64
  %57 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %56
  store i32 %55, ptr %57, align 4
  br label %58

58:                                               ; preds = %51
  %59 = add nsw i32 %.011, 1
  br label %49, !llvm.loop !11

60:                                               ; preds = %49
  br label %61

61:                                               ; preds = %74, %60
  %.012 = phi i32 [ 1, %60 ], [ %75, %74 ]
  %62 = icmp slt i32 %.012, 10
  br i1 %62, label %63, label %76

63:                                               ; preds = %61
  %64 = sext i32 %.012 to i64
  %65 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = sub nsw i32 %.012, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = add nsw i32 %66, %70
  %72 = sext i32 %.012 to i64
  %73 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %72
  store i32 %71, ptr %73, align 4
  br label %74

74:                                               ; preds = %63
  %75 = add nsw i32 %.012, 1
  br label %61, !llvm.loop !12

76:                                               ; preds = %61
  br label %77

77:                                               ; preds = %90, %76
  %.013 = phi i32 [ 0, %76 ], [ %83, %90 ]
  %78 = icmp slt i32 %.013, 9
  br i1 %78, label %79, label %91

79:                                               ; preds = %77
  %80 = sext i32 %.013 to i64
  %81 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = add nsw i32 %.013, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = add nsw i32 %82, %86
  %88 = sext i32 %.013 to i64
  %89 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %88
  store i32 %87, ptr %89, align 4
  br label %90

90:                                               ; preds = %79
  br label %77, !llvm.loop !13

91:                                               ; preds = %77
  br label %92

92:                                               ; preds = %118, %91
  %.210 = phi i32 [ %25, %91 ], [ %100, %118 ]
  %.46 = phi i32 [ %.35, %91 ], [ %.57, %118 ]
  %.4 = phi i32 [ %.3, %91 ], [ %.5, %118 ]
  br label %93

93:                                               ; preds = %96, %92
  %.57 = phi i32 [ %.46, %92 ], [ %98, %96 ]
  %.5 = phi i32 [ %.4, %92 ], [ %97, %96 ]
  %94 = add nsw i32 %.5, %.57
  %95 = icmp slt i32 %94, %.210
  br i1 %95, label %96, label %99

96:                                               ; preds = %93
  %97 = add nsw i32 %.5, 1
  %98 = add nsw i32 %.57, 1
  br label %93, !llvm.loop !14

99:                                               ; preds = %93
  %100 = add nsw i32 %.210, 1
  %101 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %102 = add nsw i32 %101, %.57
  store i32 %102, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  br label %103

103:                                              ; preds = %116, %99
  %.0 = phi i32 [ 0, %99 ], [ %109, %116 ]
  %104 = icmp slt i32 %.0, 9
  br i1 %104, label %105, label %117

105:                                              ; preds = %103
  %106 = sext i32 %.0 to i64
  %107 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %106
  %108 = load i32, ptr %107, align 4
  %109 = add nsw i32 %.0, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = add nsw i32 %108, %112
  %114 = sext i32 %.0 to i64
  %115 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %114
  store i32 %113, ptr %115, align 4
  br label %116

116:                                              ; preds = %105
  br label %103, !llvm.loop !15

117:                                              ; preds = %103
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr @m, align 16
  %120 = icmp slt i32 %119, %0
  br i1 %120, label %92, label %121, !llvm.loop !16

121:                                              ; preds = %118
  %122 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  ret i32 %122
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
