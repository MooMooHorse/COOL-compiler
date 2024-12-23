; ModuleID = '<stdin>'
source_filename = "tests/testing/one-iter.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @foo(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %12, %1
  %.0 = phi i32 [ 1, %1 ], [ %.1, %12 ]
  %3 = add nsw i32 %.0, 1
  %4 = call i32 @rand() #2
  %5 = srem i32 %4, 4
  %6 = add nsw i32 1, %3
  %7 = sub nsw i32 %5, %6
  %8 = add nsw i32 %7, %0
  %9 = icmp sgt i32 %3, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  br label %11

11:                                               ; preds = %10, %2
  %.1 = phi i32 [ %3, %10 ], [ %8, %2 ]
  br label %12

12:                                               ; preds = %11
  %13 = icmp slt i32 %3, 2
  br i1 %13, label %2, label %14, !llvm.loop !6

14:                                               ; preds = %12
  ret i32 %.1
}

; Function Attrs: nounwind
declare i32 @rand() #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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
