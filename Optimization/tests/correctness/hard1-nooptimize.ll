; ModuleID = '<stdin>'
source_filename = "tests/correctness/hard1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %p = alloca ptr, align 8
  store i32 0, ptr %retval, align 4
  store i32 20, ptr @m, align 16
  store i32 30, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %0 = load i32, ptr @m, align 16
  %1 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add = add nsw i32 %0, %1
  store i32 %add, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %2 = load i32, ptr @m, align 16
  %3 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub = sub nsw i32 %2, %3
  store i32 %sub, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %4 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %5 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %mul = mul nsw i32 %4, %5
  store i32 %mul, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  store ptr @m, ptr %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end9, %entry
  %6 = load i32, ptr @m, align 16
  %7 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, ptr @m, align 16
  %and = and i32 %8, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %9 = load ptr, ptr %p, align 8
  %10 = load i32, ptr %9, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, ptr %9, align 4
  %11 = load ptr, ptr %p, align 8
  %incdec.ptr = getelementptr inbounds i32, ptr %11, i32 -1
  store ptr %incdec.ptr, ptr %p, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %12 = load ptr, ptr %p, align 8
  %13 = load i32, ptr %12, align 4
  %inc1 = add nsw i32 %13, 1
  store i32 %inc1, ptr %12, align 4
  %14 = load ptr, ptr %p, align 8
  %incdec.ptr2 = getelementptr inbounds i32, ptr %14, i32 1
  store ptr %incdec.ptr2, ptr %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %15, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %16 = load i32, ptr @m, align 16
  %17 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add3 = add nsw i32 %16, %17
  %18 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp4 = icmp slt i32 %add3, %18
  br i1 %cmp4, label %if.then5, label %if.else7

if.then5:                                         ; preds = %if.end
  %19 = load i32, ptr @m, align 16
  %20 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub6 = sub nsw i32 %19, %20
  store i32 %sub6, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end9

if.else7:                                         ; preds = %if.end
  %21 = load i32, ptr @m, align 16
  %22 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %mul8 = mul nsw i32 %21, %22
  store i32 %mul8, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %23 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %24 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %mul10 = mul nsw i32 %23, %24
  store i32 %mul10, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %25 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  ret i32 %25
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
