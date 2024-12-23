; ModuleID = '<stdin>'
source_filename = "tests/testing/partialsums.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%.9f\09%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"(2/3)^k\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"k^-0.5\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"1/k(k+1)\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Flint Hills\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Cookson Hills\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Harmonic\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"Riemann Zeta\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"Alternating Harmonic\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"Gregory\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local <2 x double> @make_vec(double noundef %0, double noundef %1) #0 {
  %3 = alloca <2 x double>, align 16
  store double %0, ptr %3, align 8
  %4 = getelementptr inbounds double, ptr %3, i64 1
  store double %1, ptr %4, align 8
  %5 = load <2 x double>, ptr %3, align 16
  ret <2 x double> %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @sum_vec(<2 x double> noundef %0) #0 {
  %2 = alloca <2 x double>, align 16
  store <2 x double> %0, ptr %2, align 16
  %3 = load double, ptr %2, align 8
  %4 = getelementptr inbounds double, ptr %2, i64 1
  %5 = load double, ptr %4, align 8
  %6 = fadd double %3, %5
  ret double %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca <2 x double>, align 16
  %4 = call <2 x double> @make_vec(double noundef 0.000000e+00, double noundef 0.000000e+00)
  %5 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 1.000000e+00)
  %6 = call <2 x double> @make_vec(double noundef 2.000000e+00, double noundef 2.000000e+00)
  %7 = call <2 x double> @make_vec(double noundef -1.000000e+00, double noundef -1.000000e+00)
  %8 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 2.000000e+00)
  %9 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef -1.000000e+00)
  %10 = sitofp i32 2500000 to double
  br label %11

11:                                               ; preds = %32, %2
  %.06 = phi double [ 0.000000e+00, %2 ], [ %31, %32 ]
  %.05 = phi double [ 0.000000e+00, %2 ], [ %27, %32 ]
  %.04 = phi double [ 0.000000e+00, %2 ], [ %19, %32 ]
  %.03 = phi double [ 0.000000e+00, %2 ], [ %16, %32 ]
  %.0 = phi double [ 1.000000e+00, %2 ], [ %33, %32 ]
  %12 = fcmp ole double %.0, %10
  br i1 %12, label %13, label %34

13:                                               ; preds = %11
  %14 = fsub double %.0, 1.000000e+00
  %15 = call double @pow(double noundef 0x3FE5555555555555, double noundef %14) #4
  %16 = fadd double %.03, %15
  %17 = call double @sqrt(double noundef %.0) #4
  %18 = fdiv double 1.000000e+00, %17
  %19 = fadd double %.04, %18
  %20 = fmul double %.0, %.0
  %21 = fmul double %20, %.0
  %22 = call double @sin(double noundef %.0) #4
  %23 = call double @cos(double noundef %.0) #4
  %24 = fmul double %21, %22
  %25 = fmul double %24, %22
  %26 = fdiv double 1.000000e+00, %25
  %27 = fadd double %.05, %26
  %28 = fmul double %21, %23
  %29 = fmul double %28, %23
  %30 = fdiv double 1.000000e+00, %29
  %31 = fadd double %.06, %30
  br label %32

32:                                               ; preds = %13
  %33 = fadd double %.0, 1.000000e+00
  br label %11, !llvm.loop !6

34:                                               ; preds = %11
  store <2 x double> %8, ptr %3, align 16
  %35 = sitofp i32 2500000 to double
  %36 = fneg <2 x double> %5
  br label %37

37:                                               ; preds = %62, %34
  %.09 = phi <2 x double> [ %4, %34 ], [ %46, %62 ]
  %.08 = phi <2 x double> [ %4, %34 ], [ %54, %62 ]
  %.07 = phi <2 x double> [ %4, %34 ], [ %49, %62 ]
  %.02 = phi <2 x double> [ %4, %34 ], [ %57, %62 ]
  %.01 = phi <2 x double> [ %4, %34 ], [ %61, %62 ]
  %38 = load double, ptr %3, align 16
  %39 = fcmp ole double %38, %35
  br i1 %39, label %40, label %65

40:                                               ; preds = %37
  %41 = load <2 x double>, ptr %3, align 16
  %42 = load <2 x double>, ptr %3, align 16
  %43 = fadd <2 x double> %42, %5
  %44 = fmul <2 x double> %41, %43
  %45 = fdiv <2 x double> %5, %44
  %46 = fadd <2 x double> %.09, %45
  %47 = load <2 x double>, ptr %3, align 16
  %48 = fdiv <2 x double> %5, %47
  %49 = fadd <2 x double> %.07, %48
  %50 = load <2 x double>, ptr %3, align 16
  %51 = load <2 x double>, ptr %3, align 16
  %52 = fmul <2 x double> %50, %51
  %53 = fdiv <2 x double> %5, %52
  %54 = fadd <2 x double> %.08, %53
  %55 = load <2 x double>, ptr %3, align 16
  %56 = fdiv <2 x double> %9, %55
  %57 = fadd <2 x double> %.02, %56
  %58 = load <2 x double>, ptr %3, align 16
  %59 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %6, <2 x double> %58, <2 x double> %36)
  %60 = fdiv <2 x double> %9, %59
  %61 = fadd <2 x double> %.01, %60
  br label %62

62:                                               ; preds = %40
  %63 = load <2 x double>, ptr %3, align 16
  %64 = fadd <2 x double> %63, %6
  store <2 x double> %64, ptr %3, align 16
  br label %37, !llvm.loop !8

65:                                               ; preds = %37
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.03, ptr noundef @.str.1)
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.04, ptr noundef @.str.2)
  %68 = call double @sum_vec(<2 x double> noundef %.09)
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %68, ptr noundef @.str.3)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.05, ptr noundef @.str.4)
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %.06, ptr noundef @.str.5)
  %72 = call double @sum_vec(<2 x double> noundef %.07)
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %72, ptr noundef @.str.6)
  %74 = call double @sum_vec(<2 x double> noundef %.08)
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %74, ptr noundef @.str.7)
  %76 = call double @sum_vec(<2 x double> noundef %.02)
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %76, ptr noundef @.str.8)
  %78 = call double @sum_vec(<2 x double> noundef %.01)
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %78, ptr noundef @.str.9)
  ret i32 0
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
