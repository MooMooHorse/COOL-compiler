; ModuleID = '<stdin>'
source_filename = "tests/testing/ffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.nsize = internal global [3 x i32] zeroinitializer, align 4
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [28 x i8] c"Can't allocate data array.\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Wrong answer at (%d,%d)!  Expected %d, got %d.\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"%d passes.  No errors in results.\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%d passes.  %d errors in results.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %1 = call noalias ptr @malloc(i64 noundef 1048592) #7
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %6

3:                                                ; preds = %0
  %4 = load ptr, ptr @stderr, align 8
  %5 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

6:                                                ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %1, i8 0, i64 1048592, i1 false)
  br label %7

7:                                                ; preds = %29, %6
  %.01 = phi i32 [ 0, %6 ], [ %30, %29 ]
  %8 = icmp slt i32 %.01, 256
  br i1 %8, label %9, label %31

9:                                                ; preds = %7
  br label %10

10:                                               ; preds = %26, %9
  %.02 = phi i32 [ 0, %9 ], [ %27, %26 ]
  %11 = icmp slt i32 %.02, 256
  br i1 %11, label %12, label %28

12:                                               ; preds = %10
  %13 = and i32 %.01, 15
  %14 = icmp eq i32 %13, 8
  br i1 %14, label %18, label %15

15:                                               ; preds = %12
  %16 = and i32 %.02, 15
  %17 = icmp eq i32 %16, 8
  br i1 %17, label %18, label %25

18:                                               ; preds = %15, %12
  %19 = mul nsw i32 256, %.01
  %20 = add nsw i32 %19, %.02
  %21 = mul nsw i32 %20, 2
  %22 = add nsw i32 1, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, ptr %1, i64 %23
  store double 1.280000e+02, ptr %24, align 8
  br label %25

25:                                               ; preds = %18, %15
  br label %26

26:                                               ; preds = %25
  %27 = add nsw i32 %.02, 1
  br label %10, !llvm.loop !6

28:                                               ; preds = %10
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.01, 1
  br label %7, !llvm.loop !8

31:                                               ; preds = %7
  br label %32

32:                                               ; preds = %35, %31
  %.1 = phi i32 [ 0, %31 ], [ %36, %35 ]
  %33 = icmp slt i32 %.1, 63
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  call void @fourn(ptr noundef %1, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %1, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  br label %35

35:                                               ; preds = %34
  %36 = add nsw i32 %.1, 1
  br label %32, !llvm.loop !9

37:                                               ; preds = %32
  br label %38

38:                                               ; preds = %71, %37
  %.011 = phi double [ 1.000000e+10, %37 ], [ %55, %71 ]
  %.010 = phi double [ -1.000000e+10, %37 ], [ %60, %71 ]
  %.09 = phi double [ 1.000000e+10, %37 ], [ %65, %71 ]
  %.05 = phi double [ -1.000000e+10, %37 ], [ %70, %71 ]
  %.04 = phi double [ 0.000000e+00, %37 ], [ %49, %71 ]
  %.2 = phi i32 [ 1, %37 ], [ %72, %71 ]
  %.0 = phi double [ 0.000000e+00, %37 ], [ %50, %71 ]
  %39 = sext i32 %.2 to i64
  %40 = icmp sle i64 %39, 65536
  br i1 %40, label %41, label %73

41:                                               ; preds = %38
  %42 = sext i32 %.2 to i64
  %43 = getelementptr inbounds double, ptr %1, i64 %42
  %44 = load double, ptr %43, align 8
  %45 = add nsw i32 %.2, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, ptr %1, i64 %46
  %48 = load double, ptr %47, align 8
  %49 = fadd double %.04, %44
  %50 = fadd double %.0, %48
  %51 = fcmp ole double %44, %.011
  br i1 %51, label %52, label %53

52:                                               ; preds = %41
  br label %54

53:                                               ; preds = %41
  br label %54

54:                                               ; preds = %53, %52
  %55 = phi double [ %44, %52 ], [ %.011, %53 ]
  %56 = fcmp ogt double %44, %.010
  br i1 %56, label %57, label %58

57:                                               ; preds = %54
  br label %59

58:                                               ; preds = %54
  br label %59

59:                                               ; preds = %58, %57
  %60 = phi double [ %44, %57 ], [ %.010, %58 ]
  %61 = fcmp ole double %48, %.09
  br i1 %61, label %62, label %63

62:                                               ; preds = %59
  br label %64

63:                                               ; preds = %59
  br label %64

64:                                               ; preds = %63, %62
  %65 = phi double [ %48, %62 ], [ %.09, %63 ]
  %66 = fcmp ogt double %48, %.05
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  br label %69

68:                                               ; preds = %64
  br label %69

69:                                               ; preds = %68, %67
  %70 = phi double [ %48, %67 ], [ %.05, %68 ]
  br label %71

71:                                               ; preds = %69
  %72 = add nsw i32 %.2, 2
  br label %38, !llvm.loop !10

73:                                               ; preds = %38
  %74 = fsub double %.010, %.011
  %75 = fdiv double 2.550000e+02, %74
  br label %76

76:                                               ; preds = %110, %73
  %.06 = phi i32 [ 0, %73 ], [ %.17, %110 ]
  %.3 = phi i32 [ 0, %73 ], [ %111, %110 ]
  %77 = icmp slt i32 %.3, 256
  br i1 %77, label %78, label %112

78:                                               ; preds = %76
  br label %79

79:                                               ; preds = %107, %78
  %.17 = phi i32 [ %.06, %78 ], [ %.28, %107 ]
  %.13 = phi i32 [ 0, %78 ], [ %108, %107 ]
  %80 = icmp slt i32 %.13, 256
  br i1 %80, label %81, label %109

81:                                               ; preds = %79
  %82 = mul nsw i32 256, %.3
  %83 = add nsw i32 %82, %.13
  %84 = mul nsw i32 %83, 2
  %85 = add nsw i32 1, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, ptr %1, i64 %86
  %88 = load double, ptr %87, align 8
  %89 = fsub double %88, %.011
  %90 = fmul double %89, %75
  %91 = fptosi double %90 to i32
  %92 = and i32 %.3, 15
  %93 = icmp eq i32 %92, 8
  br i1 %93, label %97, label %94

94:                                               ; preds = %81
  %95 = and i32 %.13, 15
  %96 = icmp eq i32 %95, 8
  br label %97

97:                                               ; preds = %94, %81
  %98 = phi i1 [ true, %81 ], [ %96, %94 ]
  %99 = zext i1 %98 to i64
  %100 = select i1 %98, i32 255, i32 0
  %101 = icmp ne i32 %91, %100
  br i1 %101, label %102, label %106

102:                                              ; preds = %97
  %103 = add nsw i32 %.17, 1
  %104 = load ptr, ptr @stderr, align 8
  %105 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %104, ptr noundef @.str.1, i32 noundef %.3, i32 noundef %.13, i32 noundef %100, i32 noundef %91)
  br label %106

106:                                              ; preds = %102, %97
  %.28 = phi i32 [ %103, %102 ], [ %.17, %97 ]
  br label %107

107:                                              ; preds = %106
  %108 = add nsw i32 %.13, 1
  br label %79, !llvm.loop !11

109:                                              ; preds = %79
  br label %110

110:                                              ; preds = %109
  %111 = add nsw i32 %.3, 1
  br label %76, !llvm.loop !12

112:                                              ; preds = %76
  %113 = icmp eq i32 %.06, 0
  br i1 %113, label %114, label %117

114:                                              ; preds = %112
  %115 = load ptr, ptr @stderr, align 8
  %116 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %115, ptr noundef @.str.2, i32 noundef 63)
  br label %120

117:                                              ; preds = %112
  %118 = load ptr, ptr @stderr, align 8
  %119 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %118, ptr noundef @.str.3, i32 noundef 63, i32 noundef %.06)
  br label %120

120:                                              ; preds = %117, %114
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal void @fourn(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  br label %5

5:                                                ; preds = %12, %4
  %.011 = phi i32 [ 1, %4 ], [ %13, %12 ]
  %.09 = phi i32 [ 1, %4 ], [ %11, %12 ]
  %6 = icmp sle i32 %.011, %2
  br i1 %6, label %7, label %14

7:                                                ; preds = %5
  %8 = sext i32 %.011 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = mul nsw i32 %.09, %10
  br label %12

12:                                               ; preds = %7
  %13 = add nsw i32 %.011, 1
  br label %5, !llvm.loop !13

14:                                               ; preds = %5
  br label %15

15:                                               ; preds = %173, %14
  %.112 = phi i32 [ %2, %14 ], [ %174, %173 ]
  %.010 = phi i32 [ 1, %14 ], [ %172, %173 ]
  %16 = icmp sge i32 %.112, 1
  br i1 %16, label %17, label %175

17:                                               ; preds = %15
  %18 = sext i32 %.112 to i64
  %19 = getelementptr inbounds i32, ptr %1, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = mul nsw i32 %20, %.010
  %22 = sdiv i32 %.09, %21
  %23 = shl i32 %.010, 1
  %24 = mul nsw i32 %23, %20
  %25 = mul nsw i32 %24, %22
  br label %26

26:                                               ; preds = %84, %17
  %.07 = phi i32 [ 1, %17 ], [ %83, %84 ]
  %.03 = phi i32 [ 1, %17 ], [ %85, %84 ]
  %27 = icmp sle i32 %.03, %24
  br i1 %27, label %28, label %86

28:                                               ; preds = %26
  %29 = icmp slt i32 %.03, %.07
  br i1 %29, label %30, label %71

30:                                               ; preds = %28
  br label %31

31:                                               ; preds = %68, %30
  %.02 = phi i32 [ %.03, %30 ], [ %69, %68 ]
  %32 = add nsw i32 %.03, %23
  %33 = sub nsw i32 %32, 2
  %34 = icmp sle i32 %.02, %33
  br i1 %34, label %35, label %70

35:                                               ; preds = %31
  br label %36

36:                                               ; preds = %65, %35
  %.05 = phi i32 [ %.02, %35 ], [ %66, %65 ]
  %37 = icmp sle i32 %.05, %25
  br i1 %37, label %38, label %67

38:                                               ; preds = %36
  %39 = add nsw i32 %.07, %.05
  %40 = sub nsw i32 %39, %.03
  %41 = sext i32 %.05 to i64
  %42 = getelementptr inbounds double, ptr %0, i64 %41
  %43 = load double, ptr %42, align 8
  %44 = sext i32 %40 to i64
  %45 = getelementptr inbounds double, ptr %0, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = sext i32 %.05 to i64
  %48 = getelementptr inbounds double, ptr %0, i64 %47
  store double %46, ptr %48, align 8
  %49 = sext i32 %40 to i64
  %50 = getelementptr inbounds double, ptr %0, i64 %49
  store double %43, ptr %50, align 8
  %51 = add nsw i32 %.05, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, ptr %0, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = add nsw i32 %40, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, ptr %0, i64 %56
  %58 = load double, ptr %57, align 8
  %59 = add nsw i32 %.05, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, ptr %0, i64 %60
  store double %58, ptr %61, align 8
  %62 = add nsw i32 %40, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, ptr %0, i64 %63
  store double %54, ptr %64, align 8
  br label %65

65:                                               ; preds = %38
  %66 = add nsw i32 %.05, %24
  br label %36, !llvm.loop !14

67:                                               ; preds = %36
  br label %68

68:                                               ; preds = %67
  %69 = add nsw i32 %.02, 2
  br label %31, !llvm.loop !15

70:                                               ; preds = %31
  br label %71

71:                                               ; preds = %70, %28
  %72 = ashr i32 %24, 1
  br label %73

73:                                               ; preds = %79, %71
  %.013 = phi i32 [ %72, %71 ], [ %81, %79 ]
  %.18 = phi i32 [ %.07, %71 ], [ %80, %79 ]
  %74 = icmp sge i32 %.013, %23
  br i1 %74, label %75, label %77

75:                                               ; preds = %73
  %76 = icmp sgt i32 %.18, %.013
  br label %77

77:                                               ; preds = %75, %73
  %78 = phi i1 [ false, %73 ], [ %76, %75 ]
  br i1 %78, label %79, label %82

79:                                               ; preds = %77
  %80 = sub nsw i32 %.18, %.013
  %81 = ashr i32 %.013, 1
  br label %73, !llvm.loop !16

82:                                               ; preds = %77
  %83 = add nsw i32 %.18, %.013
  br label %84

84:                                               ; preds = %82
  %85 = add nsw i32 %.03, %23
  br label %26, !llvm.loop !17

86:                                               ; preds = %26
  br label %87

87:                                               ; preds = %170, %86
  %.014 = phi i32 [ %23, %86 ], [ %90, %170 ]
  %88 = icmp slt i32 %.014, %24
  br i1 %88, label %89, label %171

89:                                               ; preds = %87
  %90 = shl i32 %.014, 1
  %91 = sitofp i32 %3 to double
  %92 = fmul double %91, 0x401921FB54442D1C
  %93 = sdiv i32 %90, %23
  %94 = sitofp i32 %93 to double
  %95 = fdiv double %92, %94
  %96 = fmul double 5.000000e-01, %95
  %97 = call double @sin(double noundef %96) #9
  %98 = fmul double -2.000000e+00, %97
  %99 = fmul double %98, %97
  %100 = call double @sin(double noundef %95) #9
  br label %101

101:                                              ; preds = %168, %89
  %.16 = phi i32 [ 1, %89 ], [ %169, %168 ]
  %.01 = phi double [ 0.000000e+00, %89 ], [ %167, %168 ]
  %.0 = phi double [ 1.000000e+00, %89 ], [ %164, %168 ]
  %102 = icmp sle i32 %.16, %.014
  br i1 %102, label %103, label %170

103:                                              ; preds = %101
  br label %104

104:                                              ; preds = %158, %103
  %.1 = phi i32 [ %.16, %103 ], [ %159, %158 ]
  %105 = add nsw i32 %.16, %23
  %106 = sub nsw i32 %105, 2
  %107 = icmp sle i32 %.1, %106
  br i1 %107, label %108, label %160

108:                                              ; preds = %104
  br label %109

109:                                              ; preds = %155, %108
  %.14 = phi i32 [ %.1, %108 ], [ %156, %155 ]
  %110 = icmp sle i32 %.14, %25
  br i1 %110, label %111, label %157

111:                                              ; preds = %109
  %112 = add nsw i32 %.14, %.014
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds double, ptr %0, i64 %113
  %115 = load double, ptr %114, align 8
  %116 = add nsw i32 %112, 1
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds double, ptr %0, i64 %117
  %119 = load double, ptr %118, align 8
  %120 = fmul double %.01, %119
  %121 = fneg double %120
  %122 = call double @llvm.fmuladd.f64(double %.0, double %115, double %121)
  %123 = add nsw i32 %112, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds double, ptr %0, i64 %124
  %126 = load double, ptr %125, align 8
  %127 = sext i32 %112 to i64
  %128 = getelementptr inbounds double, ptr %0, i64 %127
  %129 = load double, ptr %128, align 8
  %130 = fmul double %.01, %129
  %131 = call double @llvm.fmuladd.f64(double %.0, double %126, double %130)
  %132 = sext i32 %.14 to i64
  %133 = getelementptr inbounds double, ptr %0, i64 %132
  %134 = load double, ptr %133, align 8
  %135 = fsub double %134, %122
  %136 = sext i32 %112 to i64
  %137 = getelementptr inbounds double, ptr %0, i64 %136
  store double %135, ptr %137, align 8
  %138 = add nsw i32 %.14, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, ptr %0, i64 %139
  %141 = load double, ptr %140, align 8
  %142 = fsub double %141, %131
  %143 = add nsw i32 %112, 1
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double, ptr %0, i64 %144
  store double %142, ptr %145, align 8
  %146 = sext i32 %.14 to i64
  %147 = getelementptr inbounds double, ptr %0, i64 %146
  %148 = load double, ptr %147, align 8
  %149 = fadd double %148, %122
  store double %149, ptr %147, align 8
  %150 = add nsw i32 %.14, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, ptr %0, i64 %151
  %153 = load double, ptr %152, align 8
  %154 = fadd double %153, %131
  store double %154, ptr %152, align 8
  br label %155

155:                                              ; preds = %111
  %156 = add nsw i32 %.14, %90
  br label %109, !llvm.loop !18

157:                                              ; preds = %109
  br label %158

158:                                              ; preds = %157
  %159 = add nsw i32 %.1, 2
  br label %104, !llvm.loop !19

160:                                              ; preds = %104
  %161 = fmul double %.01, %100
  %162 = fneg double %161
  %163 = call double @llvm.fmuladd.f64(double %.0, double %99, double %162)
  %164 = fadd double %163, %.0
  %165 = fmul double %.0, %100
  %166 = call double @llvm.fmuladd.f64(double %.01, double %99, double %165)
  %167 = fadd double %166, %.01
  br label %168

168:                                              ; preds = %160
  %169 = add nsw i32 %.16, %23
  br label %101, !llvm.loop !20

170:                                              ; preds = %101
  br label %87, !llvm.loop !21

171:                                              ; preds = %87
  %172 = mul nsw i32 %.010, %20
  br label %173

173:                                              ; preds = %171
  %174 = add nsw i32 %.112, -1
  br label %15, !llvm.loop !22

175:                                              ; preds = %15
  ret void
}

; Function Attrs: nounwind
declare double @sin(double noundef) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }

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
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
