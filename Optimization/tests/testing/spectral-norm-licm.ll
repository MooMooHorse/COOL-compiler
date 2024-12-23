; ModuleID = '<stdin>'
source_filename = "tests/testing/spectral-norm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @eval_A(i32 noundef %0, i32 noundef %1) #0 {
  %3 = add nsw i32 %0, %1
  %4 = add nsw i32 %0, %1
  %5 = add nsw i32 %4, 1
  %6 = mul nsw i32 %3, %5
  %7 = sdiv i32 %6, 2
  %8 = add nsw i32 %7, %0
  %9 = add nsw i32 %8, 1
  %10 = sitofp i32 %9 to double
  %11 = fdiv double 1.000000e+00, %10
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_A_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %23, %3
  %.01 = phi i32 [ 0, %3 ], [ %24, %23 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds double, ptr %2, i64 %7
  store double 0.000000e+00, ptr %8, align 8
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds double, ptr %2, i64 %9
  br label %11

11:                                               ; preds = %20, %6
  %.0 = phi i32 [ 0, %6 ], [ %21, %20 ]
  %12 = icmp slt i32 %.0, %0
  br i1 %12, label %13, label %22

13:                                               ; preds = %11
  %14 = call double @eval_A(i32 noundef %.01, i32 noundef %.0)
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds double, ptr %1, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = load double, ptr %10, align 8
  %19 = call double @llvm.fmuladd.f64(double %14, double %17, double %18)
  store double %19, ptr %10, align 8
  br label %20

20:                                               ; preds = %13
  %21 = add nsw i32 %.0, 1
  br label %11, !llvm.loop !6

22:                                               ; preds = %11
  br label %23

23:                                               ; preds = %22
  %24 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

25:                                               ; preds = %4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_At_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %23, %3
  %.01 = phi i32 [ 0, %3 ], [ %24, %23 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %25

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds double, ptr %2, i64 %7
  store double 0.000000e+00, ptr %8, align 8
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds double, ptr %2, i64 %9
  br label %11

11:                                               ; preds = %20, %6
  %.0 = phi i32 [ 0, %6 ], [ %21, %20 ]
  %12 = icmp slt i32 %.0, %0
  br i1 %12, label %13, label %22

13:                                               ; preds = %11
  %14 = call double @eval_A(i32 noundef %.0, i32 noundef %.01)
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds double, ptr %1, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = load double, ptr %10, align 8
  %19 = call double @llvm.fmuladd.f64(double %14, double %17, double %18)
  store double %19, ptr %10, align 8
  br label %20

20:                                               ; preds = %13
  %21 = add nsw i32 %.0, 1
  br label %11, !llvm.loop !9

22:                                               ; preds = %11
  br label %23

23:                                               ; preds = %22
  %24 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !10

25:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_AtA_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = zext i32 %0 to i64
  %5 = call ptr @llvm.stacksave()
  %6 = alloca double, i64 %4, align 16
  call void @eval_A_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %6)
  call void @eval_At_times_u(i32 noundef %0, ptr noundef %6, ptr noundef %2)
  call void @llvm.stackrestore(ptr %5)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %4, label %8

4:                                                ; preds = %2
  %5 = getelementptr inbounds ptr, ptr %1, i64 1
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 @atoi(ptr noundef %6) #6
  br label %9

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %8, %4
  %10 = phi i32 [ %7, %4 ], [ 2000, %8 ]
  %11 = zext i32 %10 to i64
  %12 = call ptr @llvm.stacksave()
  %13 = alloca double, i64 %11, align 16
  %14 = zext i32 %10 to i64
  %15 = alloca double, i64 %14, align 16
  br label %16

16:                                               ; preds = %21, %9
  %.02 = phi i32 [ 0, %9 ], [ %22, %21 ]
  %17 = icmp slt i32 %.02, %10
  br i1 %17, label %18, label %23

18:                                               ; preds = %16
  %19 = sext i32 %.02 to i64
  %20 = getelementptr inbounds double, ptr %13, i64 %19
  store double 1.000000e+00, ptr %20, align 8
  br label %21

21:                                               ; preds = %18
  %22 = add nsw i32 %.02, 1
  br label %16, !llvm.loop !11

23:                                               ; preds = %16
  br label %24

24:                                               ; preds = %27, %23
  %.1 = phi i32 [ 0, %23 ], [ %28, %27 ]
  %25 = icmp slt i32 %.1, 10
  br i1 %25, label %26, label %29

26:                                               ; preds = %24
  call void @eval_AtA_times_u(i32 noundef %10, ptr noundef %13, ptr noundef %15)
  call void @eval_AtA_times_u(i32 noundef %10, ptr noundef %15, ptr noundef %13)
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.1, 1
  br label %24, !llvm.loop !12

29:                                               ; preds = %24
  br label %30

30:                                               ; preds = %47, %29
  %.2 = phi i32 [ 0, %29 ], [ %48, %47 ]
  %.01 = phi double [ 0.000000e+00, %29 ], [ %39, %47 ]
  %.0 = phi double [ 0.000000e+00, %29 ], [ %46, %47 ]
  %31 = icmp slt i32 %.2, %10
  br i1 %31, label %32, label %49

32:                                               ; preds = %30
  %33 = sext i32 %.2 to i64
  %34 = getelementptr inbounds double, ptr %13, i64 %33
  %35 = load double, ptr %34, align 8
  %36 = sext i32 %.2 to i64
  %37 = getelementptr inbounds double, ptr %15, i64 %36
  %38 = load double, ptr %37, align 8
  %39 = call double @llvm.fmuladd.f64(double %35, double %38, double %.01)
  %40 = sext i32 %.2 to i64
  %41 = getelementptr inbounds double, ptr %15, i64 %40
  %42 = load double, ptr %41, align 8
  %43 = sext i32 %.2 to i64
  %44 = getelementptr inbounds double, ptr %15, i64 %43
  %45 = load double, ptr %44, align 8
  %46 = call double @llvm.fmuladd.f64(double %42, double %45, double %.0)
  br label %47

47:                                               ; preds = %32
  %48 = add nsw i32 %.2, 1
  br label %30, !llvm.loop !13

49:                                               ; preds = %30
  %50 = fdiv double %.01, %.0
  %51 = call double @sqrt(double noundef %50) #7
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %51)
  call void @llvm.stackrestore(ptr %12)
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
