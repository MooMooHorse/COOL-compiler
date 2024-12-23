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
  %16 = sext i32 %.02 to i64
  %17 = sext i32 %.02 to i64
  %18 = sext i32 %.02 to i64
  %19 = mul nsw i64 %16, %12
  %20 = mul nsw i64 %17, %8
  %21 = mul nsw i64 %18, %12
  %22 = getelementptr inbounds i32, ptr %5, i64 %19
  %23 = getelementptr inbounds i32, ptr %3, i64 %20
  %24 = getelementptr inbounds i32, ptr %5, i64 %21
  br label %25

25:                                               ; preds = %50, %15
  %.01 = phi i32 [ 0, %15 ], [ %51, %50 ]
  %26 = icmp slt i32 %.01, %2
  br i1 %26, label %27, label %52

27:                                               ; preds = %25
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds i32, ptr %22, i64 %28
  store i32 0, ptr %29, align 4
  %30 = sext i32 %.01 to i64
  %31 = sext i32 %.01 to i64
  %32 = getelementptr inbounds i32, ptr %24, i64 %31
  br label %33

33:                                               ; preds = %47, %27
  %.0 = phi i32 [ 0, %27 ], [ %48, %47 ]
  %34 = icmp slt i32 %.0, %1
  br i1 %34, label %35, label %49

35:                                               ; preds = %33
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds i32, ptr %23, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = sext i32 %.0 to i64
  %40 = mul nsw i64 %39, %10
  %41 = getelementptr inbounds i32, ptr %4, i64 %40
  %42 = getelementptr inbounds i32, ptr %41, i64 %30
  %43 = load i32, ptr %42, align 4
  %44 = mul nsw i32 %38, %43
  %45 = load i32, ptr %32, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, ptr %32, align 4
  br label %47

47:                                               ; preds = %35
  %48 = add nsw i32 %.0, 1
  br label %33, !llvm.loop !6

49:                                               ; preds = %33
  br label %50

50:                                               ; preds = %49
  %51 = add nsw i32 %.01, 1
  br label %25, !llvm.loop !8

52:                                               ; preds = %25
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
