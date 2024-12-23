; ModuleID = '<stdin>'
source_filename = "tests/correctness/licm5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @do_loop1(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = load i32, ptr %2, align 4
  %5 = add nsw i32 %4, %1
  %6 = icmp slt i32 %5, 0
  br label %7

7:                                                ; preds = %8, %3
  br label %8

8:                                                ; preds = %7
  br i1 %6, label %7, label %9, !llvm.loop !6

9:                                                ; preds = %8
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @do_loop2(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  br label %5

5:                                                ; preds = %10, %4
  %6 = load i32, ptr %2, align 4
  %7 = add nsw i32 %6, %1
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, %1
  br label %10

10:                                               ; preds = %5
  %11 = icmp slt i32 %7, 0
  br i1 %11, label %5, label %12, !llvm.loop !8

12:                                               ; preds = %10
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @do_loop3(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  store i32 2, ptr %2, align 4
  %4 = icmp slt i32 %0, 0
  br label %5

5:                                                ; preds = %6, %3
  br label %6

6:                                                ; preds = %5
  br i1 %4, label %5, label %7, !llvm.loop !9

7:                                                ; preds = %6
  ret i32 %0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 2, ptr %1, align 4
  store i32 3, ptr %2, align 4
  %3 = call i32 @do_loop1(i32 noundef 2, i32 noundef 3, ptr noundef %1)
  %4 = call i32 @do_loop2(i32 noundef 3, i32 noundef 2, ptr noundef %2, ptr noundef %1)
  %5 = add nsw i32 %3, %4
  %6 = call i32 @do_loop3(i32 noundef 1, i32 noundef 1, ptr noundef %1)
  %7 = add nsw i32 %5, %6
  ret i32 %7
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
