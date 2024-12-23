; ModuleID = '<stdin>'
source_filename = "tests/testing/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = zext i32 %0 to i64
  %8 = zext i32 %1 to i64
  %9 = zext i32 %1 to i64
  %10 = zext i32 %2 to i64
  %11 = zext i32 %0 to i64
  %12 = zext i32 %2 to i64
  br label %13

13:                                               ; preds = %53, %6
  %.02 = phi i32 [ 0, %6 ], [ %54, %53 ]
  %14 = icmp slt i32 %.02, %0
  br i1 %14, label %15, label %55

15:                                               ; preds = %13
  br label %16

16:                                               ; preds = %50, %15
  %.01 = phi i32 [ 0, %15 ], [ %51, %50 ]
  %17 = icmp slt i32 %.01, %2
  br i1 %17, label %18, label %52

18:                                               ; preds = %16
  %19 = sext i32 %.02 to i64
  %20 = mul nsw i64 %19, %12
  %21 = getelementptr inbounds i32, ptr %5, i64 %20
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds i32, ptr %21, i64 %22
  store i32 0, ptr %23, align 4
  br label %24

24:                                               ; preds = %47, %18
  %.0 = phi i32 [ 0, %18 ], [ %48, %47 ]
  %25 = icmp slt i32 %.0, %1
  br i1 %25, label %26, label %49

26:                                               ; preds = %24
  %27 = sext i32 %.02 to i64
  %28 = mul nsw i64 %27, %8
  %29 = getelementptr inbounds i32, ptr %3, i64 %28
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds i32, ptr %29, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %.0 to i64
  %34 = mul nsw i64 %33, %10
  %35 = getelementptr inbounds i32, ptr %4, i64 %34
  %36 = sext i32 %.01 to i64
  %37 = getelementptr inbounds i32, ptr %35, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = mul nsw i32 %32, %38
  %40 = sext i32 %.02 to i64
  %41 = mul nsw i64 %40, %12
  %42 = getelementptr inbounds i32, ptr %5, i64 %41
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds i32, ptr %42, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %45, %39
  store i32 %46, ptr %44, align 4
  br label %47

47:                                               ; preds = %26
  %48 = add nsw i32 %.0, 1
  br label %24, !llvm.loop !6

49:                                               ; preds = %24
  br label %50

50:                                               ; preds = %49
  %51 = add nsw i32 %.01, 1
  br label %16, !llvm.loop !8

52:                                               ; preds = %16
  br label %53

53:                                               ; preds = %52
  %54 = add nsw i32 %.02, 1
  br label %13, !llvm.loop !9

55:                                               ; preds = %13
  ret void
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
