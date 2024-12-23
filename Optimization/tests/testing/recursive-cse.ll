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
define dso_local i32 @ack(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = add nsw i32 %1, 1
  br label %17

6:                                                ; preds = %2
  %7 = sub nsw i32 %0, 1
  %8 = or i32 %1, 0
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = sub nsw i32 %1, 1
  %12 = call i32 @ack(i32 noundef %0, i32 noundef %11)
  br label %14

13:                                               ; preds = %6
  br label %14

14:                                               ; preds = %13, %10
  %15 = phi i32 [ %12, %10 ], [ 1, %13 ]
  %16 = call i32 @ack(i32 noundef %7, i32 noundef %15)
  br label %17

17:                                               ; preds = %14, %4
  %.0 = phi i32 [ %5, %4 ], [ %16, %14 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fib(i32 noundef %0) #0 {
  %2 = icmp slt i32 %0, 2
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %10

4:                                                ; preds = %1
  %5 = sub nsw i32 %0, 2
  %6 = call i32 @fib(i32 noundef %5)
  %7 = sub nsw i32 %0, 1
  %8 = call i32 @fib(i32 noundef %7)
  %9 = add nsw i32 %6, %8
  br label %10

10:                                               ; preds = %4, %3
  %.0 = phi i32 [ 1, %3 ], [ %9, %4 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @fibFP(double noundef %0) #0 {
  %2 = fcmp olt double %0, 2.000000e+00
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %10

4:                                                ; preds = %1
  %5 = fsub double %0, 2.000000e+00
  %6 = call double @fibFP(double noundef %5)
  %7 = fsub double %0, 1.000000e+00
  %8 = call double @fibFP(double noundef %7)
  %9 = fadd double %6, %8
  br label %10

10:                                               ; preds = %4, %3
  %.0 = phi double [ 1.000000e+00, %3 ], [ %9, %4 ]
  ret double %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @tak(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = icmp slt i32 %1, %0
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  %6 = sub nsw i32 %0, 1
  %7 = call i32 @tak(i32 noundef %6, i32 noundef %1, i32 noundef %2)
  %8 = sub nsw i32 %1, 1
  %9 = call i32 @tak(i32 noundef %8, i32 noundef %2, i32 noundef %0)
  %10 = sub nsw i32 %2, 1
  %11 = call i32 @tak(i32 noundef %10, i32 noundef %0, i32 noundef %1)
  %12 = call i32 @tak(i32 noundef %7, i32 noundef %9, i32 noundef %11)
  br label %14

13:                                               ; preds = %3
  br label %14

14:                                               ; preds = %13, %5
  %.0 = phi i32 [ %12, %5 ], [ %2, %13 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @takFP(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = fcmp olt double %1, %0
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  %6 = fsub double %0, 1.000000e+00
  %7 = call double @takFP(double noundef %6, double noundef %1, double noundef %2)
  %8 = fsub double %1, 1.000000e+00
  %9 = call double @takFP(double noundef %8, double noundef %2, double noundef %0)
  %10 = fsub double %2, 1.000000e+00
  %11 = call double @takFP(double noundef %10, double noundef %0, double noundef %1)
  %12 = call double @takFP(double noundef %7, double noundef %9, double noundef %11)
  br label %14

13:                                               ; preds = %3
  br label %14

14:                                               ; preds = %13, %5
  %.0 = phi double [ %12, %5 ], [ %2, %13 ]
  ret double %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = add nsw i32 10, 1
  %4 = call i32 @ack(i32 noundef 3, i32 noundef %3)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3, i32 noundef %4)
  %6 = sitofp i32 10 to double
  %7 = fadd double 2.800000e+01, %6
  %8 = sitofp i32 10 to double
  %9 = fadd double 2.800000e+01, %8
  %10 = call double @fibFP(double noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %7, double noundef %10)
  %12 = mul nsw i32 3, 10
  %13 = mul nsw i32 2, 10
  %14 = call i32 @tak(i32 noundef %12, i32 noundef %13, i32 noundef 10)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %12, i32 noundef %13, i32 noundef 10, i32 noundef %14)
  %16 = call i32 @fib(i32 noundef 3)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %16)
  %18 = call double @takFP(double noundef 3.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %18)
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
