; ModuleID = '<stdin>'
source_filename = "tests/correctness/hard1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
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
  br label %while.cond

while.cond:                                       ; preds = %if.end9, %entry
  %p.0 = phi ptr [ @m, %entry ], [ %p.1, %if.end9 ]
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
  %9 = load i32, ptr %p.0, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, ptr %p.0, align 4
  %incdec.ptr = getelementptr inbounds i32, ptr %p.0, i32 -1
  br label %if.end

if.else:                                          ; preds = %while.body
  %10 = load i32, ptr %p.0, align 4
  %inc1 = add nsw i32 %10, 1
  store i32 %inc1, ptr %p.0, align 4
  %incdec.ptr2 = getelementptr inbounds i32, ptr %p.0, i32 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %p.1 = phi ptr [ %incdec.ptr, %if.then ], [ %incdec.ptr2, %if.else ]
  %11 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %11, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %12 = load i32, ptr @m, align 16
  %13 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add3 = add nsw i32 %12, %13
  %14 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp4 = icmp slt i32 %add3, %14
  br i1 %cmp4, label %if.then5, label %if.else7

if.then5:                                         ; preds = %if.end
  %15 = load i32, ptr @m, align 16
  %16 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub6 = sub nsw i32 %15, %16
  store i32 %sub6, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end9

if.else7:                                         ; preds = %if.end
  %17 = load i32, ptr @m, align 16
  %18 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %mul8 = mul nsw i32 %17, %18
  store i32 %mul8, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %19 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %20 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %mul10 = mul nsw i32 %19, %20
  store i32 %mul10, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %21 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  ret i32 %21
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git ce919e92afed6522fae11fdf69158b4b9ead2296)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
