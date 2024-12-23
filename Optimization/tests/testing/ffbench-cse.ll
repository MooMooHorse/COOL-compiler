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
  %1 = mul nsw i32 256, 256
  %2 = sext i32 %1 to i64
  %3 = add nsw i64 %2, 1
  %4 = mul nsw i64 %3, 2
  %5 = mul i64 %4, 8
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %6 = call noalias ptr @malloc(i64 noundef %5) #7
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %0
  %9 = load ptr, ptr @stderr, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

11:                                               ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 %5, i1 false)
  br label %12

12:                                               ; preds = %34, %11
  %.01 = phi i32 [ 0, %11 ], [ %35, %34 ]
  %13 = icmp slt i32 %.01, 256
  br i1 %13, label %14, label %36

14:                                               ; preds = %12
  br label %15

15:                                               ; preds = %31, %14
  %.02 = phi i32 [ 0, %14 ], [ %32, %31 ]
  %16 = icmp slt i32 %.02, 256
  br i1 %16, label %17, label %33

17:                                               ; preds = %15
  %18 = and i32 %.01, 15
  %19 = icmp eq i32 %18, 8
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = and i32 %.02, 15
  %22 = icmp eq i32 %21, 8
  br i1 %22, label %23, label %30

23:                                               ; preds = %20, %17
  %24 = mul nsw i32 256, %.01
  %25 = add nsw i32 %24, %.02
  %26 = mul nsw i32 %25, 2
  %27 = add nsw i32 1, %26
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, ptr %6, i64 %28
  store double 1.280000e+02, ptr %29, align 8
  br label %30

30:                                               ; preds = %23, %20
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.02, 1
  br label %15, !llvm.loop !6

33:                                               ; preds = %15
  br label %34

34:                                               ; preds = %33
  %35 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !8

36:                                               ; preds = %12
  br label %37

37:                                               ; preds = %40, %36
  %.1 = phi i32 [ 0, %36 ], [ %41, %40 ]
  %38 = icmp slt i32 %.1, 63
  br i1 %38, label %39, label %42

39:                                               ; preds = %37
  call void @fourn(ptr noundef %6, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %6, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  br label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %.1, 1
  br label %37, !llvm.loop !9

42:                                               ; preds = %37
  br label %43

43:                                               ; preds = %76, %42
  %.011 = phi double [ 1.000000e+10, %42 ], [ %60, %76 ]
  %.010 = phi double [ -1.000000e+10, %42 ], [ %65, %76 ]
  %.09 = phi double [ 1.000000e+10, %42 ], [ %70, %76 ]
  %.05 = phi double [ -1.000000e+10, %42 ], [ %75, %76 ]
  %.04 = phi double [ 0.000000e+00, %42 ], [ %54, %76 ]
  %.2 = phi i32 [ 1, %42 ], [ %77, %76 ]
  %.0 = phi double [ 0.000000e+00, %42 ], [ %55, %76 ]
  %44 = sext i32 %.2 to i64
  %45 = icmp sle i64 %44, %2
  br i1 %45, label %46, label %78

46:                                               ; preds = %43
  %47 = sext i32 %.2 to i64
  %48 = getelementptr inbounds double, ptr %6, i64 %47
  %49 = load double, ptr %48, align 8
  %50 = add nsw i32 %.2, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, ptr %6, i64 %51
  %53 = load double, ptr %52, align 8
  %54 = fadd double %.04, %49
  %55 = fadd double %.0, %53
  %56 = fcmp ole double %49, %.011
  br i1 %56, label %57, label %58

57:                                               ; preds = %46
  br label %59

58:                                               ; preds = %46
  br label %59

59:                                               ; preds = %58, %57
  %60 = phi double [ %49, %57 ], [ %.011, %58 ]
  %61 = fcmp ogt double %49, %.010
  br i1 %61, label %62, label %63

62:                                               ; preds = %59
  br label %64

63:                                               ; preds = %59
  br label %64

64:                                               ; preds = %63, %62
  %65 = phi double [ %49, %62 ], [ %.010, %63 ]
  %66 = fcmp ole double %53, %.09
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  br label %69

68:                                               ; preds = %64
  br label %69

69:                                               ; preds = %68, %67
  %70 = phi double [ %53, %67 ], [ %.09, %68 ]
  %71 = fcmp ogt double %53, %.05
  br i1 %71, label %72, label %73

72:                                               ; preds = %69
  br label %74

73:                                               ; preds = %69
  br label %74

74:                                               ; preds = %73, %72
  %75 = phi double [ %53, %72 ], [ %.05, %73 ]
  br label %76

76:                                               ; preds = %74
  %77 = add nsw i32 %.2, 2
  br label %43, !llvm.loop !10

78:                                               ; preds = %43
  %79 = fsub double %.010, %.011
  %80 = fdiv double 2.550000e+02, %79
  br label %81

81:                                               ; preds = %115, %78
  %.06 = phi i32 [ 0, %78 ], [ %.17, %115 ]
  %.3 = phi i32 [ 0, %78 ], [ %116, %115 ]
  %82 = icmp slt i32 %.3, 256
  br i1 %82, label %83, label %117

83:                                               ; preds = %81
  br label %84

84:                                               ; preds = %112, %83
  %.17 = phi i32 [ %.06, %83 ], [ %.28, %112 ]
  %.13 = phi i32 [ 0, %83 ], [ %113, %112 ]
  %85 = icmp slt i32 %.13, 256
  br i1 %85, label %86, label %114

86:                                               ; preds = %84
  %87 = mul nsw i32 256, %.3
  %88 = add nsw i32 %87, %.13
  %89 = mul nsw i32 %88, 2
  %90 = add nsw i32 1, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, ptr %6, i64 %91
  %93 = load double, ptr %92, align 8
  %94 = fsub double %93, %.011
  %95 = fmul double %94, %80
  %96 = fptosi double %95 to i32
  %97 = and i32 %.3, 15
  %98 = icmp eq i32 %97, 8
  br i1 %98, label %102, label %99

99:                                               ; preds = %86
  %100 = and i32 %.13, 15
  %101 = icmp eq i32 %100, 8
  br label %102

102:                                              ; preds = %99, %86
  %103 = phi i1 [ true, %86 ], [ %101, %99 ]
  %104 = zext i1 %103 to i64
  %105 = select i1 %103, i32 255, i32 0
  %106 = icmp ne i32 %96, %105
  br i1 %106, label %107, label %111

107:                                              ; preds = %102
  %108 = add nsw i32 %.17, 1
  %109 = load ptr, ptr @stderr, align 8
  %110 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %109, ptr noundef @.str.1, i32 noundef %.3, i32 noundef %.13, i32 noundef %105, i32 noundef %96)
  br label %111

111:                                              ; preds = %107, %102
  %.28 = phi i32 [ %108, %107 ], [ %.17, %102 ]
  br label %112

112:                                              ; preds = %111
  %113 = add nsw i32 %.13, 1
  br label %84, !llvm.loop !11

114:                                              ; preds = %84
  br label %115

115:                                              ; preds = %114
  %116 = add nsw i32 %.3, 1
  br label %81, !llvm.loop !12

117:                                              ; preds = %81
  %118 = icmp eq i32 %.06, 0
  br i1 %118, label %119, label %122

119:                                              ; preds = %117
  %120 = load ptr, ptr @stderr, align 8
  %121 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %120, ptr noundef @.str.2, i32 noundef 63)
  br label %125

122:                                              ; preds = %117
  %123 = load ptr, ptr @stderr, align 8
  %124 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %123, ptr noundef @.str.3, i32 noundef 63, i32 noundef %.06)
  br label %125

125:                                              ; preds = %122, %119
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

15:                                               ; preds = %166, %14
  %.112 = phi i32 [ %2, %14 ], [ %167, %166 ]
  %.010 = phi i32 [ 1, %14 ], [ %21, %166 ]
  %16 = icmp sge i32 %.112, 1
  br i1 %16, label %17, label %168

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

26:                                               ; preds = %82, %17
  %.07 = phi i32 [ 1, %17 ], [ %81, %82 ]
  %.03 = phi i32 [ 1, %17 ], [ %83, %82 ]
  %27 = icmp sle i32 %.03, %24
  br i1 %27, label %28, label %84

28:                                               ; preds = %26
  %29 = icmp slt i32 %.03, %.07
  br i1 %29, label %30, label %69

30:                                               ; preds = %28
  br label %31

31:                                               ; preds = %66, %30
  %.02 = phi i32 [ %.03, %30 ], [ %67, %66 ]
  %32 = add nsw i32 %.03, %23
  %33 = sub nsw i32 %32, 2
  %34 = icmp sle i32 %.02, %33
  br i1 %34, label %35, label %68

35:                                               ; preds = %31
  br label %36

36:                                               ; preds = %63, %35
  %.05 = phi i32 [ %.02, %35 ], [ %64, %63 ]
  %37 = icmp sle i32 %.05, %25
  br i1 %37, label %38, label %65

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
  %59 = sext i32 %51 to i64
  %60 = getelementptr inbounds double, ptr %0, i64 %59
  store double %58, ptr %60, align 8
  %61 = sext i32 %55 to i64
  %62 = getelementptr inbounds double, ptr %0, i64 %61
  store double %54, ptr %62, align 8
  br label %63

63:                                               ; preds = %38
  %64 = add nsw i32 %.05, %24
  br label %36, !llvm.loop !14

65:                                               ; preds = %36
  br label %66

66:                                               ; preds = %65
  %67 = add nsw i32 %.02, 2
  br label %31, !llvm.loop !15

68:                                               ; preds = %31
  br label %69

69:                                               ; preds = %68, %28
  %70 = ashr i32 %24, 1
  br label %71

71:                                               ; preds = %77, %69
  %.013 = phi i32 [ %70, %69 ], [ %79, %77 ]
  %.18 = phi i32 [ %.07, %69 ], [ %78, %77 ]
  %72 = icmp sge i32 %.013, %23
  br i1 %72, label %73, label %75

73:                                               ; preds = %71
  %74 = icmp sgt i32 %.18, %.013
  br label %75

75:                                               ; preds = %73, %71
  %76 = phi i1 [ false, %71 ], [ %74, %73 ]
  br i1 %76, label %77, label %80

77:                                               ; preds = %75
  %78 = sub nsw i32 %.18, %.013
  %79 = ashr i32 %.013, 1
  br label %71, !llvm.loop !16

80:                                               ; preds = %75
  %81 = add nsw i32 %.18, %.013
  br label %82

82:                                               ; preds = %80
  %83 = add nsw i32 %.03, %23
  br label %26, !llvm.loop !17

84:                                               ; preds = %26
  br label %85

85:                                               ; preds = %164, %84
  %.014 = phi i32 [ %23, %84 ], [ %88, %164 ]
  %86 = icmp slt i32 %.014, %24
  br i1 %86, label %87, label %165

87:                                               ; preds = %85
  %88 = shl i32 %.014, 1
  %89 = sitofp i32 %3 to double
  %90 = fmul double %89, 0x401921FB54442D1C
  %91 = sdiv i32 %88, %23
  %92 = sitofp i32 %91 to double
  %93 = fdiv double %90, %92
  %94 = fmul double 5.000000e-01, %93
  %95 = call double @sin(double noundef %94) #9
  %96 = fmul double -2.000000e+00, %95
  %97 = fmul double %96, %95
  %98 = call double @sin(double noundef %93) #9
  br label %99

99:                                               ; preds = %163, %87
  %.16 = phi i32 [ 1, %87 ], [ %103, %163 ]
  %.01 = phi double [ 0.000000e+00, %87 ], [ %162, %163 ]
  %.0 = phi double [ 1.000000e+00, %87 ], [ %159, %163 ]
  %100 = icmp sle i32 %.16, %.014
  br i1 %100, label %101, label %164

101:                                              ; preds = %99
  br label %102

102:                                              ; preds = %153, %101
  %.1 = phi i32 [ %.16, %101 ], [ %154, %153 ]
  %103 = add nsw i32 %.16, %23
  %104 = sub nsw i32 %103, 2
  %105 = icmp sle i32 %.1, %104
  br i1 %105, label %106, label %155

106:                                              ; preds = %102
  br label %107

107:                                              ; preds = %150, %106
  %.14 = phi i32 [ %.1, %106 ], [ %151, %150 ]
  %108 = icmp sle i32 %.14, %25
  br i1 %108, label %109, label %152

109:                                              ; preds = %107
  %110 = add nsw i32 %.14, %.014
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, ptr %0, i64 %111
  %113 = load double, ptr %112, align 8
  %114 = add nsw i32 %110, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, ptr %0, i64 %115
  %117 = load double, ptr %116, align 8
  %118 = fmul double %.01, %117
  %119 = fneg double %118
  %120 = call double @llvm.fmuladd.f64(double %.0, double %113, double %119)
  %121 = sext i32 %114 to i64
  %122 = getelementptr inbounds double, ptr %0, i64 %121
  %123 = load double, ptr %122, align 8
  %124 = sext i32 %110 to i64
  %125 = getelementptr inbounds double, ptr %0, i64 %124
  %126 = load double, ptr %125, align 8
  %127 = fmul double %.01, %126
  %128 = call double @llvm.fmuladd.f64(double %.0, double %123, double %127)
  %129 = sext i32 %.14 to i64
  %130 = getelementptr inbounds double, ptr %0, i64 %129
  %131 = load double, ptr %130, align 8
  %132 = fsub double %131, %120
  %133 = sext i32 %110 to i64
  %134 = getelementptr inbounds double, ptr %0, i64 %133
  store double %132, ptr %134, align 8
  %135 = add nsw i32 %.14, 1
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, ptr %0, i64 %136
  %138 = load double, ptr %137, align 8
  %139 = fsub double %138, %128
  %140 = sext i32 %114 to i64
  %141 = getelementptr inbounds double, ptr %0, i64 %140
  store double %139, ptr %141, align 8
  %142 = sext i32 %.14 to i64
  %143 = getelementptr inbounds double, ptr %0, i64 %142
  %144 = load double, ptr %143, align 8
  %145 = fadd double %144, %120
  store double %145, ptr %143, align 8
  %146 = sext i32 %135 to i64
  %147 = getelementptr inbounds double, ptr %0, i64 %146
  %148 = load double, ptr %147, align 8
  %149 = fadd double %148, %128
  store double %149, ptr %147, align 8
  br label %150

150:                                              ; preds = %109
  %151 = add nsw i32 %.14, %88
  br label %107, !llvm.loop !18

152:                                              ; preds = %107
  br label %153

153:                                              ; preds = %152
  %154 = add nsw i32 %.1, 2
  br label %102, !llvm.loop !19

155:                                              ; preds = %102
  %156 = fmul double %.01, %98
  %157 = fneg double %156
  %158 = call double @llvm.fmuladd.f64(double %.0, double %97, double %157)
  %159 = fadd double %158, %.0
  %160 = fmul double %.0, %98
  %161 = call double @llvm.fmuladd.f64(double %.01, double %97, double %160)
  %162 = fadd double %161, %.01
  br label %163

163:                                              ; preds = %155
  br label %99, !llvm.loop !20

164:                                              ; preds = %99
  br label %85, !llvm.loop !21

165:                                              ; preds = %85
  br label %166

166:                                              ; preds = %165
  %167 = add nsw i32 %.112, -1
  br label %15, !llvm.loop !22

168:                                              ; preds = %15
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
