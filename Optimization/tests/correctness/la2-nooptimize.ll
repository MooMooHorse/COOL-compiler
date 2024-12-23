; ModuleID = '<stdin>'
source_filename = "tests/correctness/la2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 5, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  %8 = mul nsw i32 %6, %7
  store i32 %8, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = mul nsw i32 %9, %10
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %11, %12
  %14 = load i32, ptr %4, align 4
  %15 = sub nsw i32 %13, %14
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %49, %1
  br label %17

17:                                               ; preds = %45, %16
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %46

23:                                               ; preds = %17
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %28

28:                                               ; preds = %39, %23
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %3, align 4
  %31 = mul nsw i32 %29, %30
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %3, align 4
  %33 = icmp sgt i32 %32, 10
  br i1 %33, label %34, label %38

34:                                               ; preds = %28
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %4, align 4
  %37 = mul nsw i32 %35, %36
  store i32 %37, ptr %4, align 4
  br label %38

38:                                               ; preds = %34, %28
  br label %39

39:                                               ; preds = %38
  %40 = load i32, ptr %3, align 4
  %41 = load i32, ptr %2, align 4
  %42 = load i32, ptr %2, align 4
  %43 = mul nsw i32 %41, %42
  %44 = icmp slt i32 %40, %43
  br i1 %44, label %28, label %45, !llvm.loop !6

45:                                               ; preds = %39
  br label %17, !llvm.loop !8

46:                                               ; preds = %17
  %47 = load i32, ptr %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %5, align 4
  br label %49

49:                                               ; preds = %46
  %50 = load i32, ptr %3, align 4
  %51 = load i32, ptr %2, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %16, label %53, !llvm.loop !9

53:                                               ; preds = %49
  store i32 50, ptr %3, align 4
  br label %54

54:                                               ; preds = %87, %53
  br label %55

55:                                               ; preds = %83, %54
  %56 = load i32, ptr %3, align 4
  %57 = load i32, ptr %4, align 4
  %58 = add nsw i32 %56, %57
  %59 = load i32, ptr %5, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %84

61:                                               ; preds = %55
  %62 = load i32, ptr %3, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %3, align 4
  %64 = load i32, ptr %4, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %4, align 4
  br label %66

66:                                               ; preds = %77, %61
  %67 = load i32, ptr %3, align 4
  %68 = load i32, ptr %3, align 4
  %69 = mul nsw i32 %67, %68
  store i32 %69, ptr %3, align 4
  %70 = load i32, ptr %3, align 4
  %71 = icmp sgt i32 %70, 10
  br i1 %71, label %72, label %76

72:                                               ; preds = %66
  %73 = load i32, ptr %4, align 4
  %74 = load i32, ptr %4, align 4
  %75 = mul nsw i32 %73, %74
  store i32 %75, ptr %4, align 4
  br label %76

76:                                               ; preds = %72, %66
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %3, align 4
  %79 = load i32, ptr %2, align 4
  %80 = load i32, ptr %2, align 4
  %81 = mul nsw i32 %79, %80
  %82 = icmp slt i32 %78, %81
  br i1 %82, label %66, label %83, !llvm.loop !10

83:                                               ; preds = %77
  br label %55, !llvm.loop !11

84:                                               ; preds = %55
  %85 = load i32, ptr %5, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %5, align 4
  br label %87

87:                                               ; preds = %84
  %88 = load i32, ptr %3, align 4
  %89 = load i32, ptr %2, align 4
  %90 = icmp slt i32 %88, %89
  br i1 %90, label %54, label %91, !llvm.loop !12

91:                                               ; preds = %87
  %92 = load i32, ptr %2, align 4
  store i32 %92, ptr %3, align 4
  br label %93

93:                                               ; preds = %126, %91
  br label %94

94:                                               ; preds = %122, %93
  %95 = load i32, ptr %3, align 4
  %96 = load i32, ptr %4, align 4
  %97 = add nsw i32 %95, %96
  %98 = load i32, ptr %5, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %123

100:                                              ; preds = %94
  %101 = load i32, ptr %3, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %3, align 4
  %103 = load i32, ptr %4, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %4, align 4
  br label %105

105:                                              ; preds = %116, %100
  %106 = load i32, ptr %3, align 4
  %107 = load i32, ptr %3, align 4
  %108 = mul nsw i32 %106, %107
  store i32 %108, ptr %3, align 4
  %109 = load i32, ptr %3, align 4
  %110 = icmp sgt i32 %109, 10
  br i1 %110, label %111, label %115

111:                                              ; preds = %105
  %112 = load i32, ptr %4, align 4
  %113 = load i32, ptr %4, align 4
  %114 = mul nsw i32 %112, %113
  store i32 %114, ptr %4, align 4
  br label %115

115:                                              ; preds = %111, %105
  br label %116

116:                                              ; preds = %115
  %117 = load i32, ptr %3, align 4
  %118 = load i32, ptr %2, align 4
  %119 = load i32, ptr %2, align 4
  %120 = mul nsw i32 %118, %119
  %121 = icmp slt i32 %117, %120
  br i1 %121, label %105, label %122, !llvm.loop !13

122:                                              ; preds = %116
  br label %94, !llvm.loop !14

123:                                              ; preds = %94
  %124 = load i32, ptr %5, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %5, align 4
  br label %126

126:                                              ; preds = %123
  %127 = load i32, ptr %3, align 4
  %128 = load i32, ptr %2, align 4
  %129 = icmp slt i32 %127, %128
  br i1 %129, label %93, label %130, !llvm.loop !15

130:                                              ; preds = %126
  %131 = load i32, ptr %5, align 4
  ret i32 %131
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i32 @crazy_loops(i32 noundef 50)
  ret i32 %2
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
