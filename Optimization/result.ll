; ModuleID = '<stdin>'
source_filename = "tests/testing/recursive.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ack(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %11

8:                                                ; preds = %2
  %9 = load i32, ptr %5, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  br label %26

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  %13 = sub nsw i32 %12, 1
  %14 = load i32, ptr %5, align 4
  %15 = or i32 %14, 0
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %11
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %19, 1
  %21 = call i32 @ack(i32 noundef %18, i32 noundef %20)
  br label %23

22:                                               ; preds = %11
  br label %23

23:                                               ; preds = %22, %17
  %24 = phi i32 [ %21, %17 ], [ 1, %22 ]
  %25 = call i32 @ack(i32 noundef %13, i32 noundef %24)
  store i32 %25, ptr %3, align 4
  br label %26

26:                                               ; preds = %23, %8
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @fib(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %15

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = sub nsw i32 %8, 2
  %10 = call i32 @fib(i32 noundef %9)
  %11 = load i32, ptr %3, align 4
  %12 = sub nsw i32 %11, 1
  %13 = call i32 @fib(i32 noundef %12)
  %14 = add nsw i32 %10, %13
  store i32 %14, ptr %2, align 4
  br label %15

15:                                               ; preds = %7, %6
  %16 = load i32, ptr %2, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @fibFP(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, ptr %3, align 8
  %4 = load double, ptr %3, align 8
  %5 = fcmp olt double %4, 2.000000e+00
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store double 1.000000e+00, ptr %2, align 8
  br label %15

7:                                                ; preds = %1
  %8 = load double, ptr %3, align 8
  %9 = fsub double %8, 2.000000e+00
  %10 = call double @fibFP(double noundef %9)
  %11 = load double, ptr %3, align 8
  %12 = fsub double %11, 1.000000e+00
  %13 = call double @fibFP(double noundef %12)
  %14 = fadd double %10, %13
  store double %14, ptr %2, align 8
  br label %15

15:                                               ; preds = %7, %6
  %16 = load double, ptr %2, align 8
  ret double %16
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @tak(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %3
  %12 = load i32, ptr %5, align 4
  %13 = sub nsw i32 %12, 1
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %7, align 4
  %16 = call i32 @tak(i32 noundef %13, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %6, align 4
  %18 = sub nsw i32 %17, 1
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %5, align 4
  %21 = call i32 @tak(i32 noundef %18, i32 noundef %19, i32 noundef %20)
  %22 = load i32, ptr %7, align 4
  %23 = sub nsw i32 %22, 1
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = call i32 @tak(i32 noundef %23, i32 noundef %24, i32 noundef %25)
  %27 = call i32 @tak(i32 noundef %16, i32 noundef %21, i32 noundef %26)
  store i32 %27, ptr %4, align 4
  br label %30

28:                                               ; preds = %3
  %29 = load i32, ptr %7, align 4
  store i32 %29, ptr %4, align 4
  br label %30

30:                                               ; preds = %28, %11
  %31 = load i32, ptr %4, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @takFP(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store double %0, ptr %5, align 8
  store double %1, ptr %6, align 8
  store double %2, ptr %7, align 8
  %8 = load double, ptr %6, align 8
  %9 = load double, ptr %5, align 8
  %10 = fcmp olt double %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %3
  %12 = load double, ptr %5, align 8
  %13 = fsub double %12, 1.000000e+00
  %14 = load double, ptr %6, align 8
  %15 = load double, ptr %7, align 8
  %16 = call double @takFP(double noundef %13, double noundef %14, double noundef %15)
  %17 = load double, ptr %6, align 8
  %18 = fsub double %17, 1.000000e+00
  %19 = load double, ptr %7, align 8
  %20 = load double, ptr %5, align 8
  %21 = call double @takFP(double noundef %18, double noundef %19, double noundef %20)
  %22 = load double, ptr %7, align 8
  %23 = fsub double %22, 1.000000e+00
  %24 = load double, ptr %5, align 8
  %25 = load double, ptr %6, align 8
  %26 = call double @takFP(double noundef %23, double noundef %24, double noundef %25)
  %27 = call double @takFP(double noundef %16, double noundef %21, double noundef %26)
  store double %27, ptr %4, align 8
  br label %30

28:                                               ; preds = %3
  %29 = load double, ptr %7, align 8
  store double %29, ptr %4, align 8
  br label %30

30:                                               ; preds = %28, %11
  %31 = load double, ptr %4, align 8
  ret double %31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 10, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = add nsw i32 %7, 1
  %9 = load i32, ptr %6, align 4
  %10 = add nsw i32 %9, 1
  %11 = call i32 @ack(i32 noundef 3, i32 noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8, i32 noundef %11)
  %13 = load i32, ptr %6, align 4
  %14 = sitofp i32 %13 to double
  %15 = fadd double 2.800000e+01, %14
  %16 = load i32, ptr %6, align 4
  %17 = sitofp i32 %16 to double
  %18 = fadd double 2.800000e+01, %17
  %19 = call double @fibFP(double noundef %18)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %15, double noundef %19)
  %21 = load i32, ptr %6, align 4
  %22 = mul nsw i32 3, %21
  %23 = load i32, ptr %6, align 4
  %24 = mul nsw i32 2, %23
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %6, align 4
  %27 = mul nsw i32 3, %26
  %28 = load i32, ptr %6, align 4
  %29 = mul nsw i32 2, %28
  %30 = load i32, ptr %6, align 4
  %31 = call i32 @tak(i32 noundef %27, i32 noundef %29, i32 noundef %30)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %22, i32 noundef %24, i32 noundef %25, i32 noundef %31)
  %33 = call i32 @fib(i32 noundef 3)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %33)
  %35 = call double @takFP(double noundef 3.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %35)
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
!5 = !{!"Ubuntu clang version 15.0.7"}
