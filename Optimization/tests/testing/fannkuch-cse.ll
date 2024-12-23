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
  br label %125

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

20:                                               ; preds = %124, %19
  %.010 = phi i32 [ %0, %19 ], [ %.212, %124 ]
  %.07 = phi i64 [ 0, %19 ], [ %.29, %124 ]
  %.02 = phi i32 [ 0, %19 ], [ %.1, %124 ]
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
  br i1 %48, label %98, label %49

49:                                               ; preds = %45
  %50 = sext i32 %2 to i64
  %51 = getelementptr inbounds i32, ptr %9, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = icmp eq i32 %52, %2
  br i1 %53, label %98, label %54

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
  %66 = load i32, ptr %46, align 4
  br label %67

67:                                               ; preds = %92, %65
  %.06 = phi i64 [ 0, %65 ], [ %86, %92 ]
  %.03 = phi i32 [ %66, %65 ], [ %89, %92 ]
  %68 = sub nsw i32 %.03, 1
  br label %69

69:                                               ; preds = %82, %67
  %.3 = phi i32 [ 1, %67 ], [ %83, %82 ]
  %.01 = phi i32 [ %68, %67 ], [ %84, %82 ]
  %70 = icmp slt i32 %.3, %.01
  br i1 %70, label %71, label %85

71:                                               ; preds = %69
  %72 = sext i32 %.3 to i64
  %73 = getelementptr inbounds i32, ptr %7, i64 %72
  %74 = load i32, ptr %73, align 4
  %75 = sext i32 %.01 to i64
  %76 = getelementptr inbounds i32, ptr %7, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = sext i32 %.3 to i64
  %79 = getelementptr inbounds i32, ptr %7, i64 %78
  store i32 %77, ptr %79, align 4
  %80 = sext i32 %.01 to i64
  %81 = getelementptr inbounds i32, ptr %7, i64 %80
  store i32 %74, ptr %81, align 4
  br label %82

82:                                               ; preds = %71
  %83 = add nsw i32 %.3, 1
  %84 = add nsw i32 %.01, -1
  br label %69, !llvm.loop !11

85:                                               ; preds = %69
  %86 = add nsw i64 %.06, 1
  %87 = sext i32 %.03 to i64
  %88 = getelementptr inbounds i32, ptr %7, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = sext i32 %.03 to i64
  %91 = getelementptr inbounds i32, ptr %7, i64 %90
  store i32 %.03, ptr %91, align 4
  br label %92

92:                                               ; preds = %85
  %93 = icmp ne i32 %89, 0
  br i1 %93, label %67, label %94, !llvm.loop !12

94:                                               ; preds = %92
  %95 = icmp slt i64 %.07, %86
  br i1 %95, label %96, label %97

96:                                               ; preds = %94
  br label %97

97:                                               ; preds = %96, %94
  %.18 = phi i64 [ %86, %96 ], [ %.07, %94 ]
  br label %98

98:                                               ; preds = %97, %49, %45
  %.29 = phi i64 [ %.07, %45 ], [ %.07, %49 ], [ %.18, %97 ]
  br label %99

99:                                               ; preds = %122, %98
  %.212 = phi i32 [ %.111, %98 ], [ %123, %122 ]
  %100 = icmp eq i32 %.212, %0
  br i1 %100, label %101, label %102

101:                                              ; preds = %99
  br label %125

102:                                              ; preds = %99
  %103 = load i32, ptr %46, align 4
  br label %104

104:                                              ; preds = %106, %102
  %.4 = phi i32 [ 0, %102 ], [ %107, %106 ]
  %105 = icmp slt i32 %.4, %.212
  br i1 %105, label %106, label %113

106:                                              ; preds = %104
  %107 = add nsw i32 %.4, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, ptr %9, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = sext i32 %.4 to i64
  %112 = getelementptr inbounds i32, ptr %9, i64 %111
  store i32 %110, ptr %112, align 4
  br label %104, !llvm.loop !13

113:                                              ; preds = %104
  %114 = sext i32 %.212 to i64
  %115 = getelementptr inbounds i32, ptr %9, i64 %114
  store i32 %103, ptr %115, align 4
  %116 = sext i32 %.212 to i64
  %117 = getelementptr inbounds i32, ptr %11, i64 %116
  %118 = load i32, ptr %117, align 4
  %119 = sub nsw i32 %118, 1
  store i32 %119, ptr %117, align 4
  %120 = icmp sgt i32 %119, 0
  br i1 %120, label %121, label %122

121:                                              ; preds = %113
  br label %124

122:                                              ; preds = %113
  %123 = add nsw i32 %.212, 1
  br label %99

124:                                              ; preds = %121
  br label %20

125:                                              ; preds = %101, %4
  %.0 = phi i64 [ 0, %4 ], [ %.29, %101 ]
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
