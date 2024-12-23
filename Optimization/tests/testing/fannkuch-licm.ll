; ModuleID = '<stdin>'
source_filename = "tests/testing/fannkuch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @fannkuch(i32 noundef 11)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 11, i64 noundef %3)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @fannkuch(i32 noundef %0) #0 {
  %2 = sub nsw i32 %0, 1
  %3 = icmp slt i32 %0, 1
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %127

5:                                                ; preds = %1
  %6 = sext i32 %0 to i64
  %7 = call noalias ptr @calloc(i64 noundef %6, i64 noundef 4) #3
  %8 = sext i32 %0 to i64
  %9 = call noalias ptr @calloc(i64 noundef %8, i64 noundef 4) #3
  %10 = sext i32 %0 to i64
  %11 = call noalias ptr @calloc(i64 noundef %10, i64 noundef 4) #3
  br label %12

12:                                               ; preds = %17, %5
  %.04 = phi i32 [ 0, %5 ], [ %18, %17 ]
  %13 = icmp slt i32 %.04, %0
  br i1 %13, label %14, label %19

14:                                               ; preds = %12
  %15 = sext i32 %.04 to i64
  %16 = getelementptr inbounds i32, ptr %9, i64 %15
  store i32 %.04, ptr %16, align 4
  br label %17

17:                                               ; preds = %14
  %18 = add nsw i32 %.04, 1
  br label %12, !llvm.loop !6

19:                                               ; preds = %12
  %20 = getelementptr inbounds i32, ptr %9, i64 0
  %21 = sext i32 %2 to i64
  %22 = getelementptr inbounds i32, ptr %9, i64 0
  %23 = getelementptr inbounds i32, ptr %9, i64 0
  %24 = getelementptr inbounds i32, ptr %9, i64 %21
  br label %25

25:                                               ; preds = %126, %19
  %.010 = phi i32 [ %0, %19 ], [ %.212, %126 ]
  %.07 = phi i64 [ 0, %19 ], [ %.29, %126 ]
  %.02 = phi i32 [ 0, %19 ], [ %.1, %126 ]
  %26 = icmp slt i32 %.02, 30
  br i1 %26, label %27, label %41

27:                                               ; preds = %25
  br label %28

28:                                               ; preds = %36, %27
  %.15 = phi i32 [ 0, %27 ], [ %37, %36 ]
  %29 = icmp slt i32 %.15, %0
  br i1 %29, label %30, label %38

30:                                               ; preds = %28
  %31 = sext i32 %.15 to i64
  %32 = getelementptr inbounds i32, ptr %9, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 1, %33
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %34)
  br label %36

36:                                               ; preds = %30
  %37 = add nsw i32 %.15, 1
  br label %28, !llvm.loop !8

38:                                               ; preds = %28
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %40 = add nsw i32 %.02, 1
  br label %41

41:                                               ; preds = %38, %25
  %.1 = phi i32 [ %40, %38 ], [ %.02, %25 ]
  br label %42

42:                                               ; preds = %48, %41
  %.111 = phi i32 [ %.010, %41 ], [ %49, %48 ]
  %43 = icmp ne i32 %.111, 1
  br i1 %43, label %44, label %50

44:                                               ; preds = %42
  %45 = sub nsw i32 %.111, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %11, i64 %46
  store i32 %.111, ptr %47, align 4
  br label %48

48:                                               ; preds = %44
  %49 = add nsw i32 %.111, -1
  br label %42, !llvm.loop !9

50:                                               ; preds = %42
  %51 = load i32, ptr %20, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %100, label %53

53:                                               ; preds = %50
  %54 = load i32, ptr %24, align 4
  %55 = icmp eq i32 %54, %2
  br i1 %55, label %100, label %56

56:                                               ; preds = %53
  br label %57

57:                                               ; preds = %65, %56
  %.2 = phi i32 [ 1, %56 ], [ %66, %65 ]
  %58 = icmp slt i32 %.2, %0
  br i1 %58, label %59, label %67

59:                                               ; preds = %57
  %60 = sext i32 %.2 to i64
  %61 = getelementptr inbounds i32, ptr %9, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = sext i32 %.2 to i64
  %64 = getelementptr inbounds i32, ptr %7, i64 %63
  store i32 %62, ptr %64, align 4
  br label %65

65:                                               ; preds = %59
  %66 = add nsw i32 %.2, 1
  br label %57, !llvm.loop !10

67:                                               ; preds = %57
  %68 = load i32, ptr %22, align 4
  br label %69

69:                                               ; preds = %94, %67
  %.06 = phi i64 [ 0, %67 ], [ %88, %94 ]
  %.03 = phi i32 [ %68, %67 ], [ %91, %94 ]
  %70 = sub nsw i32 %.03, 1
  br label %71

71:                                               ; preds = %84, %69
  %.3 = phi i32 [ 1, %69 ], [ %85, %84 ]
  %.01 = phi i32 [ %70, %69 ], [ %86, %84 ]
  %72 = icmp slt i32 %.3, %.01
  br i1 %72, label %73, label %87

73:                                               ; preds = %71
  %74 = sext i32 %.3 to i64
  %75 = getelementptr inbounds i32, ptr %7, i64 %74
  %76 = load i32, ptr %75, align 4
  %77 = sext i32 %.01 to i64
  %78 = getelementptr inbounds i32, ptr %7, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = sext i32 %.3 to i64
  %81 = getelementptr inbounds i32, ptr %7, i64 %80
  store i32 %79, ptr %81, align 4
  %82 = sext i32 %.01 to i64
  %83 = getelementptr inbounds i32, ptr %7, i64 %82
  store i32 %76, ptr %83, align 4
  br label %84

84:                                               ; preds = %73
  %85 = add nsw i32 %.3, 1
  %86 = add nsw i32 %.01, -1
  br label %71, !llvm.loop !11

87:                                               ; preds = %71
  %88 = add nsw i64 %.06, 1
  %89 = sext i32 %.03 to i64
  %90 = getelementptr inbounds i32, ptr %7, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = sext i32 %.03 to i64
  %93 = getelementptr inbounds i32, ptr %7, i64 %92
  store i32 %.03, ptr %93, align 4
  br label %94

94:                                               ; preds = %87
  %95 = icmp ne i32 %91, 0
  br i1 %95, label %69, label %96, !llvm.loop !12

96:                                               ; preds = %94
  %97 = icmp slt i64 %.07, %88
  br i1 %97, label %98, label %99

98:                                               ; preds = %96
  br label %99

99:                                               ; preds = %98, %96
  %.18 = phi i64 [ %88, %98 ], [ %.07, %96 ]
  br label %100

100:                                              ; preds = %99, %53, %50
  %.29 = phi i64 [ %.07, %50 ], [ %.07, %53 ], [ %.18, %99 ]
  br label %101

101:                                              ; preds = %124, %100
  %.212 = phi i32 [ %.111, %100 ], [ %125, %124 ]
  %102 = icmp eq i32 %.212, %0
  br i1 %102, label %103, label %104

103:                                              ; preds = %101
  br label %127

104:                                              ; preds = %101
  %105 = load i32, ptr %23, align 4
  br label %106

106:                                              ; preds = %108, %104
  %.4 = phi i32 [ 0, %104 ], [ %109, %108 ]
  %107 = icmp slt i32 %.4, %.212
  br i1 %107, label %108, label %115

108:                                              ; preds = %106
  %109 = add nsw i32 %.4, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, ptr %9, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = sext i32 %.4 to i64
  %114 = getelementptr inbounds i32, ptr %9, i64 %113
  store i32 %112, ptr %114, align 4
  br label %106, !llvm.loop !13

115:                                              ; preds = %106
  %116 = sext i32 %.212 to i64
  %117 = getelementptr inbounds i32, ptr %9, i64 %116
  store i32 %105, ptr %117, align 4
  %118 = sext i32 %.212 to i64
  %119 = getelementptr inbounds i32, ptr %11, i64 %118
  %120 = load i32, ptr %119, align 4
  %121 = sub nsw i32 %120, 1
  store i32 %121, ptr %119, align 4
  %122 = icmp sgt i32 %121, 0
  br i1 %122, label %123, label %124

123:                                              ; preds = %115
  br label %126

124:                                              ; preds = %115
  %125 = add nsw i32 %.212, 1
  br label %101

126:                                              ; preds = %123
  br label %25

127:                                              ; preds = %103, %4
  %.0 = phi i64 [ 0, %4 ], [ %.29, %103 ]
  ret i64 %.0
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) }

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
