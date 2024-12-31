; ModuleID = '<stdin>'
source_filename = "tests/testing/whetstone.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1
@T = dso_local global double 0.000000e+00, align 8
@T1 = dso_local global double 0.000000e+00, align 8
@T2 = dso_local global double 0.000000e+00, align 8
@E1 = dso_local global [5 x double] zeroinitializer, align 16
@J = dso_local global i32 0, align 4
@K = dso_local global i32 0, align 4
@L = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %Z = alloca double, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %entry
  %II.0 = phi i32 [ 1, %entry ], [ %inc, %if.end18 ]
  %loopstart.0 = phi i64 [ 100000, %entry ], [ %loopstart.1, %if.end18 ]
  %continuous.0 = phi i32 [ 0, %entry ], [ %continuous.1, %if.end18 ]
  %cmp = icmp slt i32 %II.0, %argc
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %idxprom = sext i32 %II.0 to i64
  %arrayidx = getelementptr inbounds ptr, ptr %argv, i64 %idxprom
  %0 = load ptr, ptr %arrayidx, align 8
  %call = call i32 @strncmp(ptr noundef %0, ptr noundef @.str, i64 noundef 2) #4
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %idxprom2 = sext i32 %II.0 to i64
  %arrayidx3 = getelementptr inbounds ptr, ptr %argv, i64 %idxprom2
  %1 = load ptr, ptr %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds i8, ptr %1, i64 0
  %2 = load i8, ptr %arrayidx4, align 1
  %conv = sext i8 %2 to i32
  %cmp5 = icmp eq i32 %conv, 99
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %while.body
  br label %if.end18

if.else:                                          ; preds = %lor.lhs.false
  %idxprom7 = sext i32 %II.0 to i64
  %arrayidx8 = getelementptr inbounds ptr, ptr %argv, i64 %idxprom7
  %3 = load ptr, ptr %arrayidx8, align 8
  %call9 = call i64 @atol(ptr noundef %3) #4
  %cmp10 = icmp sgt i64 %call9, 0
  br i1 %cmp10, label %if.then12, label %if.else16

if.then12:                                        ; preds = %if.else
  %idxprom13 = sext i32 %II.0 to i64
  %arrayidx14 = getelementptr inbounds ptr, ptr %argv, i64 %idxprom13
  %4 = load ptr, ptr %arrayidx14, align 8
  %call15 = call i64 @atol(ptr noundef %4) #4
  br label %if.end

if.else16:                                        ; preds = %if.else
  %5 = load ptr, ptr @stderr, align 8
  %call17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.1)
  br label %return

if.end:                                           ; preds = %if.then12
  br label %if.end18

if.end18:                                         ; preds = %if.end, %if.then
  %loopstart.1 = phi i64 [ %loopstart.0, %if.then ], [ %call15, %if.end ]
  %continuous.1 = phi i32 [ 1, %if.then ], [ %continuous.0, %if.end ]
  %inc = add nsw i32 %II.0, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %mul = mul nsw i64 12, %loopstart.0
  %mul20 = mul nsw i64 14, %loopstart.0
  %mul21 = mul nsw i64 345, %loopstart.0
  %mul22 = mul nsw i64 210, %loopstart.0
  %mul23 = mul nsw i64 32, %loopstart.0
  %mul24 = mul nsw i64 899, %loopstart.0
  %mul25 = mul nsw i64 616, %loopstart.0
  %mul26 = mul nsw i64 93, %loopstart.0
  %tobool = icmp ne i32 %continuous.0, 0
  br label %LCONT

LCONT:                                            ; preds = %if.then257, %while.end
  %call19 = call i64 @time(ptr noundef null) #5
  store double 4.999750e-01, ptr @T, align 8
  store double 5.002500e-01, ptr @T1, align 8
  store double 2.000000e+00, ptr @T2, align 8
  br label %IILOOP

IILOOP:                                           ; preds = %if.then253, %LCONT
  %JJ.0 = phi i32 [ 1, %LCONT ], [ %inc250, %if.then253 ]
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %IILOOP
  %X1.0 = phi double [ 1.000000e+00, %IILOOP ], [ %mul30, %for.inc ]
  %X2.0 = phi double [ -1.000000e+00, %IILOOP ], [ %mul34, %for.inc ]
  %X3.0 = phi double [ -1.000000e+00, %IILOOP ], [ %mul38, %for.inc ]
  %X4.0 = phi double [ -1.000000e+00, %IILOOP ], [ %mul42, %for.inc ]
  %I.0 = phi i64 [ 1, %IILOOP ], [ %inc43, %for.inc ]
  %cmp27 = icmp sle i64 %I.0, 0
  br i1 %cmp27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = fadd double %X1.0, %X2.0
  %add29 = fadd double %add, %X3.0
  %sub = fsub double %add29, %X4.0
  %6 = load double, ptr @T, align 8
  %mul30 = fmul double %sub, %6
  %add31 = fadd double %mul30, %X2.0
  %sub32 = fsub double %add31, %X3.0
  %add33 = fadd double %sub32, %X4.0
  %7 = load double, ptr @T, align 8
  %mul34 = fmul double %add33, %7
  %sub35 = fsub double %mul30, %mul34
  %add36 = fadd double %sub35, %X3.0
  %add37 = fadd double %add36, %X4.0
  %8 = load double, ptr @T, align 8
  %mul38 = fmul double %add37, %8
  %fneg = fneg double %mul30
  %add39 = fadd double %fneg, %mul34
  %add40 = fadd double %add39, %mul38
  %add41 = fadd double %add40, %X4.0
  %9 = load double, ptr @T, align 8
  %mul42 = fmul double %add41, %9
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc43 = add nsw i64 %I.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %cmp44 = icmp eq i32 %JJ.0, 1
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %for.end
  call void @POUT(i64 noundef 0, i64 noundef 0, i64 noundef 0, double noundef %X1.0, double noundef %X2.0, double noundef %X3.0, double noundef %X4.0)
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %for.end
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc69, %if.end47
  %I.1 = phi i64 [ 1, %if.end47 ], [ %inc70, %for.inc69 ]
  %cmp49 = icmp sle i64 %I.1, %mul
  br i1 %cmp49, label %for.body51, label %for.end71

for.body51:                                       ; preds = %for.cond48
  %10 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %11 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %add52 = fadd double %10, %11
  %12 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %add53 = fadd double %add52, %12
  %13 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %sub54 = fsub double %add53, %13
  %14 = load double, ptr @T, align 8
  %mul55 = fmul double %sub54, %14
  store double %mul55, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %15 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %16 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %add56 = fadd double %15, %16
  %17 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %sub57 = fsub double %add56, %17
  %18 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %add58 = fadd double %sub57, %18
  %19 = load double, ptr @T, align 8
  %mul59 = fmul double %add58, %19
  store double %mul59, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %20 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %21 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %sub60 = fsub double %20, %21
  %22 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %add61 = fadd double %sub60, %22
  %23 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %add62 = fadd double %add61, %23
  %24 = load double, ptr @T, align 8
  %mul63 = fmul double %add62, %24
  store double %mul63, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %25 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %fneg64 = fneg double %25
  %26 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %add65 = fadd double %fneg64, %26
  %27 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %add66 = fadd double %add65, %27
  %28 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %add67 = fadd double %add66, %28
  %29 = load double, ptr @T, align 8
  %mul68 = fmul double %add67, %29
  store double %mul68, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %for.inc69

for.inc69:                                        ; preds = %for.body51
  %inc70 = add nsw i64 %I.1, 1
  br label %for.cond48, !llvm.loop !9

for.end71:                                        ; preds = %for.cond48
  %cmp72 = icmp eq i32 %JJ.0, 1
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %for.end71
  %30 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %31 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %32 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %33 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %mul, i64 noundef %mul20, i64 noundef %mul, double noundef %30, double noundef %31, double noundef %32, double noundef %33)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %for.end71
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc80, %if.end75
  %I.2 = phi i64 [ 1, %if.end75 ], [ %inc81, %for.inc80 ]
  %cmp77 = icmp sle i64 %I.2, %mul20
  br i1 %cmp77, label %for.body79, label %for.end82

for.body79:                                       ; preds = %for.cond76
  call void @PA(ptr noundef @E1)
  br label %for.inc80

for.inc80:                                        ; preds = %for.body79
  %inc81 = add nsw i64 %I.2, 1
  br label %for.cond76, !llvm.loop !10

for.end82:                                        ; preds = %for.cond76
  %cmp83 = icmp eq i32 %JJ.0, 1
  br i1 %cmp83, label %if.then85, label %if.end86

if.then85:                                        ; preds = %for.end82
  %34 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %35 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %36 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %37 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %mul20, i64 noundef %mul, i64 noundef %mul, double noundef %34, double noundef %35, double noundef %36, double noundef %37)
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %for.end82
  store i32 1, ptr @J, align 4
  br label %for.cond87

for.cond87:                                       ; preds = %for.inc106, %if.end86
  %I.3 = phi i64 [ 1, %if.end86 ], [ %inc107, %for.inc106 ]
  %cmp88 = icmp sle i64 %I.3, %mul21
  br i1 %cmp88, label %for.body90, label %for.end108

for.body90:                                       ; preds = %for.cond87
  %38 = load i32, ptr @J, align 4
  %cmp91 = icmp eq i32 %38, 1
  br i1 %cmp91, label %if.then93, label %if.else94

if.then93:                                        ; preds = %for.body90
  store i32 2, ptr @J, align 4
  br label %if.end95

if.else94:                                        ; preds = %for.body90
  store i32 3, ptr @J, align 4
  br label %if.end95

if.end95:                                         ; preds = %if.else94, %if.then93
  %39 = load i32, ptr @J, align 4
  %cmp96 = icmp sgt i32 %39, 2
  br i1 %cmp96, label %if.then98, label %if.else99

if.then98:                                        ; preds = %if.end95
  store i32 0, ptr @J, align 4
  br label %if.end100

if.else99:                                        ; preds = %if.end95
  store i32 1, ptr @J, align 4
  br label %if.end100

if.end100:                                        ; preds = %if.else99, %if.then98
  %40 = load i32, ptr @J, align 4
  %cmp101 = icmp slt i32 %40, 1
  br i1 %cmp101, label %if.then103, label %if.else104

if.then103:                                       ; preds = %if.end100
  store i32 1, ptr @J, align 4
  br label %if.end105

if.else104:                                       ; preds = %if.end100
  store i32 0, ptr @J, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.else104, %if.then103
  br label %for.inc106

for.inc106:                                       ; preds = %if.end105
  %inc107 = add nsw i64 %I.3, 1
  br label %for.cond87, !llvm.loop !11

for.end108:                                       ; preds = %for.cond87
  %cmp109 = icmp eq i32 %JJ.0, 1
  br i1 %cmp109, label %if.then111, label %if.end114

if.then111:                                       ; preds = %for.end108
  %41 = load i32, ptr @J, align 4
  %conv112 = sext i32 %41 to i64
  %42 = load i32, ptr @J, align 4
  %conv113 = sext i32 %42 to i64
  call void @POUT(i64 noundef %mul21, i64 noundef %conv112, i64 noundef %conv113, double noundef %X1.0, double noundef %X2.0, double noundef %X3.0, double noundef %X4.0)
  br label %if.end114

if.end114:                                        ; preds = %if.then111, %for.end108
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  br label %for.cond115

for.cond115:                                      ; preds = %for.inc142, %if.end114
  %I.4 = phi i64 [ 1, %if.end114 ], [ %inc143, %for.inc142 ]
  %cmp116 = icmp sle i64 %I.4, %mul22
  br i1 %cmp116, label %for.body118, label %for.end144

for.body118:                                      ; preds = %for.cond115
  %43 = load i32, ptr @J, align 4
  %44 = load i32, ptr @K, align 4
  %45 = load i32, ptr @J, align 4
  %sub119 = sub nsw i32 %44, %45
  %mul120 = mul nsw i32 %43, %sub119
  %46 = load i32, ptr @L, align 4
  %47 = load i32, ptr @K, align 4
  %sub121 = sub nsw i32 %46, %47
  %mul122 = mul nsw i32 %mul120, %sub121
  store i32 %mul122, ptr @J, align 4
  %48 = load i32, ptr @L, align 4
  %49 = load i32, ptr @K, align 4
  %mul123 = mul nsw i32 %48, %49
  %50 = load i32, ptr @L, align 4
  %51 = load i32, ptr @J, align 4
  %sub124 = sub nsw i32 %50, %51
  %52 = load i32, ptr @K, align 4
  %mul125 = mul nsw i32 %sub124, %52
  %sub126 = sub nsw i32 %mul123, %mul125
  store i32 %sub126, ptr @K, align 4
  %53 = load i32, ptr @L, align 4
  %54 = load i32, ptr @K, align 4
  %sub127 = sub nsw i32 %53, %54
  %55 = load i32, ptr @K, align 4
  %56 = load i32, ptr @J, align 4
  %add128 = add nsw i32 %55, %56
  %mul129 = mul nsw i32 %sub127, %add128
  store i32 %mul129, ptr @L, align 4
  %57 = load i32, ptr @J, align 4
  %58 = load i32, ptr @K, align 4
  %add130 = add nsw i32 %57, %58
  %59 = load i32, ptr @L, align 4
  %add131 = add nsw i32 %add130, %59
  %conv132 = sitofp i32 %add131 to double
  %60 = load i32, ptr @L, align 4
  %sub133 = sub nsw i32 %60, 1
  %idxprom134 = sext i32 %sub133 to i64
  %arrayidx135 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom134
  store double %conv132, ptr %arrayidx135, align 8
  %61 = load i32, ptr @J, align 4
  %62 = load i32, ptr @K, align 4
  %mul136 = mul nsw i32 %61, %62
  %63 = load i32, ptr @L, align 4
  %mul137 = mul nsw i32 %mul136, %63
  %conv138 = sitofp i32 %mul137 to double
  %64 = load i32, ptr @K, align 4
  %sub139 = sub nsw i32 %64, 1
  %idxprom140 = sext i32 %sub139 to i64
  %arrayidx141 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom140
  store double %conv138, ptr %arrayidx141, align 8
  br label %for.inc142

for.inc142:                                       ; preds = %for.body118
  %inc143 = add nsw i64 %I.4, 1
  br label %for.cond115, !llvm.loop !12

for.end144:                                       ; preds = %for.cond115
  %cmp145 = icmp eq i32 %JJ.0, 1
  br i1 %cmp145, label %if.then147, label %if.end150

if.then147:                                       ; preds = %for.end144
  %65 = load i32, ptr @J, align 4
  %conv148 = sext i32 %65 to i64
  %66 = load i32, ptr @K, align 4
  %conv149 = sext i32 %66 to i64
  %67 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %68 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %69 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %70 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %mul22, i64 noundef %conv148, i64 noundef %conv149, double noundef %67, double noundef %68, double noundef %69, double noundef %70)
  br label %if.end150

if.end150:                                        ; preds = %if.then147, %for.end144
  br label %for.cond151

for.cond151:                                      ; preds = %for.inc180, %if.end150
  %X.0 = phi double [ 5.000000e-01, %if.end150 ], [ %mul166, %for.inc180 ]
  %Y.0 = phi double [ 5.000000e-01, %if.end150 ], [ %mul179, %for.inc180 ]
  %I.5 = phi i64 [ 1, %if.end150 ], [ %inc181, %for.inc180 ]
  %cmp152 = icmp sle i64 %I.5, %mul23
  br i1 %cmp152, label %for.body154, label %for.end182

for.body154:                                      ; preds = %for.cond151
  %71 = load double, ptr @T, align 8
  %72 = load double, ptr @T2, align 8
  %call155 = call double @sin(double noundef %X.0) #5
  %mul156 = fmul double %72, %call155
  %call157 = call double @cos(double noundef %X.0) #5
  %mul158 = fmul double %mul156, %call157
  %add159 = fadd double %X.0, %Y.0
  %call160 = call double @cos(double noundef %add159) #5
  %sub161 = fsub double %X.0, %Y.0
  %call162 = call double @cos(double noundef %sub161) #5
  %add163 = fadd double %call160, %call162
  %sub164 = fsub double %add163, 1.000000e+00
  %div = fdiv double %mul158, %sub164
  %call165 = call double @atan(double noundef %div) #5
  %mul166 = fmul double %71, %call165
  %73 = load double, ptr @T, align 8
  %74 = load double, ptr @T2, align 8
  %call167 = call double @sin(double noundef %Y.0) #5
  %mul168 = fmul double %74, %call167
  %call169 = call double @cos(double noundef %Y.0) #5
  %mul170 = fmul double %mul168, %call169
  %add171 = fadd double %mul166, %Y.0
  %call172 = call double @cos(double noundef %add171) #5
  %sub173 = fsub double %mul166, %Y.0
  %call174 = call double @cos(double noundef %sub173) #5
  %add175 = fadd double %call172, %call174
  %sub176 = fsub double %add175, 1.000000e+00
  %div177 = fdiv double %mul170, %sub176
  %call178 = call double @atan(double noundef %div177) #5
  %mul179 = fmul double %73, %call178
  br label %for.inc180

for.inc180:                                       ; preds = %for.body154
  %inc181 = add nsw i64 %I.5, 1
  br label %for.cond151, !llvm.loop !13

for.end182:                                       ; preds = %for.cond151
  %cmp183 = icmp eq i32 %JJ.0, 1
  br i1 %cmp183, label %if.then185, label %if.end188

if.then185:                                       ; preds = %for.end182
  %75 = load i32, ptr @J, align 4
  %conv186 = sext i32 %75 to i64
  %76 = load i32, ptr @K, align 4
  %conv187 = sext i32 %76 to i64
  call void @POUT(i64 noundef %mul23, i64 noundef %conv186, i64 noundef %conv187, double noundef %X.0, double noundef %X.0, double noundef %Y.0, double noundef %Y.0)
  br label %if.end188

if.end188:                                        ; preds = %if.then185, %for.end182
  store double 1.000000e+00, ptr %Z, align 8
  br label %for.cond189

for.cond189:                                      ; preds = %for.inc193, %if.end188
  %I.6 = phi i64 [ 1, %if.end188 ], [ %inc194, %for.inc193 ]
  %cmp190 = icmp sle i64 %I.6, %mul24
  br i1 %cmp190, label %for.body192, label %for.end195

for.body192:                                      ; preds = %for.cond189
  call void @P3(double noundef 1.000000e+00, double noundef 1.000000e+00, ptr noundef %Z)
  br label %for.inc193

for.inc193:                                       ; preds = %for.body192
  %inc194 = add nsw i64 %I.6, 1
  br label %for.cond189, !llvm.loop !14

for.end195:                                       ; preds = %for.cond189
  %cmp196 = icmp eq i32 %JJ.0, 1
  br i1 %cmp196, label %if.then198, label %if.end201

if.then198:                                       ; preds = %for.end195
  %77 = load i32, ptr @J, align 4
  %conv199 = sext i32 %77 to i64
  %78 = load i32, ptr @K, align 4
  %conv200 = sext i32 %78 to i64
  %79 = load double, ptr %Z, align 8
  %80 = load double, ptr %Z, align 8
  call void @POUT(i64 noundef %mul24, i64 noundef %conv199, i64 noundef %conv200, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef %79, double noundef %80)
  br label %if.end201

if.end201:                                        ; preds = %if.then198, %for.end195
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double 2.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double 3.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  br label %for.cond202

for.cond202:                                      ; preds = %for.inc206, %if.end201
  %I.7 = phi i64 [ 1, %if.end201 ], [ %inc207, %for.inc206 ]
  %cmp203 = icmp sle i64 %I.7, %mul25
  br i1 %cmp203, label %for.body205, label %for.end208

for.body205:                                      ; preds = %for.cond202
  call void @P0()
  br label %for.inc206

for.inc206:                                       ; preds = %for.body205
  %inc207 = add nsw i64 %I.7, 1
  br label %for.cond202, !llvm.loop !15

for.end208:                                       ; preds = %for.cond202
  %cmp209 = icmp eq i32 %JJ.0, 1
  br i1 %cmp209, label %if.then211, label %if.end214

if.then211:                                       ; preds = %for.end208
  %81 = load i32, ptr @J, align 4
  %conv212 = sext i32 %81 to i64
  %82 = load i32, ptr @K, align 4
  %conv213 = sext i32 %82 to i64
  %83 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %84 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %85 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %86 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %mul25, i64 noundef %conv212, i64 noundef %conv213, double noundef %83, double noundef %84, double noundef %85, double noundef %86)
  br label %if.end214

if.end214:                                        ; preds = %if.then211, %for.end208
  store i32 2, ptr @J, align 4
  store i32 3, ptr @K, align 4
  br label %for.cond215

for.cond215:                                      ; preds = %for.inc224, %if.end214
  %I.8 = phi i64 [ 1, %if.end214 ], [ %inc225, %for.inc224 ]
  %cmp216 = icmp sle i64 %I.8, 0
  br i1 %cmp216, label %for.body218, label %for.end226

for.body218:                                      ; preds = %for.cond215
  %87 = load i32, ptr @J, align 4
  %88 = load i32, ptr @K, align 4
  %add219 = add nsw i32 %87, %88
  store i32 %add219, ptr @J, align 4
  %89 = load i32, ptr @J, align 4
  %90 = load i32, ptr @K, align 4
  %add220 = add nsw i32 %89, %90
  store i32 %add220, ptr @K, align 4
  %91 = load i32, ptr @K, align 4
  %92 = load i32, ptr @J, align 4
  %sub221 = sub nsw i32 %91, %92
  store i32 %sub221, ptr @J, align 4
  %93 = load i32, ptr @K, align 4
  %94 = load i32, ptr @J, align 4
  %sub222 = sub nsw i32 %93, %94
  %95 = load i32, ptr @J, align 4
  %sub223 = sub nsw i32 %sub222, %95
  store i32 %sub223, ptr @K, align 4
  br label %for.inc224

for.inc224:                                       ; preds = %for.body218
  %inc225 = add nsw i64 %I.8, 1
  br label %for.cond215, !llvm.loop !16

for.end226:                                       ; preds = %for.cond215
  %cmp227 = icmp eq i32 %JJ.0, 1
  br i1 %cmp227, label %if.then229, label %if.end232

if.then229:                                       ; preds = %for.end226
  %96 = load i32, ptr @J, align 4
  %conv230 = sext i32 %96 to i64
  %97 = load i32, ptr @K, align 4
  %conv231 = sext i32 %97 to i64
  call void @POUT(i64 noundef 0, i64 noundef %conv230, i64 noundef %conv231, double noundef %X1.0, double noundef %X2.0, double noundef %X3.0, double noundef %X4.0)
  br label %if.end232

if.end232:                                        ; preds = %if.then229, %for.end226
  br label %for.cond233

for.cond233:                                      ; preds = %for.inc241, %if.end232
  %X.1 = phi double [ 7.500000e-01, %if.end232 ], [ %call240, %for.inc241 ]
  %I.9 = phi i64 [ 1, %if.end232 ], [ %inc242, %for.inc241 ]
  %cmp234 = icmp sle i64 %I.9, %mul26
  br i1 %cmp234, label %for.body236, label %for.end243

for.body236:                                      ; preds = %for.cond233
  %call237 = call double @log(double noundef %X.1) #5
  %98 = load double, ptr @T1, align 8
  %div238 = fdiv double %call237, %98
  %call239 = call double @exp(double noundef %div238) #5
  %call240 = call double @sqrt(double noundef %call239) #5
  br label %for.inc241

for.inc241:                                       ; preds = %for.body236
  %inc242 = add nsw i64 %I.9, 1
  br label %for.cond233, !llvm.loop !17

for.end243:                                       ; preds = %for.cond233
  %cmp244 = icmp eq i32 %JJ.0, 1
  br i1 %cmp244, label %if.then246, label %if.end249

if.then246:                                       ; preds = %for.end243
  %99 = load i32, ptr @J, align 4
  %conv247 = sext i32 %99 to i64
  %100 = load i32, ptr @K, align 4
  %conv248 = sext i32 %100 to i64
  call void @POUT(i64 noundef %mul26, i64 noundef %conv247, i64 noundef %conv248, double noundef %X.1, double noundef %X.1, double noundef %X.1, double noundef %X.1)
  br label %if.end249

if.end249:                                        ; preds = %if.then246, %for.end243
  %inc250 = add nsw i32 %JJ.0, 1
  %cmp251 = icmp sle i32 %inc250, 1
  br i1 %cmp251, label %if.then253, label %if.end254

if.then253:                                       ; preds = %if.end249
  br label %IILOOP

if.end254:                                        ; preds = %if.end249
  %call255 = call i64 @time(ptr noundef null) #5
  %call256 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br i1 %tobool, label %if.then257, label %if.end258

if.then257:                                       ; preds = %if.end254
  br label %LCONT

if.end258:                                        ; preds = %if.end254
  br label %return

return:                                           ; preds = %if.end258, %if.else16
  %retval.0 = phi i32 [ 1, %if.else16 ], [ 0, %if.end258 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @atol(ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @POUT(i64 noundef %N, i64 noundef %J, i64 noundef %K, double noundef %X1, double noundef %X2, double noundef %X3, double noundef %X4) #0 {
entry:
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %N, i64 noundef %J, i64 noundef %K, double noundef %X1, double noundef %X2, double noundef %X3, double noundef %X4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PA(ptr noundef %E) #0 {
entry:
  store i32 0, ptr @J, align 4
  %arrayidx = getelementptr inbounds double, ptr %E, i64 1
  %arrayidx1 = getelementptr inbounds double, ptr %E, i64 2
  %arrayidx2 = getelementptr inbounds double, ptr %E, i64 3
  %arrayidx4 = getelementptr inbounds double, ptr %E, i64 4
  %arrayidx5 = getelementptr inbounds double, ptr %E, i64 1
  %arrayidx6 = getelementptr inbounds double, ptr %E, i64 1
  %arrayidx7 = getelementptr inbounds double, ptr %E, i64 2
  %arrayidx9 = getelementptr inbounds double, ptr %E, i64 3
  %arrayidx11 = getelementptr inbounds double, ptr %E, i64 4
  %arrayidx14 = getelementptr inbounds double, ptr %E, i64 2
  %arrayidx15 = getelementptr inbounds double, ptr %E, i64 1
  %arrayidx16 = getelementptr inbounds double, ptr %E, i64 2
  %arrayidx18 = getelementptr inbounds double, ptr %E, i64 3
  %arrayidx20 = getelementptr inbounds double, ptr %E, i64 4
  %arrayidx23 = getelementptr inbounds double, ptr %E, i64 3
  %arrayidx24 = getelementptr inbounds double, ptr %E, i64 1
  %arrayidx25 = getelementptr inbounds double, ptr %E, i64 2
  %arrayidx27 = getelementptr inbounds double, ptr %E, i64 3
  %arrayidx29 = getelementptr inbounds double, ptr %E, i64 4
  %0 = load double, ptr @T2, align 8
  %arrayidx31 = getelementptr inbounds double, ptr %E, i64 4
  br label %L10

L10:                                              ; preds = %if.then, %entry
  %1 = load double, ptr %arrayidx, align 8
  %2 = load double, ptr %arrayidx1, align 8
  %add = fadd double %1, %2
  %3 = load double, ptr %arrayidx2, align 8
  %add3 = fadd double %add, %3
  %4 = load double, ptr %arrayidx4, align 8
  %sub = fsub double %add3, %4
  %5 = load double, ptr @T, align 8
  %mul = fmul double %sub, %5
  store double %mul, ptr %arrayidx5, align 8
  %6 = load double, ptr %arrayidx6, align 8
  %7 = load double, ptr %arrayidx7, align 8
  %add8 = fadd double %6, %7
  %8 = load double, ptr %arrayidx9, align 8
  %sub10 = fsub double %add8, %8
  %9 = load double, ptr %arrayidx11, align 8
  %add12 = fadd double %sub10, %9
  %10 = load double, ptr @T, align 8
  %mul13 = fmul double %add12, %10
  store double %mul13, ptr %arrayidx14, align 8
  %11 = load double, ptr %arrayidx15, align 8
  %12 = load double, ptr %arrayidx16, align 8
  %sub17 = fsub double %11, %12
  %13 = load double, ptr %arrayidx18, align 8
  %add19 = fadd double %sub17, %13
  %14 = load double, ptr %arrayidx20, align 8
  %add21 = fadd double %add19, %14
  %15 = load double, ptr @T, align 8
  %mul22 = fmul double %add21, %15
  store double %mul22, ptr %arrayidx23, align 8
  %16 = load double, ptr %arrayidx24, align 8
  %fneg = fneg double %16
  %17 = load double, ptr %arrayidx25, align 8
  %add26 = fadd double %fneg, %17
  %18 = load double, ptr %arrayidx27, align 8
  %add28 = fadd double %add26, %18
  %19 = load double, ptr %arrayidx29, align 8
  %add30 = fadd double %add28, %19
  %div = fdiv double %add30, %0
  store double %div, ptr %arrayidx31, align 8
  %20 = load i32, ptr @J, align 4
  %add32 = add nsw i32 %20, 1
  store i32 %add32, ptr @J, align 4
  %21 = load i32, ptr @J, align 4
  %cmp = icmp slt i32 %21, 6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %L10
  br label %L10

if.end:                                           ; preds = %L10
  ret void
}

; Function Attrs: nounwind
declare double @atan(double noundef) #3

; Function Attrs: nounwind
declare double @sin(double noundef) #3

; Function Attrs: nounwind
declare double @cos(double noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @P3(double noundef %X, double noundef %Y, ptr noundef %Z) #0 {
entry:
  %0 = load double, ptr @T, align 8
  %add = fadd double %X, %Y
  %mul = fmul double %0, %add
  %1 = load double, ptr @T, align 8
  %add1 = fadd double %mul, %Y
  %mul2 = fmul double %1, %add1
  %add3 = fadd double %mul, %mul2
  %2 = load double, ptr @T2, align 8
  %div = fdiv double %add3, %2
  store double %div, ptr %Z, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @P0() #0 {
entry:
  %0 = load i32, ptr @K, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom
  %1 = load double, ptr %arrayidx, align 8
  %2 = load i32, ptr @J, align 4
  %idxprom1 = sext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom1
  store double %1, ptr %arrayidx2, align 8
  %3 = load i32, ptr @L, align 4
  %idxprom3 = sext i32 %3 to i64
  %arrayidx4 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom3
  %4 = load double, ptr %arrayidx4, align 8
  %5 = load i32, ptr @K, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom5
  store double %4, ptr %arrayidx6, align 8
  %6 = load i32, ptr @J, align 4
  %idxprom7 = sext i32 %6 to i64
  %arrayidx8 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom7
  %7 = load double, ptr %arrayidx8, align 8
  %8 = load i32, ptr @L, align 4
  %idxprom9 = sext i32 %8 to i64
  %arrayidx10 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %idxprom9
  store double %7, ptr %arrayidx10, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

; Function Attrs: nounwind
declare double @exp(double noundef) #3

; Function Attrs: nounwind
declare double @log(double noundef) #3

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }
attributes #5 = { nounwind }

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
