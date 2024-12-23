; ModuleID = '<stdin>'
source_filename = "tests/correctness/hard1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  store i32 20, ptr @m, align 16
  store i32 30, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %1 = load i32, ptr @m, align 16
  %2 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %3 = add nsw i32 %1, %2
  store i32 %3, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %4 = load i32, ptr @m, align 16
  %5 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %6 = sub nsw i32 %4, %5
  store i32 %6, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %7 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %8 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %9 = mul nsw i32 %7, %8
  store i32 %9, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  br label %10

10:                                               ; preds = %41, %0
  %.0 = phi ptr [ @m, %0 ], [ %.1, %41 ]
  %11 = load i32, ptr @m, align 16
  %12 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %45

14:                                               ; preds = %10
  %15 = load i32, ptr @m, align 16
  %16 = and i32 %15, 1
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %14
  %19 = load i32, ptr %.0, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %.0, align 4
  %21 = getelementptr inbounds i32, ptr %.0, i32 -1
  br label %26

22:                                               ; preds = %14
  %23 = load i32, ptr %.0, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %.0, align 4
  %25 = getelementptr inbounds i32, ptr %.0, i32 1
  br label %26

26:                                               ; preds = %22, %18
  %.1 = phi ptr [ %21, %18 ], [ %25, %22 ]
  %27 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %27, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %28 = load i32, ptr @m, align 16
  %29 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %30 = add nsw i32 %28, %29
  %31 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %37

33:                                               ; preds = %26
  %34 = load i32, ptr @m, align 16
  %35 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %36 = sub nsw i32 %34, %35
  store i32 %36, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %41

37:                                               ; preds = %26
  %38 = load i32, ptr @m, align 16
  %39 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %40 = mul nsw i32 %38, %39
  store i32 %40, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %41

41:                                               ; preds = %37, %33
  %42 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %43 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %44 = mul nsw i32 %42, %43
  store i32 %44, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  br label %10, !llvm.loop !6

45:                                               ; preds = %10
  %46 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  ret i32 %46
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
