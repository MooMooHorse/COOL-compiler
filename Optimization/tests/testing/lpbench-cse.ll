; ModuleID = '<stdin>'
source_filename = "tests/testing/lpbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global ptr, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @matgen(ptr noundef %a, ptr noundef %b) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc6 ]
  %cmp = icmp slt i32 %i.0, 2000
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, 2000
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call double @random_double()
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %a, i64 %idxprom
  %0 = load ptr, ptr %arrayidx, align 8
  %idxprom4 = sext i32 %i.0 to i64
  %arrayidx5 = getelementptr inbounds double, ptr %0, i64 %idxprom4
  store double %call, ptr %arrayidx5, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond1, !llvm.loop !6

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %inc7 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end8:                                         ; preds = %for.cond
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc14, %for.end8
  %i.1 = phi i32 [ 0, %for.end8 ], [ %inc15, %for.inc14 ]
  %cmp10 = icmp slt i32 %i.1, 2000
  br i1 %cmp10, label %for.body11, label %for.end16

for.body11:                                       ; preds = %for.cond9
  %idxprom12 = sext i32 %i.1 to i64
  %arrayidx13 = getelementptr inbounds double, ptr %b, i64 %idxprom12
  store double 0.000000e+00, ptr %arrayidx13, align 8
  br label %for.inc14

for.inc14:                                        ; preds = %for.body11
  %inc15 = add nsw i32 %i.1, 1
  br label %for.cond9, !llvm.loop !9

for.end16:                                        ; preds = %for.cond9
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc32, %for.end16
  %j.1 = phi i32 [ 0, %for.end16 ], [ %inc33, %for.inc32 ]
  %cmp18 = icmp slt i32 %j.1, 2000
  br i1 %cmp18, label %for.body19, label %for.end34

for.body19:                                       ; preds = %for.cond17
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc29, %for.body19
  %i.2 = phi i32 [ 0, %for.body19 ], [ %inc30, %for.inc29 ]
  %cmp21 = icmp slt i32 %i.2, 2000
  br i1 %cmp21, label %for.body22, label %for.end31

for.body22:                                       ; preds = %for.cond20
  %idxprom23 = sext i32 %j.1 to i64
  %arrayidx24 = getelementptr inbounds ptr, ptr %a, i64 %idxprom23
  %1 = load ptr, ptr %arrayidx24, align 8
  %idxprom25 = sext i32 %i.2 to i64
  %arrayidx26 = getelementptr inbounds double, ptr %1, i64 %idxprom25
  %2 = load double, ptr %arrayidx26, align 8
  %idxprom27 = sext i32 %i.2 to i64
  %arrayidx28 = getelementptr inbounds double, ptr %b, i64 %idxprom27
  %3 = load double, ptr %arrayidx28, align 8
  %add = fadd double %3, %2
  store double %add, ptr %arrayidx28, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.body22
  %inc30 = add nsw i32 %i.2, 1
  br label %for.cond20, !llvm.loop !10

for.end31:                                        ; preds = %for.cond20
  br label %for.inc32

for.inc32:                                        ; preds = %for.end31
  %inc33 = add nsw i32 %j.1, 1
  br label %for.cond17, !llvm.loop !11

for.end34:                                        ; preds = %for.cond17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @idamax(i32 noundef %n, ptr noundef %dx, i32 noundef %dx_off, i32 noundef %incx) #0 {
entry:
  %cmp = icmp slt i32 %n, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end30

if.else:                                          ; preds = %entry
  br i1 %cmp, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  br label %if.end29

if.else3:                                         ; preds = %if.else
  %cmp4 = icmp ne i32 %incx, 1
  br i1 %cmp4, label %if.then5, label %if.else13

if.then5:                                         ; preds = %if.else3
  %idxprom = sext i32 %dx_off to i64
  %arrayidx = getelementptr inbounds double, ptr %dx, i64 %idxprom
  %0 = load double, ptr %arrayidx, align 8
  %1 = call double @llvm.fabs.f64(double %0)
  %add = add nsw i32 1, %incx
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then5
  %dmax.0 = phi double [ %1, %if.then5 ], [ %dmax.1, %for.inc ]
  %i.0 = phi i32 [ 1, %if.then5 ], [ %inc, %for.inc ]
  %ix.0 = phi i32 [ %add, %if.then5 ], [ %add12, %for.inc ]
  %itemp.0 = phi i32 [ 0, %if.then5 ], [ %itemp.1, %for.inc ]
  %cmp6 = icmp slt i32 %i.0, %n
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add7 = add nsw i32 %ix.0, %dx_off
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds double, ptr %dx, i64 %idxprom8
  %2 = load double, ptr %arrayidx9, align 8
  %3 = call double @llvm.fabs.f64(double %2)
  %cmp10 = fcmp ogt double %3, %dmax.0
  br i1 %cmp10, label %if.then11, label %if.end

if.then11:                                        ; preds = %for.body
  br label %if.end

if.end:                                           ; preds = %if.then11, %for.body
  %dmax.1 = phi double [ %3, %if.then11 ], [ %dmax.0, %for.body ]
  %itemp.1 = phi i32 [ %i.0, %if.then11 ], [ %itemp.0, %for.body ]
  %add12 = add nsw i32 %ix.0, %incx
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  br label %if.end28

if.else13:                                        ; preds = %if.else3
  %idxprom14 = sext i32 %dx_off to i64
  %arrayidx15 = getelementptr inbounds double, ptr %dx, i64 %idxprom14
  %4 = load double, ptr %arrayidx15, align 8
  %5 = call double @llvm.fabs.f64(double %4)
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc25, %if.else13
  %dmax.2 = phi double [ %5, %if.else13 ], [ %dmax.3, %for.inc25 ]
  %i.1 = phi i32 [ 1, %if.else13 ], [ %inc26, %for.inc25 ]
  %itemp.2 = phi i32 [ 0, %if.else13 ], [ %itemp.3, %for.inc25 ]
  %cmp17 = icmp slt i32 %i.1, %n
  br i1 %cmp17, label %for.body18, label %for.end27

for.body18:                                       ; preds = %for.cond16
  %add19 = add nsw i32 %i.1, %dx_off
  %idxprom20 = sext i32 %add19 to i64
  %arrayidx21 = getelementptr inbounds double, ptr %dx, i64 %idxprom20
  %6 = load double, ptr %arrayidx21, align 8
  %7 = call double @llvm.fabs.f64(double %6)
  %cmp22 = fcmp ogt double %7, %dmax.2
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %for.body18
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %for.body18
  %dmax.3 = phi double [ %7, %if.then23 ], [ %dmax.2, %for.body18 ]
  %itemp.3 = phi i32 [ %i.1, %if.then23 ], [ %itemp.2, %for.body18 ]
  br label %for.inc25

for.inc25:                                        ; preds = %if.end24
  %inc26 = add nsw i32 %i.1, 1
  br label %for.cond16, !llvm.loop !13

for.end27:                                        ; preds = %for.cond16
  br label %if.end28

if.end28:                                         ; preds = %for.end27, %for.end
  %itemp.4 = phi i32 [ %itemp.0, %for.end ], [ %itemp.2, %for.end27 ]
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %if.then2
  %itemp.5 = phi i32 [ 0, %if.then2 ], [ %itemp.4, %if.end28 ]
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then
  %itemp.6 = phi i32 [ -1, %if.then ], [ %itemp.5, %if.end29 ]
  ret i32 %itemp.6
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dscal(i32 noundef %n, double noundef %da, ptr noundef %dx, i32 noundef %dx_off, i32 noundef %incx) #0 {
entry:
  %cmp = icmp sgt i32 %n, 0
  br i1 %cmp, label %if.then, label %if.end15

if.then:                                          ; preds = %entry
  %cmp1 = icmp ne i32 %incx, 1
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %mul = mul nsw i32 %n, %incx
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %i.0 = phi i32 [ 0, %if.then2 ], [ %add5, %for.inc ]
  %cmp3 = icmp slt i32 %i.0, %mul
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, %dx_off
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, ptr %dx, i64 %idxprom
  %0 = load double, ptr %arrayidx, align 8
  %mul4 = fmul double %0, %da
  store double %mul4, ptr %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %add5 = add nsw i32 %i.0, %incx
  br label %for.cond, !llvm.loop !14

for.end:                                          ; preds = %for.cond
  br label %if.end

if.else:                                          ; preds = %if.then
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc13, %if.else
  %i.1 = phi i32 [ 0, %if.else ], [ %inc, %for.inc13 ]
  %cmp7 = icmp slt i32 %i.1, %n
  br i1 %cmp7, label %for.body8, label %for.end14

for.body8:                                        ; preds = %for.cond6
  %add9 = add nsw i32 %i.1, %dx_off
  %idxprom10 = sext i32 %add9 to i64
  %arrayidx11 = getelementptr inbounds double, ptr %dx, i64 %idxprom10
  %1 = load double, ptr %arrayidx11, align 8
  %mul12 = fmul double %1, %da
  store double %mul12, ptr %arrayidx11, align 8
  br label %for.inc13

for.inc13:                                        ; preds = %for.body8
  %inc = add nsw i32 %i.1, 1
  br label %for.cond6, !llvm.loop !15

for.end14:                                        ; preds = %for.cond6
  br label %if.end

if.end:                                           ; preds = %for.end14, %for.end
  br label %if.end15

if.end15:                                         ; preds = %if.end, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @daxpy(i32 noundef %n, double noundef %da, ptr noundef %dx, i32 noundef %dx_off, i32 noundef %incx, ptr noundef %dy, i32 noundef %dy_off, i32 noundef %incy) #0 {
entry:
  %cmp = icmp sgt i32 %n, 0
  br i1 %cmp, label %land.lhs.true, label %if.end33

land.lhs.true:                                    ; preds = %entry
  %cmp1 = fcmp une double %da, 0.000000e+00
  br i1 %cmp1, label %if.then, label %if.end33

if.then:                                          ; preds = %land.lhs.true
  %cmp2 = icmp ne i32 %incx, 1
  br i1 %cmp2, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %cmp3 = icmp ne i32 %incy, 1
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false, %if.then
  %cmp5 = icmp slt i32 %incx, 0
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then4
  %sub = sub nsw i32 1, %n
  %mul = mul nsw i32 %sub, %incx
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then4
  %ix.0 = phi i32 [ %mul, %if.then6 ], [ 0, %if.then4 ]
  %cmp7 = icmp slt i32 %incy, 0
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.end
  %sub9 = sub nsw i32 1, %n
  %mul10 = mul nsw i32 %sub9, %incy
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.end
  %iy.0 = phi i32 [ %mul10, %if.then8 ], [ 0, %if.end ]
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end11
  %i.0 = phi i32 [ 0, %if.end11 ], [ %inc, %for.inc ]
  %ix.1 = phi i32 [ %ix.0, %if.end11 ], [ %add17, %for.inc ]
  %iy.1 = phi i32 [ %iy.0, %if.end11 ], [ %add18, %for.inc ]
  %cmp12 = icmp slt i32 %i.0, %n
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %ix.1, %dx_off
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, ptr %dx, i64 %idxprom
  %0 = load double, ptr %arrayidx, align 8
  %add14 = add nsw i32 %iy.1, %dy_off
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds double, ptr %dy, i64 %idxprom15
  %1 = load double, ptr %arrayidx16, align 8
  %2 = call double @llvm.fmuladd.f64(double %da, double %0, double %1)
  store double %2, ptr %arrayidx16, align 8
  %add17 = add nsw i32 %ix.1, %incx
  %add18 = add nsw i32 %iy.1, %incy
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !16

for.end:                                          ; preds = %for.cond
  br label %if.end33

if.else:                                          ; preds = %lor.lhs.false
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc29, %if.else
  %i.1 = phi i32 [ 0, %if.else ], [ %inc30, %for.inc29 ]
  %cmp20 = icmp slt i32 %i.1, %n
  br i1 %cmp20, label %for.body21, label %for.end31

for.body21:                                       ; preds = %for.cond19
  %add22 = add nsw i32 %i.1, %dx_off
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds double, ptr %dx, i64 %idxprom23
  %3 = load double, ptr %arrayidx24, align 8
  %add26 = add nsw i32 %i.1, %dy_off
  %idxprom27 = sext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds double, ptr %dy, i64 %idxprom27
  %4 = load double, ptr %arrayidx28, align 8
  %5 = call double @llvm.fmuladd.f64(double %da, double %3, double %4)
  store double %5, ptr %arrayidx28, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.body21
  %inc30 = add nsw i32 %i.1, 1
  br label %for.cond19, !llvm.loop !17

for.end31:                                        ; preds = %for.cond19
  br label %if.end32

if.end32:                                         ; preds = %for.end31
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %for.end, %land.lhs.true, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgefa(ptr noundef %a, ptr noundef %ipvt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc38, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %add, %for.inc38 ]
  %cmp = icmp slt i32 %k.0, 1999
  br i1 %cmp, label %for.body, label %for.end40

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %k.0 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %a, i64 %idxprom
  %0 = load ptr, ptr %arrayidx, align 8
  %add = add nsw i32 %k.0, 1
  %sub = sub nsw i32 2000, %k.0
  %call = call i32 @idamax(i32 noundef %sub, ptr noundef %0, i32 noundef %k.0, i32 noundef 1)
  %add1 = add nsw i32 %call, %k.0
  %idxprom2 = sext i32 %k.0 to i64
  %arrayidx3 = getelementptr inbounds i32, ptr %ipvt, i64 %idxprom2
  store i32 %add1, ptr %arrayidx3, align 4
  %idxprom4 = sext i32 %add1 to i64
  %arrayidx5 = getelementptr inbounds double, ptr %0, i64 %idxprom4
  %1 = load double, ptr %arrayidx5, align 8
  %cmp6 = fcmp une double %1, 0.000000e+00
  br i1 %cmp6, label %if.then, label %if.end37

if.then:                                          ; preds = %for.body
  %cmp7 = icmp ne i32 %add1, %k.0
  br i1 %cmp7, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.then
  %idxprom9 = sext i32 %add1 to i64
  %arrayidx10 = getelementptr inbounds double, ptr %0, i64 %idxprom9
  %2 = load double, ptr %arrayidx10, align 8
  %idxprom11 = sext i32 %k.0 to i64
  %arrayidx12 = getelementptr inbounds double, ptr %0, i64 %idxprom11
  %3 = load double, ptr %arrayidx12, align 8
  %idxprom13 = sext i32 %add1 to i64
  %arrayidx14 = getelementptr inbounds double, ptr %0, i64 %idxprom13
  store double %3, ptr %arrayidx14, align 8
  %idxprom15 = sext i32 %k.0 to i64
  %arrayidx16 = getelementptr inbounds double, ptr %0, i64 %idxprom15
  store double %2, ptr %arrayidx16, align 8
  br label %if.end

if.end:                                           ; preds = %if.then8, %if.then
  %idxprom17 = sext i32 %k.0 to i64
  %arrayidx18 = getelementptr inbounds double, ptr %0, i64 %idxprom17
  %4 = load double, ptr %arrayidx18, align 8
  %div = fdiv double -1.000000e+00, %4
  %sub19 = sub nsw i32 2000, %add
  call void @dscal(i32 noundef %sub19, double noundef %div, ptr noundef %0, i32 noundef %add, i32 noundef 1)
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc, %if.end
  %j.0 = phi i32 [ %add, %if.end ], [ %inc, %for.inc ]
  %cmp21 = icmp slt i32 %j.0, 2000
  br i1 %cmp21, label %for.body22, label %for.end

for.body22:                                       ; preds = %for.cond20
  %idxprom23 = sext i32 %j.0 to i64
  %arrayidx24 = getelementptr inbounds ptr, ptr %a, i64 %idxprom23
  %5 = load ptr, ptr %arrayidx24, align 8
  %idxprom25 = sext i32 %add1 to i64
  %arrayidx26 = getelementptr inbounds double, ptr %5, i64 %idxprom25
  %6 = load double, ptr %arrayidx26, align 8
  br i1 %cmp7, label %if.then28, label %if.end35

if.then28:                                        ; preds = %for.body22
  %idxprom29 = sext i32 %k.0 to i64
  %arrayidx30 = getelementptr inbounds double, ptr %5, i64 %idxprom29
  %7 = load double, ptr %arrayidx30, align 8
  %idxprom31 = sext i32 %add1 to i64
  %arrayidx32 = getelementptr inbounds double, ptr %5, i64 %idxprom31
  store double %7, ptr %arrayidx32, align 8
  %idxprom33 = sext i32 %k.0 to i64
  %arrayidx34 = getelementptr inbounds double, ptr %5, i64 %idxprom33
  store double %6, ptr %arrayidx34, align 8
  br label %if.end35

if.end35:                                         ; preds = %if.then28, %for.body22
  call void @daxpy(i32 noundef %sub19, double noundef %6, ptr noundef %0, i32 noundef %add, i32 noundef 1, ptr noundef %5, i32 noundef %add, i32 noundef 1)
  br label %for.inc

for.inc:                                          ; preds = %if.end35
  %inc = add nsw i32 %j.0, 1
  br label %for.cond20, !llvm.loop !18

for.end:                                          ; preds = %for.cond20
  br label %if.end37

if.end37:                                         ; preds = %for.end, %for.body
  br label %for.inc38

for.inc38:                                        ; preds = %if.end37
  br label %for.cond, !llvm.loop !19

for.end40:                                        ; preds = %for.cond
  %arrayidx41 = getelementptr inbounds i32, ptr %ipvt, i64 1999
  store i32 1999, ptr %arrayidx41, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgesl(ptr noundef %a, ptr noundef %ipvt, ptr noundef %b) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ]
  %cmp = icmp slt i32 %k.0, 1999
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %k.0 to i64
  %arrayidx = getelementptr inbounds i32, ptr %ipvt, i64 %idxprom
  %0 = load i32, ptr %arrayidx, align 4
  %idxprom1 = sext i32 %0 to i64
  %arrayidx2 = getelementptr inbounds double, ptr %b, i64 %idxprom1
  %1 = load double, ptr %arrayidx2, align 8
  %cmp3 = icmp ne i32 %0, %k.0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %idxprom4 = sext i32 %k.0 to i64
  %arrayidx5 = getelementptr inbounds double, ptr %b, i64 %idxprom4
  %2 = load double, ptr %arrayidx5, align 8
  %idxprom6 = sext i32 %0 to i64
  %arrayidx7 = getelementptr inbounds double, ptr %b, i64 %idxprom6
  store double %2, ptr %arrayidx7, align 8
  %idxprom8 = sext i32 %k.0 to i64
  %arrayidx9 = getelementptr inbounds double, ptr %b, i64 %idxprom8
  store double %1, ptr %arrayidx9, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %add = add nsw i32 %k.0, 1
  %sub = sub nsw i32 2000, %add
  %idxprom10 = sext i32 %k.0 to i64
  %arrayidx11 = getelementptr inbounds ptr, ptr %a, i64 %idxprom10
  %3 = load ptr, ptr %arrayidx11, align 8
  call void @daxpy(i32 noundef %sub, double noundef %1, ptr noundef %3, i32 noundef %add, i32 noundef 1, ptr noundef %b, i32 noundef %add, i32 noundef 1)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  br label %for.cond, !llvm.loop !20

for.end:                                          ; preds = %for.cond
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc27, %for.end
  %kb.0 = phi i32 [ 0, %for.end ], [ %add15, %for.inc27 ]
  %cmp13 = icmp slt i32 %kb.0, 2000
  br i1 %cmp13, label %for.body14, label %for.end29

for.body14:                                       ; preds = %for.cond12
  %add15 = add nsw i32 %kb.0, 1
  %sub16 = sub nsw i32 2000, %add15
  %idxprom17 = sext i32 %sub16 to i64
  %arrayidx18 = getelementptr inbounds ptr, ptr %a, i64 %idxprom17
  %4 = load ptr, ptr %arrayidx18, align 8
  %idxprom19 = sext i32 %sub16 to i64
  %arrayidx20 = getelementptr inbounds double, ptr %4, i64 %idxprom19
  %5 = load double, ptr %arrayidx20, align 8
  %idxprom21 = sext i32 %sub16 to i64
  %arrayidx22 = getelementptr inbounds double, ptr %b, i64 %idxprom21
  %6 = load double, ptr %arrayidx22, align 8
  %div = fdiv double %6, %5
  store double %div, ptr %arrayidx22, align 8
  %idxprom23 = sext i32 %sub16 to i64
  %arrayidx24 = getelementptr inbounds double, ptr %b, i64 %idxprom23
  %7 = load double, ptr %arrayidx24, align 8
  %fneg = fneg double %7
  %idxprom25 = sext i32 %sub16 to i64
  %arrayidx26 = getelementptr inbounds ptr, ptr %a, i64 %idxprom25
  %8 = load ptr, ptr %arrayidx26, align 8
  call void @daxpy(i32 noundef %sub16, double noundef %fneg, ptr noundef %8, i32 noundef 0, i32 noundef 1, ptr noundef %b, i32 noundef 0, i32 noundef 1)
  br label %for.inc27

for.inc27:                                        ; preds = %for.body14
  br label %for.cond12, !llvm.loop !21

for.end29:                                        ; preds = %for.cond12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %cmp = icmp sgt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0 = phi i32 [ 1, %if.then ], [ %inc, %for.inc ]
  %cmp1 = icmp slt i32 %i.0, %argc
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds ptr, ptr %argv, i64 1
  %0 = load ptr, ptr %arrayidx, align 8
  %call = call i32 @strcmp(ptr noundef %0, ptr noundef @.str) #6
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !22

for.end:                                          ; preds = %if.then2, %for.cond
  %ga_testing.0 = phi i8 [ 1, %if.then2 ], [ 0, %for.cond ]
  br label %if.end3

if.end3:                                          ; preds = %for.end, %entry
  %ga_testing.1 = phi i8 [ %ga_testing.0, %for.end ], [ 0, %entry ]
  %call4 = call noalias ptr @malloc(i64 noundef 16000) #7
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc10, %if.end3
  %i.1 = phi i32 [ 0, %if.end3 ], [ %inc11, %for.inc10 ]
  %cmp6 = icmp slt i32 %i.1, 2000
  br i1 %cmp6, label %for.body7, label %for.end12

for.body7:                                        ; preds = %for.cond5
  %call8 = call noalias ptr @malloc(i64 noundef 16008) #7
  %idxprom = sext i32 %i.1 to i64
  %arrayidx9 = getelementptr inbounds ptr, ptr %call4, i64 %idxprom
  store ptr %call8, ptr %arrayidx9, align 8
  br label %for.inc10

for.inc10:                                        ; preds = %for.body7
  %inc11 = add nsw i32 %i.1, 1
  br label %for.cond5, !llvm.loop !23

for.end12:                                        ; preds = %for.cond5
  %call13 = call noalias ptr @malloc(i64 noundef 16000) #7
  %call14 = call noalias ptr @malloc(i64 noundef 16000) #7
  %call15 = call noalias ptr @malloc(i64 noundef 8000) #7
  call void @matgen(ptr noundef %call4, ptr noundef %call13)
  call void @dgefa(ptr noundef %call4, ptr noundef %call15)
  call void @dgesl(ptr noundef %call4, ptr noundef %call15, ptr noundef %call13)
  call void @free(ptr noundef %call15) #8
  call void @free(ptr noundef %call14) #8
  call void @free(ptr noundef %call13) #8
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc21, %for.end12
  %i.2 = phi i32 [ 0, %for.end12 ], [ %inc22, %for.inc21 ]
  %cmp17 = icmp slt i32 %i.2, 2000
  br i1 %cmp17, label %for.body18, label %for.end23

for.body18:                                       ; preds = %for.cond16
  %idxprom19 = sext i32 %i.2 to i64
  %arrayidx20 = getelementptr inbounds ptr, ptr %call4, i64 %idxprom19
  %1 = load ptr, ptr %arrayidx20, align 8
  call void @free(ptr noundef %1) #8
  br label %for.inc21

for.inc21:                                        ; preds = %for.body18
  %inc22 = add nsw i32 %i.2, 1
  br label %for.cond16, !llvm.loop !24

for.end23:                                        ; preds = %for.cond16
  call void @free(ptr noundef %call4) #8
  %tobool24 = trunc i8 %ga_testing.1 to i1
  br i1 %tobool24, label %if.then25, label %if.else

if.then25:                                        ; preds = %for.end23
  %2 = load ptr, ptr @stdout, align 8
  %call26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.1, double noundef 0.000000e+00)
  br label %if.end28

if.else:                                          ; preds = %for.end23
  %3 = load ptr, ptr @stdout, align 8
  %call27 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.2, double noundef 0.000000e+00)
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  %4 = load ptr, ptr @stdout, align 8
  %call29 = call i32 @fflush(ptr noundef %4)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

declare i32 @fflush(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define internal double @random_double() #0 {
entry:
  %0 = load i64, ptr @seed, align 8
  %xor = xor i64 %0, 123459876
  store i64 %xor, ptr @seed, align 8
  %1 = load i64, ptr @seed, align 8
  %div = sdiv i64 %1, 127773
  %2 = load i64, ptr @seed, align 8
  %mul = mul nsw i64 %div, 127773
  %sub = sub nsw i64 %2, %mul
  %mul1 = mul nsw i64 16807, %sub
  %mul2 = mul nsw i64 2836, %div
  %sub3 = sub nsw i64 %mul1, %mul2
  store i64 %sub3, ptr @seed, align 8
  %3 = load i64, ptr @seed, align 8
  %cmp = icmp slt i64 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64, ptr @seed, align 8
  %add = add nsw i64 %4, 2147483647
  store i64 %add, ptr @seed, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i64, ptr @seed, align 8
  %conv = sitofp i64 %5 to double
  %mul4 = fmul double 0x3E00000000200FE1, %conv
  %6 = load i64, ptr @seed, align 8
  %xor5 = xor i64 %6, 123459876
  store i64 %xor5, ptr @seed, align 8
  ret double %mul4
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }

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
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
