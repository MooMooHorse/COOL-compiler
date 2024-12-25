; ModuleID = '<stdin>'
source_filename = "tests/testing/spectral-norm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @eval_A(i32 noundef %i, i32 noundef %j) #0 {
entry:
  %add = add nsw i32 %i, %j
  %add2 = add nsw i32 %add, 1
  %mul = mul nsw i32 %add, %add2
  %div = sdiv i32 %mul, 2
  %add3 = add nsw i32 %div, %i
  %add4 = add nsw i32 %add3, 1
  %conv = sitofp i32 %add4 to double
  %div5 = fdiv double 1.000000e+00, %conv
  ret double %div5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_A_times_u(i32 noundef %N, ptr noundef %u, ptr noundef %Au) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ]
  %cmp = icmp slt i32 %i.0, %N
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds double, ptr %Au, i64 %idxprom
  store double 0.000000e+00, ptr %arrayidx, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, %N
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call double @eval_A(i32 noundef %i.0, i32 noundef %j.0)
  %idxprom4 = sext i32 %j.0 to i64
  %arrayidx5 = getelementptr inbounds double, ptr %u, i64 %idxprom4
  %0 = load double, ptr %arrayidx5, align 8
  %idxprom6 = sext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds double, ptr %Au, i64 %idxprom6
  %1 = load double, ptr %arrayidx7, align 8
  %2 = call double @llvm.fmuladd.f64(double %call, double %0, double %1)
  store double %2, ptr %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond1, !llvm.loop !6

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %inc9 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end10:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_At_times_u(i32 noundef %N, ptr noundef %u, ptr noundef %Au) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ]
  %cmp = icmp slt i32 %i.0, %N
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds double, ptr %Au, i64 %idxprom
  store double 0.000000e+00, ptr %arrayidx, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, %N
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call double @eval_A(i32 noundef %j.0, i32 noundef %i.0)
  %idxprom4 = sext i32 %j.0 to i64
  %arrayidx5 = getelementptr inbounds double, ptr %u, i64 %idxprom4
  %0 = load double, ptr %arrayidx5, align 8
  %idxprom6 = sext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds double, ptr %Au, i64 %idxprom6
  %1 = load double, ptr %arrayidx7, align 8
  %2 = call double @llvm.fmuladd.f64(double %call, double %0, double %1)
  store double %2, ptr %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond1, !llvm.loop !9

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %inc9 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end10:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_AtA_times_u(i32 noundef %N, ptr noundef %u, ptr noundef %AtAu) #0 {
entry:
  %0 = zext i32 %N to i64
  %1 = call ptr @llvm.stacksave()
  %vla = alloca double, i64 %0, align 16
  call void @eval_A_times_u(i32 noundef %N, ptr noundef %u, ptr noundef %vla)
  call void @eval_At_times_u(i32 noundef %N, ptr noundef %vla, ptr noundef %AtAu)
  call void @llvm.stackrestore(ptr %1)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %cmp = icmp eq i32 %argc, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %arrayidx = getelementptr inbounds ptr, ptr %argv, i64 1
  %0 = load ptr, ptr %arrayidx, align 8
  %call = call i32 @atoi(ptr noundef %0) #6
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 2000, %cond.false ]
  %1 = zext i32 %cond to i64
  %2 = call ptr @llvm.stacksave()
  %vla = alloca double, i64 %1, align 16
  %3 = zext i32 %cond to i64
  %vla1 = alloca double, i64 %3, align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %i.0 = phi i32 [ 0, %cond.end ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %i.0, %cond
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds double, ptr %vla, i64 %idxprom
  store double 1.000000e+00, ptr %arrayidx3, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc7, %for.end
  %i.1 = phi i32 [ 0, %for.end ], [ %inc8, %for.inc7 ]
  %cmp5 = icmp slt i32 %i.1, 10
  br i1 %cmp5, label %for.body6, label %for.end9

for.body6:                                        ; preds = %for.cond4
  call void @eval_AtA_times_u(i32 noundef %cond, ptr noundef %vla, ptr noundef %vla1)
  call void @eval_AtA_times_u(i32 noundef %cond, ptr noundef %vla1, ptr noundef %vla)
  br label %for.inc7

for.inc7:                                         ; preds = %for.body6
  %inc8 = add nsw i32 %i.1, 1
  br label %for.cond4, !llvm.loop !12

for.end9:                                         ; preds = %for.cond4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc21, %for.end9
  %i.2 = phi i32 [ 0, %for.end9 ], [ %inc22, %for.inc21 ]
  %vBv.0 = phi double [ 0.000000e+00, %for.end9 ], [ %6, %for.inc21 ]
  %vv.0 = phi double [ 0.000000e+00, %for.end9 ], [ %9, %for.inc21 ]
  %cmp11 = icmp slt i32 %i.2, %cond
  br i1 %cmp11, label %for.body12, label %for.end23

for.body12:                                       ; preds = %for.cond10
  %idxprom13 = sext i32 %i.2 to i64
  %arrayidx14 = getelementptr inbounds double, ptr %vla, i64 %idxprom13
  %4 = load double, ptr %arrayidx14, align 8
  %idxprom15 = sext i32 %i.2 to i64
  %arrayidx16 = getelementptr inbounds double, ptr %vla1, i64 %idxprom15
  %5 = load double, ptr %arrayidx16, align 8
  %6 = call double @llvm.fmuladd.f64(double %4, double %5, double %vBv.0)
  %idxprom17 = sext i32 %i.2 to i64
  %arrayidx18 = getelementptr inbounds double, ptr %vla1, i64 %idxprom17
  %7 = load double, ptr %arrayidx18, align 8
  %idxprom19 = sext i32 %i.2 to i64
  %arrayidx20 = getelementptr inbounds double, ptr %vla1, i64 %idxprom19
  %8 = load double, ptr %arrayidx20, align 8
  %9 = call double @llvm.fmuladd.f64(double %7, double %8, double %vv.0)
  br label %for.inc21

for.inc21:                                        ; preds = %for.body12
  %inc22 = add nsw i32 %i.2, 1
  br label %for.cond10, !llvm.loop !13

for.end23:                                        ; preds = %for.cond10
  %div = fdiv double %vBv.0, %vv.0
  %call24 = call double @sqrt(double noundef %div) #7
  %call25 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %call24)
  call void @llvm.stackrestore(ptr %2)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

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
