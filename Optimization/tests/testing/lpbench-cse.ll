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
define dso_local void @matgen(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %18, %2
  %.01 = phi i32 [ 0, %2 ], [ %19, %18 ]
  %4 = icmp slt i32 %.01, 2000
  br i1 %4, label %5, label %20

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %15, %5
  %.0 = phi i32 [ 0, %5 ], [ %16, %15 ]
  %7 = icmp slt i32 %.0, 2000
  br i1 %7, label %8, label %17

8:                                                ; preds = %6
  %9 = call double @random_double()
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds ptr, ptr %0, i64 %10
  %12 = load ptr, ptr %11, align 8
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds double, ptr %12, i64 %13
  store double %9, ptr %14, align 8
  br label %15

15:                                               ; preds = %8
  %16 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !6

17:                                               ; preds = %6
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

20:                                               ; preds = %3
  br label %21

21:                                               ; preds = %26, %20
  %.12 = phi i32 [ 0, %20 ], [ %27, %26 ]
  %22 = icmp slt i32 %.12, 2000
  br i1 %22, label %23, label %28

23:                                               ; preds = %21
  %24 = sext i32 %.12 to i64
  %25 = getelementptr inbounds double, ptr %1, i64 %24
  store double 0.000000e+00, ptr %25, align 8
  br label %26

26:                                               ; preds = %23
  %27 = add nsw i32 %.12, 1
  br label %21, !llvm.loop !9

28:                                               ; preds = %21
  br label %29

29:                                               ; preds = %48, %28
  %.1 = phi i32 [ 0, %28 ], [ %49, %48 ]
  %30 = icmp slt i32 %.1, 2000
  br i1 %30, label %31, label %50

31:                                               ; preds = %29
  br label %32

32:                                               ; preds = %45, %31
  %.2 = phi i32 [ 0, %31 ], [ %46, %45 ]
  %33 = icmp slt i32 %.2, 2000
  br i1 %33, label %34, label %47

34:                                               ; preds = %32
  %35 = sext i32 %.1 to i64
  %36 = getelementptr inbounds ptr, ptr %0, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = sext i32 %.2 to i64
  %39 = getelementptr inbounds double, ptr %37, i64 %38
  %40 = load double, ptr %39, align 8
  %41 = sext i32 %.2 to i64
  %42 = getelementptr inbounds double, ptr %1, i64 %41
  %43 = load double, ptr %42, align 8
  %44 = fadd double %43, %40
  store double %44, ptr %42, align 8
  br label %45

45:                                               ; preds = %34
  %46 = add nsw i32 %.2, 1
  br label %32, !llvm.loop !10

47:                                               ; preds = %32
  br label %48

48:                                               ; preds = %47
  %49 = add nsw i32 %.1, 1
  br label %29, !llvm.loop !11

50:                                               ; preds = %29
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @idamax(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = icmp slt i32 %0, 1
  br i1 %5, label %6, label %7

6:                                                ; preds = %4
  br label %53

7:                                                ; preds = %4
  br i1 %5, label %8, label %9

8:                                                ; preds = %7
  br label %52

9:                                                ; preds = %7
  %10 = icmp ne i32 %3, 1
  br i1 %10, label %11, label %32

11:                                               ; preds = %9
  %12 = sext i32 %2 to i64
  %13 = getelementptr inbounds double, ptr %1, i64 %12
  %14 = load double, ptr %13, align 8
  %15 = call double @llvm.fabs.f64(double %14)
  %16 = add nsw i32 1, %3
  br label %17

17:                                               ; preds = %29, %11
  %.04 = phi double [ %15, %11 ], [ %.15, %29 ]
  %.02 = phi i32 [ 1, %11 ], [ %30, %29 ]
  %.01 = phi i32 [ %16, %11 ], [ %28, %29 ]
  %.0 = phi i32 [ 0, %11 ], [ %.1, %29 ]
  %18 = icmp slt i32 %.02, %0
  br i1 %18, label %19, label %31

19:                                               ; preds = %17
  %20 = add nsw i32 %.01, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double, ptr %1, i64 %21
  %23 = load double, ptr %22, align 8
  %24 = call double @llvm.fabs.f64(double %23)
  %25 = fcmp ogt double %24, %.04
  br i1 %25, label %26, label %27

26:                                               ; preds = %19
  br label %27

27:                                               ; preds = %26, %19
  %.15 = phi double [ %24, %26 ], [ %.04, %19 ]
  %.1 = phi i32 [ %.02, %26 ], [ %.0, %19 ]
  %28 = add nsw i32 %.01, %3
  br label %29

29:                                               ; preds = %27
  %30 = add nsw i32 %.02, 1
  br label %17, !llvm.loop !12

31:                                               ; preds = %17
  br label %51

32:                                               ; preds = %9
  %33 = sext i32 %2 to i64
  %34 = getelementptr inbounds double, ptr %1, i64 %33
  %35 = load double, ptr %34, align 8
  %36 = call double @llvm.fabs.f64(double %35)
  br label %37

37:                                               ; preds = %48, %32
  %.26 = phi double [ %36, %32 ], [ %.37, %48 ]
  %.13 = phi i32 [ 1, %32 ], [ %49, %48 ]
  %.2 = phi i32 [ 0, %32 ], [ %.3, %48 ]
  %38 = icmp slt i32 %.13, %0
  br i1 %38, label %39, label %50

39:                                               ; preds = %37
  %40 = add nsw i32 %.13, %2
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, ptr %1, i64 %41
  %43 = load double, ptr %42, align 8
  %44 = call double @llvm.fabs.f64(double %43)
  %45 = fcmp ogt double %44, %.26
  br i1 %45, label %46, label %47

46:                                               ; preds = %39
  br label %47

47:                                               ; preds = %46, %39
  %.37 = phi double [ %44, %46 ], [ %.26, %39 ]
  %.3 = phi i32 [ %.13, %46 ], [ %.2, %39 ]
  br label %48

48:                                               ; preds = %47
  %49 = add nsw i32 %.13, 1
  br label %37, !llvm.loop !13

50:                                               ; preds = %37
  br label %51

51:                                               ; preds = %50, %31
  %.4 = phi i32 [ %.0, %31 ], [ %.2, %50 ]
  br label %52

52:                                               ; preds = %51, %8
  %.5 = phi i32 [ 0, %8 ], [ %.4, %51 ]
  br label %53

53:                                               ; preds = %52, %6
  %.6 = phi i32 [ -1, %6 ], [ %.5, %52 ]
  ret i32 %.6
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dscal(i32 noundef %0, double noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %7, label %35

7:                                                ; preds = %5
  %8 = icmp ne i32 %4, 1
  br i1 %8, label %9, label %22

9:                                                ; preds = %7
  %10 = mul nsw i32 %0, %4
  br label %11

11:                                               ; preds = %19, %9
  %.0 = phi i32 [ 0, %9 ], [ %20, %19 ]
  %12 = icmp slt i32 %.0, %10
  br i1 %12, label %13, label %21

13:                                               ; preds = %11
  %14 = add nsw i32 %.0, %3
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds double, ptr %2, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = fmul double %17, %1
  store double %18, ptr %16, align 8
  br label %19

19:                                               ; preds = %13
  %20 = add nsw i32 %.0, %4
  br label %11, !llvm.loop !14

21:                                               ; preds = %11
  br label %34

22:                                               ; preds = %7
  br label %23

23:                                               ; preds = %31, %22
  %.1 = phi i32 [ 0, %22 ], [ %32, %31 ]
  %24 = icmp slt i32 %.1, %0
  br i1 %24, label %25, label %33

25:                                               ; preds = %23
  %26 = add nsw i32 %.1, %3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, ptr %2, i64 %27
  %29 = load double, ptr %28, align 8
  %30 = fmul double %29, %1
  store double %30, ptr %28, align 8
  br label %31

31:                                               ; preds = %25
  %32 = add nsw i32 %.1, 1
  br label %23, !llvm.loop !15

33:                                               ; preds = %23
  br label %34

34:                                               ; preds = %33, %21
  br label %35

35:                                               ; preds = %34, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @daxpy(i32 noundef %0, double noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7) #0 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %61

10:                                               ; preds = %8
  %11 = fcmp une double %1, 0.000000e+00
  br i1 %11, label %12, label %61

12:                                               ; preds = %10
  %13 = icmp ne i32 %4, 1
  br i1 %13, label %16, label %14

14:                                               ; preds = %12
  %15 = icmp ne i32 %7, 1
  br i1 %15, label %16, label %44

16:                                               ; preds = %14, %12
  %17 = icmp slt i32 %4, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  %19 = sub nsw i32 1, %0
  %20 = mul nsw i32 %19, %4
  br label %21

21:                                               ; preds = %18, %16
  %.01 = phi i32 [ %20, %18 ], [ 0, %16 ]
  %22 = icmp slt i32 %7, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %21
  %24 = sub nsw i32 1, %0
  %25 = mul nsw i32 %24, %7
  br label %26

26:                                               ; preds = %23, %21
  %.0 = phi i32 [ %25, %23 ], [ 0, %21 ]
  br label %27

27:                                               ; preds = %41, %26
  %.03 = phi i32 [ 0, %26 ], [ %42, %41 ]
  %.12 = phi i32 [ %.01, %26 ], [ %39, %41 ]
  %.1 = phi i32 [ %.0, %26 ], [ %40, %41 ]
  %28 = icmp slt i32 %.03, %0
  br i1 %28, label %29, label %43

29:                                               ; preds = %27
  %30 = add nsw i32 %.12, %3
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds double, ptr %2, i64 %31
  %33 = load double, ptr %32, align 8
  %34 = add nsw i32 %.1, %6
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, ptr %5, i64 %35
  %37 = load double, ptr %36, align 8
  %38 = call double @llvm.fmuladd.f64(double %1, double %33, double %37)
  store double %38, ptr %36, align 8
  %39 = add nsw i32 %.12, %4
  %40 = add nsw i32 %.1, %7
  br label %41

41:                                               ; preds = %29
  %42 = add nsw i32 %.03, 1
  br label %27, !llvm.loop !16

43:                                               ; preds = %27
  br label %61

44:                                               ; preds = %14
  br label %45

45:                                               ; preds = %57, %44
  %.14 = phi i32 [ 0, %44 ], [ %58, %57 ]
  %46 = icmp slt i32 %.14, %0
  br i1 %46, label %47, label %59

47:                                               ; preds = %45
  %48 = add nsw i32 %.14, %3
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, ptr %2, i64 %49
  %51 = load double, ptr %50, align 8
  %52 = add nsw i32 %.14, %6
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, ptr %5, i64 %53
  %55 = load double, ptr %54, align 8
  %56 = call double @llvm.fmuladd.f64(double %1, double %51, double %55)
  store double %56, ptr %54, align 8
  br label %57

57:                                               ; preds = %47
  %58 = add nsw i32 %.14, 1
  br label %45, !llvm.loop !17

59:                                               ; preds = %45
  br label %60

60:                                               ; preds = %59
  br label %61

61:                                               ; preds = %60, %43, %10, %8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgefa(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %60, %2
  %.01 = phi i32 [ 0, %2 ], [ %9, %60 ]
  %4 = icmp slt i32 %.01, 1999
  br i1 %4, label %5, label %61

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds ptr, ptr %0, i64 %6
  %8 = load ptr, ptr %7, align 8
  %9 = add nsw i32 %.01, 1
  %10 = sub nsw i32 2000, %.01
  %11 = call i32 @idamax(i32 noundef %10, ptr noundef %8, i32 noundef %.01, i32 noundef 1)
  %12 = add nsw i32 %11, %.01
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds i32, ptr %1, i64 %13
  store i32 %12, ptr %14, align 4
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, ptr %8, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = fcmp une double %17, 0.000000e+00
  br i1 %18, label %19, label %59

19:                                               ; preds = %5
  %20 = icmp ne i32 %12, %.01
  br i1 %20, label %21, label %32

21:                                               ; preds = %19
  %22 = sext i32 %12 to i64
  %23 = getelementptr inbounds double, ptr %8, i64 %22
  %24 = load double, ptr %23, align 8
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds double, ptr %8, i64 %25
  %27 = load double, ptr %26, align 8
  %28 = sext i32 %12 to i64
  %29 = getelementptr inbounds double, ptr %8, i64 %28
  store double %27, ptr %29, align 8
  %30 = sext i32 %.01 to i64
  %31 = getelementptr inbounds double, ptr %8, i64 %30
  store double %24, ptr %31, align 8
  br label %32

32:                                               ; preds = %21, %19
  %33 = sext i32 %.01 to i64
  %34 = getelementptr inbounds double, ptr %8, i64 %33
  %35 = load double, ptr %34, align 8
  %36 = fdiv double -1.000000e+00, %35
  %37 = sub nsw i32 2000, %9
  call void @dscal(i32 noundef %37, double noundef %36, ptr noundef %8, i32 noundef %9, i32 noundef 1)
  br label %38

38:                                               ; preds = %56, %32
  %.0 = phi i32 [ %9, %32 ], [ %57, %56 ]
  %39 = icmp slt i32 %.0, 2000
  br i1 %39, label %40, label %58

40:                                               ; preds = %38
  %41 = sext i32 %.0 to i64
  %42 = getelementptr inbounds ptr, ptr %0, i64 %41
  %43 = load ptr, ptr %42, align 8
  %44 = sext i32 %12 to i64
  %45 = getelementptr inbounds double, ptr %43, i64 %44
  %46 = load double, ptr %45, align 8
  br i1 %20, label %47, label %55

47:                                               ; preds = %40
  %48 = sext i32 %.01 to i64
  %49 = getelementptr inbounds double, ptr %43, i64 %48
  %50 = load double, ptr %49, align 8
  %51 = sext i32 %12 to i64
  %52 = getelementptr inbounds double, ptr %43, i64 %51
  store double %50, ptr %52, align 8
  %53 = sext i32 %.01 to i64
  %54 = getelementptr inbounds double, ptr %43, i64 %53
  store double %46, ptr %54, align 8
  br label %55

55:                                               ; preds = %47, %40
  call void @daxpy(i32 noundef %37, double noundef %46, ptr noundef %8, i32 noundef %9, i32 noundef 1, ptr noundef %43, i32 noundef %9, i32 noundef 1)
  br label %56

56:                                               ; preds = %55
  %57 = add nsw i32 %.0, 1
  br label %38, !llvm.loop !18

58:                                               ; preds = %38
  br label %59

59:                                               ; preds = %58, %5
  br label %60

60:                                               ; preds = %59
  br label %3, !llvm.loop !19

61:                                               ; preds = %3
  %62 = getelementptr inbounds i32, ptr %1, i64 1999
  store i32 1999, ptr %62, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgesl(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %28, %3
  %.01 = phi i32 [ 0, %3 ], [ %23, %28 ]
  %5 = icmp slt i32 %.01, 1999
  br i1 %5, label %6, label %29

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds i32, ptr %1, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds double, ptr %2, i64 %10
  %12 = load double, ptr %11, align 8
  %13 = icmp ne i32 %9, %.01
  br i1 %13, label %14, label %22

14:                                               ; preds = %6
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds double, ptr %2, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = sext i32 %9 to i64
  %19 = getelementptr inbounds double, ptr %2, i64 %18
  store double %17, ptr %19, align 8
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds double, ptr %2, i64 %20
  store double %12, ptr %21, align 8
  br label %22

22:                                               ; preds = %14, %6
  %23 = add nsw i32 %.01, 1
  %24 = sub nsw i32 2000, %23
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds ptr, ptr %0, i64 %25
  %27 = load ptr, ptr %26, align 8
  call void @daxpy(i32 noundef %24, double noundef %12, ptr noundef %27, i32 noundef %23, i32 noundef 1, ptr noundef %2, i32 noundef %23, i32 noundef 1)
  br label %28

28:                                               ; preds = %22
  br label %4, !llvm.loop !20

29:                                               ; preds = %4
  br label %30

30:                                               ; preds = %52, %29
  %.0 = phi i32 [ 0, %29 ], [ %33, %52 ]
  %31 = icmp slt i32 %.0, 2000
  br i1 %31, label %32, label %53

32:                                               ; preds = %30
  %33 = add nsw i32 %.0, 1
  %34 = sub nsw i32 2000, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %0, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = sext i32 %34 to i64
  %39 = getelementptr inbounds double, ptr %37, i64 %38
  %40 = load double, ptr %39, align 8
  %41 = sext i32 %34 to i64
  %42 = getelementptr inbounds double, ptr %2, i64 %41
  %43 = load double, ptr %42, align 8
  %44 = fdiv double %43, %40
  store double %44, ptr %42, align 8
  %45 = sext i32 %34 to i64
  %46 = getelementptr inbounds double, ptr %2, i64 %45
  %47 = load double, ptr %46, align 8
  %48 = fneg double %47
  %49 = sext i32 %34 to i64
  %50 = getelementptr inbounds ptr, ptr %0, i64 %49
  %51 = load ptr, ptr %50, align 8
  call void @daxpy(i32 noundef %34, double noundef %48, ptr noundef %51, i32 noundef 0, i32 noundef 1, ptr noundef %2, i32 noundef 0, i32 noundef 1)
  br label %52

52:                                               ; preds = %32
  br label %30, !llvm.loop !21

53:                                               ; preds = %30
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp sgt i32 %0, 1
  br i1 %3, label %4, label %17

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %14, %4
  %.01 = phi i32 [ 1, %4 ], [ %15, %14 ]
  %6 = icmp slt i32 %.01, %0
  br i1 %6, label %7, label %16

7:                                                ; preds = %5
  %8 = getelementptr inbounds ptr, ptr %1, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str) #6
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  br label %16

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !22

16:                                               ; preds = %12, %5
  %.0 = phi i8 [ 1, %12 ], [ 0, %5 ]
  br label %17

17:                                               ; preds = %16, %2
  %.1 = phi i8 [ %.0, %16 ], [ 0, %2 ]
  %18 = call noalias ptr @malloc(i64 noundef 16000) #7
  br label %19

19:                                               ; preds = %25, %17
  %.12 = phi i32 [ 0, %17 ], [ %26, %25 ]
  %20 = icmp slt i32 %.12, 2000
  br i1 %20, label %21, label %27

21:                                               ; preds = %19
  %22 = call noalias ptr @malloc(i64 noundef 16008) #7
  %23 = sext i32 %.12 to i64
  %24 = getelementptr inbounds ptr, ptr %18, i64 %23
  store ptr %22, ptr %24, align 8
  br label %25

25:                                               ; preds = %21
  %26 = add nsw i32 %.12, 1
  br label %19, !llvm.loop !23

27:                                               ; preds = %19
  %28 = call noalias ptr @malloc(i64 noundef 16000) #7
  %29 = call noalias ptr @malloc(i64 noundef 16000) #7
  %30 = call noalias ptr @malloc(i64 noundef 8000) #7
  call void @matgen(ptr noundef %18, ptr noundef %28)
  call void @dgefa(ptr noundef %18, ptr noundef %30)
  call void @dgesl(ptr noundef %18, ptr noundef %30, ptr noundef %28)
  call void @free(ptr noundef %30) #8
  call void @free(ptr noundef %29) #8
  call void @free(ptr noundef %28) #8
  br label %31

31:                                               ; preds = %37, %27
  %.2 = phi i32 [ 0, %27 ], [ %38, %37 ]
  %32 = icmp slt i32 %.2, 2000
  br i1 %32, label %33, label %39

33:                                               ; preds = %31
  %34 = sext i32 %.2 to i64
  %35 = getelementptr inbounds ptr, ptr %18, i64 %34
  %36 = load ptr, ptr %35, align 8
  call void @free(ptr noundef %36) #8
  br label %37

37:                                               ; preds = %33
  %38 = add nsw i32 %.2, 1
  br label %31, !llvm.loop !24

39:                                               ; preds = %31
  call void @free(ptr noundef %18) #8
  %40 = trunc i8 %.1 to i1
  br i1 %40, label %41, label %44

41:                                               ; preds = %39
  %42 = load ptr, ptr @stdout, align 8
  %43 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %42, ptr noundef @.str.1, double noundef 0.000000e+00)
  br label %47

44:                                               ; preds = %39
  %45 = load ptr, ptr @stdout, align 8
  %46 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %45, ptr noundef @.str.2, double noundef 0.000000e+00)
  br label %47

47:                                               ; preds = %44, %41
  %48 = load ptr, ptr @stdout, align 8
  %49 = call i32 @fflush(ptr noundef %48)
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
  %1 = load i64, ptr @seed, align 8
  %2 = xor i64 %1, 123459876
  store i64 %2, ptr @seed, align 8
  %3 = load i64, ptr @seed, align 8
  %4 = sdiv i64 %3, 127773
  %5 = load i64, ptr @seed, align 8
  %6 = mul nsw i64 %4, 127773
  %7 = sub nsw i64 %5, %6
  %8 = mul nsw i64 16807, %7
  %9 = mul nsw i64 2836, %4
  %10 = sub nsw i64 %8, %9
  store i64 %10, ptr @seed, align 8
  %11 = load i64, ptr @seed, align 8
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %0
  %14 = load i64, ptr @seed, align 8
  %15 = add nsw i64 %14, 2147483647
  store i64 %15, ptr @seed, align 8
  br label %16

16:                                               ; preds = %13, %0
  %17 = load i64, ptr @seed, align 8
  %18 = sitofp i64 %17 to double
  %19 = fmul double 0x3E00000000200FE1, %18
  %20 = load i64, ptr @seed, align 8
  %21 = xor i64 %20, 123459876
  store i64 %21, ptr @seed, align 8
  ret double %19
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
