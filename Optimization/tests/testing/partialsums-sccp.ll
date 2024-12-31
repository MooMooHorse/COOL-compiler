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
define dso_local <2 x double> @make_vec(double noundef %a, double noundef %b) #0 {
entry:
  %v = alloca <2 x double>, align 16
  store double %a, ptr %v, align 8
  %add.ptr = getelementptr inbounds double, ptr %v, i64 1
  store double %b, ptr %add.ptr, align 8
  %0 = load <2 x double>, ptr %v, align 16
  ret <2 x double> %0
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @sum_vec(<2 x double> noundef %x) #0 {
entry:
  %x.addr = alloca <2 x double>, align 16
  store <2 x double> %x, ptr %x.addr, align 16
  %0 = load double, ptr %x.addr, align 8
  %add.ptr = getelementptr inbounds double, ptr %x.addr, i64 1
  %1 = load double, ptr %add.ptr, align 8
  %add = fadd double %0, %1
  ret double %add
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %kv = alloca <2 x double>, align 16
  %call = call <2 x double> @make_vec(double noundef 0.000000e+00, double noundef 0.000000e+00)
  %call1 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 1.000000e+00)
  %call2 = call <2 x double> @make_vec(double noundef 2.000000e+00, double noundef 2.000000e+00)
  %call3 = call <2 x double> @make_vec(double noundef -1.000000e+00, double noundef -1.000000e+00)
  %call4 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef 2.000000e+00)
  %call5 = call <2 x double> @make_vec(double noundef 1.000000e+00, double noundef -1.000000e+00)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %Cookson.0 = phi double [ 0.000000e+00, %entry ], [ %add20, %for.inc ]
  %Flint.0 = phi double [ 0.000000e+00, %entry ], [ %add16, %for.inc ]
  %sqrts.0 = phi double [ 0.000000e+00, %entry ], [ %add9, %for.inc ]
  %twoThrd.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ]
  %k.0 = phi double [ 1.000000e+00, %entry ], [ %inc, %for.inc ]
  %cmp = fcmp ole double %k.0, 2.500000e+06
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %sub = fsub double %k.0, 1.000000e+00
  %call7 = call double @pow(double noundef 0x3FE5555555555555, double noundef %sub) #4
  %add = fadd double %twoThrd.0, %call7
  %call8 = call double @sqrt(double noundef %k.0) #4
  %div = fdiv double 1.000000e+00, %call8
  %add9 = fadd double %sqrts.0, %div
  %mul = fmul double %k.0, %k.0
  %mul10 = fmul double %mul, %k.0
  %call11 = call double @sin(double noundef %k.0) #4
  %call12 = call double @cos(double noundef %k.0) #4
  %mul13 = fmul double %mul10, %call11
  %mul14 = fmul double %mul13, %call11
  %div15 = fdiv double 1.000000e+00, %mul14
  %add16 = fadd double %Flint.0, %div15
  %mul17 = fmul double %mul10, %call12
  %mul18 = fmul double %mul17, %call12
  %div19 = fdiv double 1.000000e+00, %mul18
  %add20 = fadd double %Cookson.0, %div19
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = fadd double %k.0, 1.000000e+00
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store <2 x double> %call4, ptr %kv, align 16
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc40, %for.end
  %poly.0 = phi <2 x double> [ %call, %for.end ], [ %add29, %for.inc40 ]
  %zeta.0 = phi <2 x double> [ %call, %for.end ], [ %add34, %for.inc40 ]
  %Harmonic.0 = phi <2 x double> [ %call, %for.end ], [ %add31, %for.inc40 ]
  %alt.0 = phi <2 x double> [ %call, %for.end ], [ %add36, %for.inc40 ]
  %Gregory.0 = phi <2 x double> [ %call, %for.end ], [ %add39, %for.inc40 ]
  %0 = load double, ptr %kv, align 16
  %cmp23 = fcmp ole double %0, 2.500000e+06
  br i1 %cmp23, label %for.body25, label %for.end42

for.body25:                                       ; preds = %for.cond21
  %1 = load <2 x double>, ptr %kv, align 16
  %2 = load <2 x double>, ptr %kv, align 16
  %add26 = fadd <2 x double> %2, %call1
  %mul27 = fmul <2 x double> %1, %add26
  %div28 = fdiv <2 x double> %call1, %mul27
  %add29 = fadd <2 x double> %poly.0, %div28
  %3 = load <2 x double>, ptr %kv, align 16
  %div30 = fdiv <2 x double> %call1, %3
  %add31 = fadd <2 x double> %Harmonic.0, %div30
  %4 = load <2 x double>, ptr %kv, align 16
  %5 = load <2 x double>, ptr %kv, align 16
  %mul32 = fmul <2 x double> %4, %5
  %div33 = fdiv <2 x double> %call1, %mul32
  %add34 = fadd <2 x double> %zeta.0, %div33
  %6 = load <2 x double>, ptr %kv, align 16
  %div35 = fdiv <2 x double> %call5, %6
  %add36 = fadd <2 x double> %alt.0, %div35
  %7 = load <2 x double>, ptr %kv, align 16
  %neg = fneg <2 x double> %call1
  %8 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %call2, <2 x double> %7, <2 x double> %neg)
  %div38 = fdiv <2 x double> %call5, %8
  %add39 = fadd <2 x double> %Gregory.0, %div38
  br label %for.inc40

for.inc40:                                        ; preds = %for.body25
  %9 = load <2 x double>, ptr %kv, align 16
  %add41 = fadd <2 x double> %9, %call2
  store <2 x double> %add41, ptr %kv, align 16
  br label %for.cond21, !llvm.loop !8

for.end42:                                        ; preds = %for.cond21
  %call43 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %twoThrd.0, ptr noundef @.str.1)
  %call44 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %sqrts.0, ptr noundef @.str.2)
  %call45 = call double @sum_vec(<2 x double> noundef %poly.0)
  %call46 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call45, ptr noundef @.str.3)
  %call47 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %Flint.0, ptr noundef @.str.4)
  %call48 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %Cookson.0, ptr noundef @.str.5)
  %call49 = call double @sum_vec(<2 x double> noundef %Harmonic.0)
  %call50 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call49, ptr noundef @.str.6)
  %call51 = call double @sum_vec(<2 x double> noundef %zeta.0)
  %call52 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call51, ptr noundef @.str.7)
  %call53 = call double @sum_vec(<2 x double> noundef %alt.0)
  %call54 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call53, ptr noundef @.str.8)
  %call55 = call double @sum_vec(<2 x double> noundef %Gregory.0)
  %call56 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call55, ptr noundef @.str.9)
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
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git ce919e92afed6522fae11fdf69158b4b9ead2296)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
