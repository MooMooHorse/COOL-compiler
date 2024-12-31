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
entry:
  %mul = mul nsw i32 256, 256
  %conv = sext i32 %mul to i64
  %add = add nsw i64 %conv, 1
  %mul1 = mul nsw i64 %add, 2
  %mul2 = mul i64 %mul1, 8
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 2), align 4
  store i32 256, ptr getelementptr inbounds ([3 x i32], ptr @main.nsize, i64 0, i64 1), align 4
  %call = call noalias ptr @malloc(i64 noundef %mul2) #7
  %cmp = icmp eq ptr %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load ptr, ptr @stderr, align 8
  %call4 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

if.end:                                           ; preds = %entry
  call void @llvm.memset.p0.i64(ptr align 8 %call, i8 0, i64 %mul2, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc23, %for.inc22 ]
  %cmp5 = icmp slt i32 %i.0, 256
  br i1 %cmp5, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp8 = icmp slt i32 %j.0, 256
  br i1 %cmp8, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond7
  %and = and i32 %i.0, 15
  %cmp11 = icmp eq i32 %and, 8
  br i1 %cmp11, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body10
  %and13 = and i32 %j.0, 15
  %cmp14 = icmp eq i32 %and13, 8
  br i1 %cmp14, label %if.then16, label %if.end21

if.then16:                                        ; preds = %lor.lhs.false, %for.body10
  %mul17 = mul nsw i32 256, %i.0
  %add18 = add nsw i32 %mul17, %j.0
  %mul19 = mul nsw i32 %add18, 2
  %add20 = add nsw i32 1, %mul19
  %idxprom = sext i32 %add20 to i64
  %arrayidx = getelementptr inbounds double, ptr %call, i64 %idxprom
  store double 1.280000e+02, ptr %arrayidx, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.then16, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end21
  %inc = add nsw i32 %j.0, 1
  br label %for.cond7, !llvm.loop !6

for.end:                                          ; preds = %for.cond7
  br label %for.inc22

for.inc22:                                        ; preds = %for.end
  %inc23 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end24:                                        ; preds = %for.cond
  br label %for.cond25

for.cond25:                                       ; preds = %for.inc29, %for.end24
  %i.1 = phi i32 [ 0, %for.end24 ], [ %inc30, %for.inc29 ]
  %cmp26 = icmp slt i32 %i.1, 63
  br i1 %cmp26, label %for.body28, label %for.end31

for.body28:                                       ; preds = %for.cond25
  call void @fourn(ptr noundef %call, ptr noundef @main.nsize, i32 noundef 2, i32 noundef 1)
  call void @fourn(ptr noundef %call, ptr noundef @main.nsize, i32 noundef 2, i32 noundef -1)
  br label %for.inc29

for.inc29:                                        ; preds = %for.body28
  %inc30 = add nsw i32 %i.1, 1
  br label %for.cond25, !llvm.loop !9

for.end31:                                        ; preds = %for.cond25
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc64, %for.end31
  %rmin.0 = phi double [ 1.000000e+10, %for.end31 ], [ %cond, %for.inc64 ]
  %rmax.0 = phi double [ -1.000000e+10, %for.end31 ], [ %cond51, %for.inc64 ]
  %imin.0 = phi double [ 1.000000e+10, %for.end31 ], [ %cond57, %for.inc64 ]
  %imax.0 = phi double [ -1.000000e+10, %for.end31 ], [ %cond63, %for.inc64 ]
  %ar.0 = phi double [ 0.000000e+00, %for.end31 ], [ %add42, %for.inc64 ]
  %i.2 = phi i32 [ 1, %for.end31 ], [ %add65, %for.inc64 ]
  %ai.0 = phi double [ 0.000000e+00, %for.end31 ], [ %add43, %for.inc64 ]
  %conv33 = sext i32 %i.2 to i64
  %cmp34 = icmp sle i64 %conv33, %conv
  br i1 %cmp34, label %for.body36, label %for.end66

for.body36:                                       ; preds = %for.cond32
  %idxprom37 = sext i32 %i.2 to i64
  %arrayidx38 = getelementptr inbounds double, ptr %call, i64 %idxprom37
  %1 = load double, ptr %arrayidx38, align 8
  %add39 = add nsw i32 %i.2, 1
  %idxprom40 = sext i32 %add39 to i64
  %arrayidx41 = getelementptr inbounds double, ptr %call, i64 %idxprom40
  %2 = load double, ptr %arrayidx41, align 8
  %add42 = fadd double %ar.0, %1
  %add43 = fadd double %ai.0, %2
  %cmp44 = fcmp ole double %1, %rmin.0
  br i1 %cmp44, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body36
  br label %cond.end

cond.false:                                       ; preds = %for.body36
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ %1, %cond.true ], [ %rmin.0, %cond.false ]
  %cmp46 = fcmp ogt double %1, %rmax.0
  br i1 %cmp46, label %cond.true48, label %cond.false49

cond.true48:                                      ; preds = %cond.end
  br label %cond.end50

cond.false49:                                     ; preds = %cond.end
  br label %cond.end50

cond.end50:                                       ; preds = %cond.false49, %cond.true48
  %cond51 = phi double [ %1, %cond.true48 ], [ %rmax.0, %cond.false49 ]
  %cmp52 = fcmp ole double %2, %imin.0
  br i1 %cmp52, label %cond.true54, label %cond.false55

cond.true54:                                      ; preds = %cond.end50
  br label %cond.end56

cond.false55:                                     ; preds = %cond.end50
  br label %cond.end56

cond.end56:                                       ; preds = %cond.false55, %cond.true54
  %cond57 = phi double [ %2, %cond.true54 ], [ %imin.0, %cond.false55 ]
  %cmp58 = fcmp ogt double %2, %imax.0
  br i1 %cmp58, label %cond.true60, label %cond.false61

cond.true60:                                      ; preds = %cond.end56
  br label %cond.end62

cond.false61:                                     ; preds = %cond.end56
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false61, %cond.true60
  %cond63 = phi double [ %2, %cond.true60 ], [ %imax.0, %cond.false61 ]
  br label %for.inc64

for.inc64:                                        ; preds = %cond.end62
  %add65 = add nsw i32 %i.2, 2
  br label %for.cond32, !llvm.loop !10

for.end66:                                        ; preds = %for.cond32
  %sub = fsub double %rmax.0, %rmin.0
  %div = fdiv double 2.550000e+02, %sub
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc100, %for.end66
  %m.0 = phi i32 [ 0, %for.end66 ], [ %m.1, %for.inc100 ]
  %i.3 = phi i32 [ 0, %for.end66 ], [ %inc101, %for.inc100 ]
  %cmp68 = icmp slt i32 %i.3, 256
  br i1 %cmp68, label %for.body70, label %for.end102

for.body70:                                       ; preds = %for.cond67
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc97, %for.body70
  %m.1 = phi i32 [ %m.0, %for.body70 ], [ %m.2, %for.inc97 ]
  %j.1 = phi i32 [ 0, %for.body70 ], [ %inc98, %for.inc97 ]
  %cmp72 = icmp slt i32 %j.1, 256
  br i1 %cmp72, label %for.body74, label %for.end99

for.body74:                                       ; preds = %for.cond71
  %mul75 = mul nsw i32 256, %i.3
  %add76 = add nsw i32 %mul75, %j.1
  %mul77 = mul nsw i32 %add76, 2
  %add78 = add nsw i32 1, %mul77
  %idxprom79 = sext i32 %add78 to i64
  %arrayidx80 = getelementptr inbounds double, ptr %call, i64 %idxprom79
  %3 = load double, ptr %arrayidx80, align 8
  %sub81 = fsub double %3, %rmin.0
  %mul82 = fmul double %sub81, %div
  %conv83 = fptosi double %mul82 to i32
  %and84 = and i32 %i.3, 15
  %cmp85 = icmp eq i32 %and84, 8
  br i1 %cmp85, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body74
  %and87 = and i32 %j.1, 15
  %cmp88 = icmp eq i32 %and87, 8
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body74
  %4 = phi i1 [ true, %for.body74 ], [ %cmp88, %lor.rhs ]
  %5 = zext i1 %4 to i64
  %cond90 = select i1 %4, i32 255, i32 0
  %cmp91 = icmp ne i32 %conv83, %cond90
  br i1 %cmp91, label %if.then93, label %if.end96

if.then93:                                        ; preds = %lor.end
  %inc94 = add nsw i32 %m.1, 1
  %6 = load ptr, ptr @stderr, align 8
  %call95 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.1, i32 noundef %i.3, i32 noundef %j.1, i32 noundef %cond90, i32 noundef %conv83)
  br label %if.end96

if.end96:                                         ; preds = %if.then93, %lor.end
  %m.2 = phi i32 [ %inc94, %if.then93 ], [ %m.1, %lor.end ]
  br label %for.inc97

for.inc97:                                        ; preds = %if.end96
  %inc98 = add nsw i32 %j.1, 1
  br label %for.cond71, !llvm.loop !11

for.end99:                                        ; preds = %for.cond71
  br label %for.inc100

for.inc100:                                       ; preds = %for.end99
  %inc101 = add nsw i32 %i.3, 1
  br label %for.cond67, !llvm.loop !12

for.end102:                                       ; preds = %for.cond67
  %cmp103 = icmp eq i32 %m.0, 0
  br i1 %cmp103, label %if.then105, label %if.else

if.then105:                                       ; preds = %for.end102
  %7 = load ptr, ptr @stderr, align 8
  %call106 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.2, i32 noundef 63)
  br label %if.end108

if.else:                                          ; preds = %for.end102
  %8 = load ptr, ptr @stderr, align 8
  %call107 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.3, i32 noundef 63, i32 noundef %m.0)
  br label %if.end108

if.end108:                                        ; preds = %if.else, %if.then105
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
define internal void @fourn(ptr noundef %data, ptr noundef %nn, i32 noundef %ndim, i32 noundef %isign) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %idim.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %ntot.0 = phi i32 [ 1, %entry ], [ %mul, %for.inc ]
  %cmp = icmp sle i32 %idim.0, %ndim
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %idim.0 to i64
  %arrayidx = getelementptr inbounds i32, ptr %nn, i64 %idxprom
  %0 = load i32, ptr %arrayidx, align 4
  %mul = mul nsw i32 %ntot.0, %0
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %idim.0, 1
  br label %for.cond, !llvm.loop !13

for.end:                                          ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc133, %for.end
  %idim.1 = phi i32 [ %ndim, %for.end ], [ %dec, %for.inc133 ]
  %nprev.0 = phi i32 [ 1, %for.end ], [ %mul6, %for.inc133 ]
  %cmp2 = icmp sge i32 %idim.1, 1
  br i1 %cmp2, label %for.body3, label %for.end134

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %idim.1 to i64
  %arrayidx5 = getelementptr inbounds i32, ptr %nn, i64 %idxprom4
  %1 = load i32, ptr %arrayidx5, align 4
  %mul6 = mul nsw i32 %1, %nprev.0
  %div = sdiv i32 %ntot.0, %mul6
  %shl = shl i32 %nprev.0, 1
  %mul7 = mul nsw i32 %shl, %1
  %mul8 = mul nsw i32 %mul7, %div
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc52, %for.body3
  %i2rev.0 = phi i32 [ 1, %for.body3 ], [ %add51, %for.inc52 ]
  %i2.0 = phi i32 [ 1, %for.body3 ], [ %add53, %for.inc52 ]
  %cmp10 = icmp sle i32 %i2.0, %mul7
  br i1 %cmp10, label %for.body11, label %for.end54

for.body11:                                       ; preds = %for.cond9
  %cmp12 = icmp slt i32 %i2.0, %i2rev.0
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.body11
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc44, %if.then
  %i1.0 = phi i32 [ %i2.0, %if.then ], [ %add45, %for.inc44 ]
  %add = add nsw i32 %i2.0, %shl
  %sub = sub nsw i32 %add, 2
  %cmp14 = icmp sle i32 %i1.0, %sub
  br i1 %cmp14, label %for.body15, label %for.end46

for.body15:                                       ; preds = %for.cond13
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc41, %for.body15
  %i3.0 = phi i32 [ %i1.0, %for.body15 ], [ %add42, %for.inc41 ]
  %cmp17 = icmp sle i32 %i3.0, %mul8
  br i1 %cmp17, label %for.body18, label %for.end43

for.body18:                                       ; preds = %for.cond16
  %add19 = add nsw i32 %i2rev.0, %i3.0
  %sub20 = sub nsw i32 %add19, %i2.0
  %idxprom21 = sext i32 %i3.0 to i64
  %arrayidx22 = getelementptr inbounds double, ptr %data, i64 %idxprom21
  %2 = load double, ptr %arrayidx22, align 8
  %idxprom23 = sext i32 %sub20 to i64
  %arrayidx24 = getelementptr inbounds double, ptr %data, i64 %idxprom23
  %3 = load double, ptr %arrayidx24, align 8
  %idxprom25 = sext i32 %i3.0 to i64
  %arrayidx26 = getelementptr inbounds double, ptr %data, i64 %idxprom25
  store double %3, ptr %arrayidx26, align 8
  %idxprom27 = sext i32 %sub20 to i64
  %arrayidx28 = getelementptr inbounds double, ptr %data, i64 %idxprom27
  store double %2, ptr %arrayidx28, align 8
  %add29 = add nsw i32 %i3.0, 1
  %idxprom30 = sext i32 %add29 to i64
  %arrayidx31 = getelementptr inbounds double, ptr %data, i64 %idxprom30
  %4 = load double, ptr %arrayidx31, align 8
  %add32 = add nsw i32 %sub20, 1
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds double, ptr %data, i64 %idxprom33
  %5 = load double, ptr %arrayidx34, align 8
  %idxprom36 = sext i32 %add29 to i64
  %arrayidx37 = getelementptr inbounds double, ptr %data, i64 %idxprom36
  store double %5, ptr %arrayidx37, align 8
  %idxprom39 = sext i32 %add32 to i64
  %arrayidx40 = getelementptr inbounds double, ptr %data, i64 %idxprom39
  store double %4, ptr %arrayidx40, align 8
  br label %for.inc41

for.inc41:                                        ; preds = %for.body18
  %add42 = add nsw i32 %i3.0, %mul7
  br label %for.cond16, !llvm.loop !14

for.end43:                                        ; preds = %for.cond16
  br label %for.inc44

for.inc44:                                        ; preds = %for.end43
  %add45 = add nsw i32 %i1.0, 2
  br label %for.cond13, !llvm.loop !15

for.end46:                                        ; preds = %for.cond13
  br label %if.end

if.end:                                           ; preds = %for.end46, %for.body11
  %shr = ashr i32 %mul7, 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %ibit.0 = phi i32 [ %shr, %if.end ], [ %shr50, %while.body ]
  %i2rev.1 = phi i32 [ %i2rev.0, %if.end ], [ %sub49, %while.body ]
  %cmp47 = icmp sge i32 %ibit.0, %shl
  br i1 %cmp47, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %cmp48 = icmp sgt i32 %i2rev.1, %ibit.0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %cmp48, %land.rhs ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %sub49 = sub nsw i32 %i2rev.1, %ibit.0
  %shr50 = ashr i32 %ibit.0, 1
  br label %while.cond, !llvm.loop !16

while.end:                                        ; preds = %land.end
  %add51 = add nsw i32 %i2rev.1, %ibit.0
  br label %for.inc52

for.inc52:                                        ; preds = %while.end
  %add53 = add nsw i32 %i2.0, %shl
  br label %for.cond9, !llvm.loop !17

for.end54:                                        ; preds = %for.cond9
  br label %while.cond55

while.cond55:                                     ; preds = %for.end130, %for.end54
  %ifp1.0 = phi i32 [ %shl, %for.end54 ], [ %shl58, %for.end130 ]
  %cmp56 = icmp slt i32 %ifp1.0, %mul7
  br i1 %cmp56, label %while.body57, label %while.end131

while.body57:                                     ; preds = %while.cond55
  %shl58 = shl i32 %ifp1.0, 1
  %conv = sitofp i32 %isign to double
  %mul59 = fmul double %conv, 0x401921FB54442D1C
  %div60 = sdiv i32 %shl58, %shl
  %conv61 = sitofp i32 %div60 to double
  %div62 = fdiv double %mul59, %conv61
  %mul63 = fmul double 5.000000e-01, %div62
  %call = call double @sin(double noundef %mul63) #9
  %mul64 = fmul double -2.000000e+00, %call
  %mul65 = fmul double %mul64, %call
  %call66 = call double @sin(double noundef %div62) #9
  br label %for.cond67

for.cond67:                                       ; preds = %for.inc128, %while.body57
  %i3.1 = phi i32 [ 1, %while.body57 ], [ %add72, %for.inc128 ]
  %wi.0 = phi double [ 0.000000e+00, %while.body57 ], [ %add127, %for.inc128 ]
  %wr.0 = phi double [ 1.000000e+00, %while.body57 ], [ %add124, %for.inc128 ]
  %cmp68 = icmp sle i32 %i3.1, %ifp1.0
  br i1 %cmp68, label %for.body70, label %for.end130

for.body70:                                       ; preds = %for.cond67
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc118, %for.body70
  %i1.1 = phi i32 [ %i3.1, %for.body70 ], [ %add119, %for.inc118 ]
  %add72 = add nsw i32 %i3.1, %shl
  %sub73 = sub nsw i32 %add72, 2
  %cmp74 = icmp sle i32 %i1.1, %sub73
  br i1 %cmp74, label %for.body76, label %for.end120

for.body76:                                       ; preds = %for.cond71
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc115, %for.body76
  %i2.1 = phi i32 [ %i1.1, %for.body76 ], [ %add116, %for.inc115 ]
  %cmp78 = icmp sle i32 %i2.1, %mul8
  br i1 %cmp78, label %for.body80, label %for.end117

for.body80:                                       ; preds = %for.cond77
  %add81 = add nsw i32 %i2.1, %ifp1.0
  %idxprom82 = sext i32 %add81 to i64
  %arrayidx83 = getelementptr inbounds double, ptr %data, i64 %idxprom82
  %7 = load double, ptr %arrayidx83, align 8
  %add85 = add nsw i32 %add81, 1
  %idxprom86 = sext i32 %add85 to i64
  %arrayidx87 = getelementptr inbounds double, ptr %data, i64 %idxprom86
  %8 = load double, ptr %arrayidx87, align 8
  %mul88 = fmul double %wi.0, %8
  %neg = fneg double %mul88
  %9 = call double @llvm.fmuladd.f64(double %wr.0, double %7, double %neg)
  %idxprom90 = sext i32 %add85 to i64
  %arrayidx91 = getelementptr inbounds double, ptr %data, i64 %idxprom90
  %10 = load double, ptr %arrayidx91, align 8
  %idxprom93 = sext i32 %add81 to i64
  %arrayidx94 = getelementptr inbounds double, ptr %data, i64 %idxprom93
  %11 = load double, ptr %arrayidx94, align 8
  %mul95 = fmul double %wi.0, %11
  %12 = call double @llvm.fmuladd.f64(double %wr.0, double %10, double %mul95)
  %idxprom96 = sext i32 %i2.1 to i64
  %arrayidx97 = getelementptr inbounds double, ptr %data, i64 %idxprom96
  %13 = load double, ptr %arrayidx97, align 8
  %sub98 = fsub double %13, %9
  %idxprom99 = sext i32 %add81 to i64
  %arrayidx100 = getelementptr inbounds double, ptr %data, i64 %idxprom99
  store double %sub98, ptr %arrayidx100, align 8
  %add101 = add nsw i32 %i2.1, 1
  %idxprom102 = sext i32 %add101 to i64
  %arrayidx103 = getelementptr inbounds double, ptr %data, i64 %idxprom102
  %14 = load double, ptr %arrayidx103, align 8
  %sub104 = fsub double %14, %12
  %idxprom106 = sext i32 %add85 to i64
  %arrayidx107 = getelementptr inbounds double, ptr %data, i64 %idxprom106
  store double %sub104, ptr %arrayidx107, align 8
  %idxprom108 = sext i32 %i2.1 to i64
  %arrayidx109 = getelementptr inbounds double, ptr %data, i64 %idxprom108
  %15 = load double, ptr %arrayidx109, align 8
  %add110 = fadd double %15, %9
  store double %add110, ptr %arrayidx109, align 8
  %idxprom112 = sext i32 %add101 to i64
  %arrayidx113 = getelementptr inbounds double, ptr %data, i64 %idxprom112
  %16 = load double, ptr %arrayidx113, align 8
  %add114 = fadd double %16, %12
  store double %add114, ptr %arrayidx113, align 8
  br label %for.inc115

for.inc115:                                       ; preds = %for.body80
  %add116 = add nsw i32 %i2.1, %shl58
  br label %for.cond77, !llvm.loop !18

for.end117:                                       ; preds = %for.cond77
  br label %for.inc118

for.inc118:                                       ; preds = %for.end117
  %add119 = add nsw i32 %i1.1, 2
  br label %for.cond71, !llvm.loop !19

for.end120:                                       ; preds = %for.cond71
  %mul122 = fmul double %wi.0, %call66
  %neg123 = fneg double %mul122
  %17 = call double @llvm.fmuladd.f64(double %wr.0, double %mul65, double %neg123)
  %add124 = fadd double %17, %wr.0
  %mul126 = fmul double %wr.0, %call66
  %18 = call double @llvm.fmuladd.f64(double %wi.0, double %mul65, double %mul126)
  %add127 = fadd double %18, %wi.0
  br label %for.inc128

for.inc128:                                       ; preds = %for.end120
  br label %for.cond67, !llvm.loop !20

for.end130:                                       ; preds = %for.cond67
  br label %while.cond55, !llvm.loop !21

while.end131:                                     ; preds = %while.cond55
  br label %for.inc133

for.inc133:                                       ; preds = %while.end131
  %dec = add nsw i32 %idim.1, -1
  br label %for.cond1, !llvm.loop !22

for.end134:                                       ; preds = %for.cond1
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
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git ce919e92afed6522fae11fdf69158b4b9ead2296)"}
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
