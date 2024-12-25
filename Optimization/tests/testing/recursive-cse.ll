; ModuleID = '<stdin>'
source_filename = "tests/testing/recursive.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ack(i32 noundef %x, i32 noundef %y) #0 {
entry:
  %cmp = icmp eq i32 %x, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add = add nsw i32 %y, 1
  br label %return

if.end:                                           ; preds = %entry
  %sub = sub nsw i32 %x, 1
  %or = or i32 %y, 0
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %sub1 = sub nsw i32 %y, 1
  %call = call i32 @ack(i32 noundef %x, i32 noundef %sub1)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 1, %cond.false ]
  %call2 = call i32 @ack(i32 noundef %sub, i32 noundef %cond)
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %retval.0 = phi i32 [ %add, %if.then ], [ %call2, %cond.end ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fib(i32 noundef %n) #0 {
entry:
  %cmp = icmp slt i32 %n, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %sub = sub nsw i32 %n, 2
  %call = call i32 @fib(i32 noundef %sub)
  %sub1 = sub nsw i32 %n, 1
  %call2 = call i32 @fib(i32 noundef %sub1)
  %add = add nsw i32 %call, %call2
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ %add, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @fibFP(double noundef %n) #0 {
entry:
  %cmp = fcmp olt double %n, 2.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %sub = fsub double %n, 2.000000e+00
  %call = call double @fibFP(double noundef %sub)
  %sub1 = fsub double %n, 1.000000e+00
  %call2 = call double @fibFP(double noundef %sub1)
  %add = fadd double %call, %call2
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi double [ 1.000000e+00, %if.then ], [ %add, %if.end ]
  ret double %retval.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @tak(i32 noundef %x, i32 noundef %y, i32 noundef %z) #0 {
entry:
  %cmp = icmp slt i32 %y, %x
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub = sub nsw i32 %x, 1
  %call = call i32 @tak(i32 noundef %sub, i32 noundef %y, i32 noundef %z)
  %sub1 = sub nsw i32 %y, 1
  %call2 = call i32 @tak(i32 noundef %sub1, i32 noundef %z, i32 noundef %x)
  %sub3 = sub nsw i32 %z, 1
  %call4 = call i32 @tak(i32 noundef %sub3, i32 noundef %x, i32 noundef %y)
  %call5 = call i32 @tak(i32 noundef %call, i32 noundef %call2, i32 noundef %call4)
  br label %return

if.end:                                           ; preds = %entry
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %call5, %if.then ], [ %z, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @takFP(double noundef %x, double noundef %y, double noundef %z) #0 {
entry:
  %cmp = fcmp olt double %y, %x
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub = fsub double %x, 1.000000e+00
  %call = call double @takFP(double noundef %sub, double noundef %y, double noundef %z)
  %sub1 = fsub double %y, 1.000000e+00
  %call2 = call double @takFP(double noundef %sub1, double noundef %z, double noundef %x)
  %sub3 = fsub double %z, 1.000000e+00
  %call4 = call double @takFP(double noundef %sub3, double noundef %x, double noundef %y)
  %call5 = call double @takFP(double noundef %call, double noundef %call2, double noundef %call4)
  br label %return

if.end:                                           ; preds = %entry
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi double [ %call5, %if.then ], [ %z, %if.end ]
  ret double %retval.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %add = add nsw i32 10, 1
  %call = call i32 @ack(i32 noundef 3, i32 noundef %add)
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %add, i32 noundef %call)
  %conv = sitofp i32 10 to double
  %add3 = fadd double 2.800000e+01, %conv
  %conv4 = sitofp i32 10 to double
  %add5 = fadd double 2.800000e+01, %conv4
  %call6 = call double @fibFP(double noundef %add5)
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %add3, double noundef %call6)
  %mul = mul nsw i32 3, 10
  %mul8 = mul nsw i32 2, 10
  %call11 = call i32 @tak(i32 noundef %mul, i32 noundef %mul8, i32 noundef 10)
  %call12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %mul, i32 noundef %mul8, i32 noundef 10, i32 noundef %call11)
  %call13 = call i32 @fib(i32 noundef 3)
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %call13)
  %call15 = call double @takFP(double noundef 3.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00)
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %call15)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git bd76a3d41b4001cc1224acf7e88bb2644f8829e2)"}
