; ModuleID = '<stdin>'
source_filename = "tests/testing/n-body.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = dso_local global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @advance(i32 noundef %nbodies, ptr noundef %bodies, double noundef %dt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc35, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc36, %for.inc35 ]
  %cmp = icmp slt i32 %i.0, %nbodies
  br i1 %cmp, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom
  %add = add nsw i32 %i.0, 1
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ %add, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, %nbodies
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %j.0 to i64
  %arrayidx5 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom4
  %x = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 0
  %0 = load double, ptr %x, align 8
  %x6 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 0
  %1 = load double, ptr %x6, align 8
  %sub = fsub double %0, %1
  %y = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 1
  %2 = load double, ptr %y, align 8
  %y7 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 1
  %3 = load double, ptr %y7, align 8
  %sub8 = fsub double %2, %3
  %z = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 2
  %4 = load double, ptr %z, align 8
  %z9 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 2
  %5 = load double, ptr %z9, align 8
  %sub10 = fsub double %4, %5
  %mul11 = fmul double %sub8, %sub8
  %6 = call double @llvm.fmuladd.f64(double %sub, double %sub, double %mul11)
  %7 = call double @llvm.fmuladd.f64(double %sub10, double %sub10, double %6)
  %call = call double @sqrt(double noundef %7) #4
  %mul = fmul double %call, %call
  %mul12 = fmul double %mul, %call
  %div = fdiv double %dt, %mul12
  %mass = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 6
  %8 = load double, ptr %mass, align 8
  %mul13 = fmul double %sub, %8
  %vx = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 3
  %9 = load double, ptr %vx, align 8
  %neg = fneg double %mul13
  %10 = call double @llvm.fmuladd.f64(double %neg, double %div, double %9)
  store double %10, ptr %vx, align 8
  %mass15 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 6
  %11 = load double, ptr %mass15, align 8
  %mul16 = fmul double %sub8, %11
  %vy = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 4
  %12 = load double, ptr %vy, align 8
  %neg18 = fneg double %mul16
  %13 = call double @llvm.fmuladd.f64(double %neg18, double %div, double %12)
  store double %13, ptr %vy, align 8
  %mass19 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 6
  %14 = load double, ptr %mass19, align 8
  %mul20 = fmul double %sub10, %14
  %vz = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 5
  %15 = load double, ptr %vz, align 8
  %neg22 = fneg double %mul20
  %16 = call double @llvm.fmuladd.f64(double %neg22, double %div, double %15)
  store double %16, ptr %vz, align 8
  %mass23 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 6
  %17 = load double, ptr %mass23, align 8
  %mul24 = fmul double %sub, %17
  %vx26 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 3
  %18 = load double, ptr %vx26, align 8
  %19 = call double @llvm.fmuladd.f64(double %mul24, double %div, double %18)
  store double %19, ptr %vx26, align 8
  %mass27 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 6
  %20 = load double, ptr %mass27, align 8
  %mul28 = fmul double %sub8, %20
  %vy30 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 4
  %21 = load double, ptr %vy30, align 8
  %22 = call double @llvm.fmuladd.f64(double %mul28, double %div, double %21)
  store double %22, ptr %vy30, align 8
  %mass31 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 6
  %23 = load double, ptr %mass31, align 8
  %mul32 = fmul double %sub10, %23
  %vz34 = getelementptr inbounds %struct.planet, ptr %arrayidx5, i32 0, i32 5
  %24 = load double, ptr %vz34, align 8
  %25 = call double @llvm.fmuladd.f64(double %mul32, double %div, double %24)
  store double %25, ptr %vz34, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond1, !llvm.loop !6

for.end:                                          ; preds = %for.cond1
  br label %for.inc35

for.inc35:                                        ; preds = %for.end
  %inc36 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end37:                                        ; preds = %for.cond
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc53, %for.end37
  %i.1 = phi i32 [ 0, %for.end37 ], [ %inc54, %for.inc53 ]
  %cmp39 = icmp slt i32 %i.1, %nbodies
  br i1 %cmp39, label %for.body40, label %for.end55

for.body40:                                       ; preds = %for.cond38
  %idxprom42 = sext i32 %i.1 to i64
  %arrayidx43 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom42
  %vx44 = getelementptr inbounds %struct.planet, ptr %arrayidx43, i32 0, i32 3
  %26 = load double, ptr %vx44, align 8
  %x46 = getelementptr inbounds %struct.planet, ptr %arrayidx43, i32 0, i32 0
  %27 = load double, ptr %x46, align 8
  %28 = call double @llvm.fmuladd.f64(double %dt, double %26, double %27)
  store double %28, ptr %x46, align 8
  %vy47 = getelementptr inbounds %struct.planet, ptr %arrayidx43, i32 0, i32 4
  %29 = load double, ptr %vy47, align 8
  %y49 = getelementptr inbounds %struct.planet, ptr %arrayidx43, i32 0, i32 1
  %30 = load double, ptr %y49, align 8
  %31 = call double @llvm.fmuladd.f64(double %dt, double %29, double %30)
  store double %31, ptr %y49, align 8
  %vz50 = getelementptr inbounds %struct.planet, ptr %arrayidx43, i32 0, i32 5
  %32 = load double, ptr %vz50, align 8
  %z52 = getelementptr inbounds %struct.planet, ptr %arrayidx43, i32 0, i32 2
  %33 = load double, ptr %z52, align 8
  %34 = call double @llvm.fmuladd.f64(double %dt, double %32, double %33)
  store double %34, ptr %z52, align 8
  br label %for.inc53

for.inc53:                                        ; preds = %for.body40
  %inc54 = add nsw i32 %i.1, 1
  br label %for.cond38, !llvm.loop !9

for.end55:                                        ; preds = %for.cond38
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @energy(i32 noundef %nbodies, ptr noundef %bodies) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %e.0 = phi double [ 0.000000e+00, %entry ], [ %e.1, %for.inc25 ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc26, %for.inc25 ]
  %cmp = icmp slt i32 %i.0, %nbodies
  br i1 %cmp, label %for.body, label %for.end27

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom
  %mass = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 6
  %0 = load double, ptr %mass, align 8
  %mul = fmul double 5.000000e-01, %0
  %vx = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 3
  %1 = load double, ptr %vx, align 8
  %vx1 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 3
  %2 = load double, ptr %vx1, align 8
  %vy = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 4
  %3 = load double, ptr %vy, align 8
  %vy3 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 4
  %4 = load double, ptr %vy3, align 8
  %mul4 = fmul double %3, %4
  %5 = call double @llvm.fmuladd.f64(double %1, double %2, double %mul4)
  %vz = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 5
  %6 = load double, ptr %vz, align 8
  %vz5 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 5
  %7 = load double, ptr %vz5, align 8
  %8 = call double @llvm.fmuladd.f64(double %6, double %7, double %5)
  %9 = call double @llvm.fmuladd.f64(double %mul, double %8, double %e.0)
  %add = add nsw i32 %i.0, 1
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body
  %e.1 = phi double [ %9, %for.body ], [ %sub24, %for.inc ]
  %j.0 = phi i32 [ %add, %for.body ], [ %inc, %for.inc ]
  %cmp9 = icmp slt i32 %j.0, %nbodies
  br i1 %cmp9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond8
  %idxprom11 = sext i32 %j.0 to i64
  %arrayidx12 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom11
  %x = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 0
  %10 = load double, ptr %x, align 8
  %x13 = getelementptr inbounds %struct.planet, ptr %arrayidx12, i32 0, i32 0
  %11 = load double, ptr %x13, align 8
  %sub = fsub double %10, %11
  %y = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 1
  %12 = load double, ptr %y, align 8
  %y14 = getelementptr inbounds %struct.planet, ptr %arrayidx12, i32 0, i32 1
  %13 = load double, ptr %y14, align 8
  %sub15 = fsub double %12, %13
  %z = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 2
  %14 = load double, ptr %z, align 8
  %z16 = getelementptr inbounds %struct.planet, ptr %arrayidx12, i32 0, i32 2
  %15 = load double, ptr %z16, align 8
  %sub17 = fsub double %14, %15
  %mul19 = fmul double %sub15, %sub15
  %16 = call double @llvm.fmuladd.f64(double %sub, double %sub, double %mul19)
  %17 = call double @llvm.fmuladd.f64(double %sub17, double %sub17, double %16)
  %call = call double @sqrt(double noundef %17) #4
  %mass21 = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 6
  %18 = load double, ptr %mass21, align 8
  %mass22 = getelementptr inbounds %struct.planet, ptr %arrayidx12, i32 0, i32 6
  %19 = load double, ptr %mass22, align 8
  %mul23 = fmul double %18, %19
  %div = fdiv double %mul23, %call
  %sub24 = fsub double %e.1, %div
  br label %for.inc

for.inc:                                          ; preds = %for.body10
  %inc = add nsw i32 %j.0, 1
  br label %for.cond8, !llvm.loop !10

for.end:                                          ; preds = %for.cond8
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %inc26 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !11

for.end27:                                        ; preds = %for.cond
  ret double %e.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @offset_momentum(i32 noundef %nbodies, ptr noundef %bodies) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %py.0 = phi double [ 0.000000e+00, %entry ], [ %5, %for.inc ]
  %px.0 = phi double [ 0.000000e+00, %entry ], [ %2, %for.inc ]
  %pz.0 = phi double [ 0.000000e+00, %entry ], [ %8, %for.inc ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, %nbodies
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom
  %vx = getelementptr inbounds %struct.planet, ptr %arrayidx, i32 0, i32 3
  %0 = load double, ptr %vx, align 8
  %idxprom1 = sext i32 %i.0 to i64
  %arrayidx2 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom1
  %mass = getelementptr inbounds %struct.planet, ptr %arrayidx2, i32 0, i32 6
  %1 = load double, ptr %mass, align 8
  %2 = call double @llvm.fmuladd.f64(double %0, double %1, double %px.0)
  %idxprom3 = sext i32 %i.0 to i64
  %arrayidx4 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom3
  %vy = getelementptr inbounds %struct.planet, ptr %arrayidx4, i32 0, i32 4
  %3 = load double, ptr %vy, align 8
  %idxprom5 = sext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom5
  %mass7 = getelementptr inbounds %struct.planet, ptr %arrayidx6, i32 0, i32 6
  %4 = load double, ptr %mass7, align 8
  %5 = call double @llvm.fmuladd.f64(double %3, double %4, double %py.0)
  %idxprom8 = sext i32 %i.0 to i64
  %arrayidx9 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom8
  %vz = getelementptr inbounds %struct.planet, ptr %arrayidx9, i32 0, i32 5
  %6 = load double, ptr %vz, align 8
  %idxprom10 = sext i32 %i.0 to i64
  %arrayidx11 = getelementptr inbounds %struct.planet, ptr %bodies, i64 %idxprom10
  %mass12 = getelementptr inbounds %struct.planet, ptr %arrayidx11, i32 0, i32 6
  %7 = load double, ptr %mass12, align 8
  %8 = call double @llvm.fmuladd.f64(double %6, double %7, double %pz.0)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  %fneg = fneg double %px.0
  %div = fdiv double %fneg, 0x4043BD3CC9BE45DE
  %arrayidx13 = getelementptr inbounds %struct.planet, ptr %bodies, i64 0
  %vx14 = getelementptr inbounds %struct.planet, ptr %arrayidx13, i32 0, i32 3
  store double %div, ptr %vx14, align 8
  %fneg15 = fneg double %py.0
  %div16 = fdiv double %fneg15, 0x4043BD3CC9BE45DE
  %arrayidx17 = getelementptr inbounds %struct.planet, ptr %bodies, i64 0
  %vy18 = getelementptr inbounds %struct.planet, ptr %arrayidx17, i32 0, i32 4
  store double %div16, ptr %vy18, align 8
  %fneg19 = fneg double %pz.0
  %div20 = fdiv double %fneg19, 0x4043BD3CC9BE45DE
  %arrayidx21 = getelementptr inbounds %struct.planet, ptr %bodies, i64 0
  %vz22 = getelementptr inbounds %struct.planet, ptr %arrayidx21, i32 0, i32 5
  store double %div20, ptr %vz22, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  call void @offset_momentum(i32 noundef 5, ptr noundef @bodies)
  %call = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %cmp = icmp sle i32 %i.0, 5000000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @advance(i32 noundef 5, ptr noundef @bodies, double noundef 1.000000e-02)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !13

for.end:                                          ; preds = %for.cond
  %call2 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call2)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
