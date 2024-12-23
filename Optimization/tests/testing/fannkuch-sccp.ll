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
  br label %20

20:                                               ; preds = %126, %19
  %.010 = phi i32 [ %0, %19 ], [ %.212, %126 ]
  %.07 = phi i64 [ 0, %19 ], [ %.29, %126 ]
  %.02 = phi i32 [ 0, %19 ], [ %.1, %126 ]
  %21 = icmp slt i32 %.02, 30
  br i1 %21, label %22, label %36

22:                                               ; preds = %20
  br label %23

23:                                               ; preds = %31, %22
  %.15 = phi i32 [ 0, %22 ], [ %32, %31 ]
  %24 = icmp slt i32 %.15, %0
  br i1 %24, label %25, label %33

25:                                               ; preds = %23
  %26 = sext i32 %.15 to i64
  %27 = getelementptr inbounds i32, ptr %9, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 1, %28
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %29)
  br label %31

31:                                               ; preds = %25
  %32 = add nsw i32 %.15, 1
  br label %23, !llvm.loop !8

33:                                               ; preds = %23
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %35 = add nsw i32 %.02, 1
  br label %36

36:                                               ; preds = %33, %20
  %.1 = phi i32 [ %35, %33 ], [ %.02, %20 ]
  br label %37

37:                                               ; preds = %43, %36
  %.111 = phi i32 [ %.010, %36 ], [ %44, %43 ]
  %38 = icmp ne i32 %.111, 1
  br i1 %38, label %39, label %45

39:                                               ; preds = %37
  %40 = sub nsw i32 %.111, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %11, i64 %41
  store i32 %.111, ptr %42, align 4
  br label %43

43:                                               ; preds = %39
  %44 = add nsw i32 %.111, -1
  br label %37, !llvm.loop !9

45:                                               ; preds = %37
  %46 = getelementptr inbounds i32, ptr %9, i64 0
  %47 = load i32, ptr %46, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %99, label %49

49:                                               ; preds = %45
  %50 = sext i32 %2 to i64
  %51 = getelementptr inbounds i32, ptr %9, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = icmp eq i32 %52, %2
  br i1 %53, label %99, label %54

54:                                               ; preds = %49
  br label %55

55:                                               ; preds = %63, %54
  %.2 = phi i32 [ 1, %54 ], [ %64, %63 ]
  %56 = icmp slt i32 %.2, %0
  br i1 %56, label %57, label %65

57:                                               ; preds = %55
  %58 = sext i32 %.2 to i64
  %59 = getelementptr inbounds i32, ptr %9, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = sext i32 %.2 to i64
  %62 = getelementptr inbounds i32, ptr %7, i64 %61
  store i32 %60, ptr %62, align 4
  br label %63

63:                                               ; preds = %57
  %64 = add nsw i32 %.2, 1
  br label %55, !llvm.loop !10

65:                                               ; preds = %55
  %66 = getelementptr inbounds i32, ptr %9, i64 0
  %67 = load i32, ptr %66, align 4
  br label %68

68:                                               ; preds = %93, %65
  %.06 = phi i64 [ 0, %65 ], [ %87, %93 ]
  %.03 = phi i32 [ %67, %65 ], [ %90, %93 ]
  %69 = sub nsw i32 %.03, 1
  br label %70

70:                                               ; preds = %83, %68
  %.3 = phi i32 [ 1, %68 ], [ %84, %83 ]
  %.01 = phi i32 [ %69, %68 ], [ %85, %83 ]
  %71 = icmp slt i32 %.3, %.01
  br i1 %71, label %72, label %86

72:                                               ; preds = %70
  %73 = sext i32 %.3 to i64
  %74 = getelementptr inbounds i32, ptr %7, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = sext i32 %.01 to i64
  %77 = getelementptr inbounds i32, ptr %7, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = sext i32 %.3 to i64
  %80 = getelementptr inbounds i32, ptr %7, i64 %79
  store i32 %78, ptr %80, align 4
  %81 = sext i32 %.01 to i64
  %82 = getelementptr inbounds i32, ptr %7, i64 %81
  store i32 %75, ptr %82, align 4
  br label %83

83:                                               ; preds = %72
  %84 = add nsw i32 %.3, 1
  %85 = add nsw i32 %.01, -1
  br label %70, !llvm.loop !11

86:                                               ; preds = %70
  %87 = add nsw i64 %.06, 1
  %88 = sext i32 %.03 to i64
  %89 = getelementptr inbounds i32, ptr %7, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = sext i32 %.03 to i64
  %92 = getelementptr inbounds i32, ptr %7, i64 %91
  store i32 %.03, ptr %92, align 4
  br label %93

93:                                               ; preds = %86
  %94 = icmp ne i32 %90, 0
  br i1 %94, label %68, label %95, !llvm.loop !12

95:                                               ; preds = %93
  %96 = icmp slt i64 %.07, %87
  br i1 %96, label %97, label %98

97:                                               ; preds = %95
  br label %98

98:                                               ; preds = %97, %95
  %.18 = phi i64 [ %87, %97 ], [ %.07, %95 ]
  br label %99

99:                                               ; preds = %98, %49, %45
  %.29 = phi i64 [ %.07, %45 ], [ %.07, %49 ], [ %.18, %98 ]
  br label %100

100:                                              ; preds = %124, %99
  %.212 = phi i32 [ %.111, %99 ], [ %125, %124 ]
  %101 = icmp eq i32 %.212, %0
  br i1 %101, label %102, label %103

102:                                              ; preds = %100
  br label %127

103:                                              ; preds = %100
  %104 = getelementptr inbounds i32, ptr %9, i64 0
  %105 = load i32, ptr %104, align 4
  br label %106

106:                                              ; preds = %108, %103
  %.4 = phi i32 [ 0, %103 ], [ %109, %108 ]
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
  br label %100

126:                                              ; preds = %123
  br label %20

127:                                              ; preds = %102, %4
  %.0 = phi i64 [ 0, %4 ], [ %.29, %102 ]
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
