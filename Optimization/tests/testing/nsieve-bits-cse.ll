; ModuleID = '<stdin>'
source_filename = "tests/testing/nsieve-bits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = udiv i32 40960000, 8
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 4
  %6 = call noalias ptr @malloc(i64 noundef %5) #5
  %7 = icmp ne ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  br label %68

9:                                                ; preds = %2
  br label %10

10:                                               ; preds = %65, %9
  %.03 = phi i32 [ 0, %9 ], [ %66, %65 ]
  %11 = icmp ule i32 %.03, 2
  br i1 %11, label %12, label %67

12:                                               ; preds = %10
  %13 = lshr i32 40960000, %.03
  %14 = udiv i32 %13, 8
  %15 = zext i32 %14 to i64
  %16 = add i64 %15, 4
  call void @llvm.memset.p0.i64(ptr align 4 %6, i8 -1, i64 %16, i1 false)
  br label %17

17:                                               ; preds = %61, %12
  %.04 = phi i32 [ 2, %12 ], [ %62, %61 ]
  %.01 = phi i32 [ 0, %12 ], [ %.1, %61 ]
  %18 = icmp ule i32 %.04, %13
  br i1 %18, label %19, label %63

19:                                               ; preds = %17
  %20 = zext i32 %.04 to i64
  %21 = udiv i64 %20, 32
  %22 = getelementptr inbounds i32, ptr %6, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = zext i32 %.04 to i64
  %25 = urem i64 %24, 32
  %26 = trunc i64 %25 to i32
  %27 = shl i32 1, %26
  %28 = and i32 %23, %27
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %60

30:                                               ; preds = %19
  %31 = add i32 %.01, 1
  %32 = add i32 %.04, %.04
  br label %33

33:                                               ; preds = %57, %30
  %.02 = phi i32 [ %32, %30 ], [ %58, %57 ]
  %34 = icmp ule i32 %.02, %13
  br i1 %34, label %35, label %59

35:                                               ; preds = %33
  %36 = zext i32 %.02 to i64
  %37 = udiv i64 %36, 32
  %38 = getelementptr inbounds i32, ptr %6, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = zext i32 %.02 to i64
  %41 = urem i64 %40, 32
  %42 = trunc i64 %41 to i32
  %43 = shl i32 1, %42
  %44 = and i32 %39, %43
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %56

46:                                               ; preds = %35
  %47 = zext i32 %.02 to i64
  %48 = urem i64 %47, 32
  %49 = trunc i64 %48 to i32
  %50 = shl i32 1, %49
  %51 = zext i32 %.02 to i64
  %52 = udiv i64 %51, 32
  %53 = getelementptr inbounds i32, ptr %6, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = xor i32 %54, %50
  store i32 %55, ptr %53, align 4
  br label %56

56:                                               ; preds = %46, %35
  br label %57

57:                                               ; preds = %56
  %58 = add i32 %.02, %.04
  br label %33, !llvm.loop !6

59:                                               ; preds = %33
  br label %60

60:                                               ; preds = %59, %19
  %.1 = phi i32 [ %31, %59 ], [ %.01, %19 ]
  br label %61

61:                                               ; preds = %60
  %62 = add i32 %.04, 1
  br label %17, !llvm.loop !8

63:                                               ; preds = %17
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13, i32 noundef %.01)
  br label %65

65:                                               ; preds = %63
  %66 = add i32 %.03, 1
  br label %10, !llvm.loop !9

67:                                               ; preds = %10
  call void @free(ptr noundef %6) #6
  br label %68

68:                                               ; preds = %67, %8
  %.0 = phi i32 [ 0, %67 ], [ 1, %8 ]
  ret i32 %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

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
