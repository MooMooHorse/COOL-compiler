; ModuleID = '<stdin>'
source_filename = "tests/testing/doloop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0, ptr noalias noundef %1, ptr noalias noundef %2) #0 {
  br label %4

4:                                                ; preds = %15, %3
  %.01 = phi i32 [ 1, %3 ], [ %.1, %15 ]
  %.0 = phi i32 [ %0, %3 ], [ %11, %15 ]
  %5 = icmp sgt i32 %.01, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %4
  store i32 %0, ptr %1, align 4
  br label %7

7:                                                ; preds = %6, %4
  %8 = sdiv i32 %0, -3
  %9 = add nsw i32 1, %.01
  %10 = sub nsw i32 %8, %9
  %11 = add nsw i32 %.0, %10
  %12 = icmp sgt i32 %.01, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %13, %7
  %.1 = phi i32 [ %.01, %13 ], [ %10, %7 ]
  store i32 %0, ptr %2, align 4
  br label %15

15:                                               ; preds = %14
  %16 = icmp slt i32 0, %11
  br i1 %16, label %4, label %17, !llvm.loop !6

17:                                               ; preds = %15
  ret i32 %.1
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
