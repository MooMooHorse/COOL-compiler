; ModuleID = '<stdin>'
source_filename = "tests/testing/puzzle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@next = internal global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand() #0 {
  %1 = load i64, ptr @next, align 8
  %2 = mul i64 %1, 1103515245
  %3 = add i64 %2, 12345
  store i64 %3, ptr @next, align 8
  %4 = load i64, ptr @next, align 8
  %5 = udiv i64 %4, 65536
  %6 = trunc i64 %5 to i32
  %7 = urem i32 %6, 32767
  %8 = add i32 %7, 1
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @srand(i32 noundef %0) #0 {
  %2 = zext i32 %0 to i64
  store i64 %2, ptr @next, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @randInt(i32 noundef %0, i32 noundef %1) #0 {
  %3 = sub nsw i32 %1, %0
  %4 = add nsw i32 %3, 1
  %5 = sitofp i32 %4 to double
  %6 = call i32 @rand() #4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 3.276800e+04
  %9 = fmul double %5, %8
  %10 = fptosi double %9 to i32
  %11 = icmp eq i32 %10, %4
  br i1 %11, label %12, label %15

12:                                               ; preds = %2
  %13 = add nsw i32 %10, %0
  %14 = sub nsw i32 %13, 1
  br label %17

15:                                               ; preds = %2
  %16 = add nsw i32 %10, %0
  br label %17

17:                                               ; preds = %15, %12
  %18 = phi i32 [ %14, %12 ], [ %16, %15 ]
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle(ptr noundef %0, i32 noundef %1) #0 {
  %3 = sub nsw i32 %1, 1
  %4 = sext i32 %3 to i64
  br label %5

5:                                                ; preds = %29, %2
  %.0 = phi i64 [ %4, %2 ], [ %30, %29 ]
  %6 = icmp ugt i64 %.0, 0
  br i1 %6, label %7, label %31

7:                                                ; preds = %5
  %8 = add i64 %.0, 1
  %9 = uitofp i64 %8 to double
  %10 = call i32 @rand() #4
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 3.276800e+04
  %13 = fmul double %9, %12
  %14 = fptosi double %13 to i32
  %15 = sext i32 %14 to i64
  %16 = add i64 %.0, 1
  %17 = icmp eq i64 %15, %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %7
  %19 = sub i64 %15, 1
  br label %21

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20, %18
  %22 = phi i64 [ %19, %18 ], [ %15, %20 ]
  %23 = getelementptr inbounds i32, ptr %0, i64 %.0
  %24 = load i32, ptr %23, align 4
  %25 = getelementptr inbounds i32, ptr %0, i64 %22
  %26 = load i32, ptr %25, align 4
  %27 = getelementptr inbounds i32, ptr %0, i64 %.0
  store i32 %26, ptr %27, align 4
  %28 = getelementptr inbounds i32, ptr %0, i64 %22
  store i32 %24, ptr %28, align 4
  br label %29

29:                                               ; preds = %21
  %30 = add i64 %.0, -1
  br label %5, !llvm.loop !6

31:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createRandomArray(i32 noundef %0) #0 {
  %2 = add nsw i32 %0, 1
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 4
  %5 = call noalias ptr @malloc(i64 noundef %4) #5
  br label %6

6:                                                ; preds = %11, %1
  %.0 = phi i32 [ 0, %1 ], [ %12, %11 ]
  %7 = icmp slt i32 %.0, %2
  br i1 %7, label %8, label %13

8:                                                ; preds = %6
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds i32, ptr %5, i64 %9
  store i32 %.0, ptr %10, align 4
  br label %11

11:                                               ; preds = %8
  %12 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

13:                                               ; preds = %6
  %14 = call i32 @randInt(i32 noundef 1, i32 noundef %0)
  %15 = getelementptr inbounds i32, ptr %5, i64 0
  store i32 %14, ptr %15, align 4
  call void @shuffle(ptr noundef %5, i32 noundef %2)
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @findDuplicate(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %12, %2
  %.01 = phi i32 [ 0, %2 ], [ %13, %12 ]
  %.0 = phi i32 [ 0, %2 ], [ %11, %12 ]
  %4 = icmp slt i32 %.01, %1
  br i1 %4, label %5, label %14

5:                                                ; preds = %3
  %6 = add nsw i32 %.01, 1
  %7 = xor i32 %.0, %6
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds i32, ptr %0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = xor i32 %7, %10
  br label %12

12:                                               ; preds = %5
  %13 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !9

14:                                               ; preds = %3
  %15 = xor i32 %.0, %1
  ret i32 %15
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @srand(i32 noundef 1) #4
  br label %1

1:                                                ; preds = %13, %0
  %.01 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %.0 = phi i32 [ undef, %0 ], [ %.1, %13 ]
  %2 = icmp slt i32 %.01, 5
  br i1 %2, label %3, label %15

3:                                                ; preds = %1
  %4 = call ptr @createRandomArray(i32 noundef 500000)
  br label %5

5:                                                ; preds = %9, %3
  %.02 = phi i32 [ 0, %3 ], [ %10, %9 ]
  %.1 = phi i32 [ %.0, %3 ], [ %8, %9 ]
  %6 = icmp slt i32 %.02, 200
  br i1 %6, label %7, label %11

7:                                                ; preds = %5
  %8 = call i32 @findDuplicate(ptr noundef %4, i32 noundef 500001)
  br label %9

9:                                                ; preds = %7
  %10 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !10

11:                                               ; preds = %5
  call void @free(ptr noundef %4) #4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %.1)
  br label %13

13:                                               ; preds = %11
  %14 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !11

15:                                               ; preds = %1
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
