; ModuleID = '<stdin>'
source_filename = "tests/correctness/hard2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @changeall(ptr noundef %p) #0 {
entry:
  %arrayidx = getelementptr inbounds i32, ptr %p, i64 0
  %0 = load i32, ptr %arrayidx, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i32, ptr %p, i64 1
  %1 = load i32, ptr %arrayidx1, align 4
  %inc2 = add nsw i32 %1, 1
  store i32 %inc2, ptr %arrayidx1, align 4
  %arrayidx3 = getelementptr inbounds i32, ptr %p, i64 2
  %2 = load i32, ptr %arrayidx3, align 4
  %inc4 = add nsw i32 %2, 1
  store i32 %inc4, ptr %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds i32, ptr %p, i64 3
  %3 = load i32, ptr %arrayidx5, align 4
  %inc6 = add nsw i32 %3, 1
  store i32 %inc6, ptr %arrayidx5, align 4
  %4 = load i32, ptr %arrayidx1, align 4
  ret i32 %4
}

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

while.cond:                                       ; preds = %if.end, %entry
  %6 = load i32, ptr @m, align 16
  %7 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %8, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %call = call i32 @changeall(ptr noundef @m)
  %9 = load i32, ptr @m, align 16
  %10 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add1 = add nsw i32 %9, %10
  %11 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp2 = icmp slt i32 %add1, %11
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %12 = load i32, ptr @m, align 16
  %13 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub3 = sub nsw i32 %12, %13
  store i32 %sub3, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %14 = load i32, ptr @m, align 16
  %15 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %mul4 = mul nsw i32 %14, %15
  store i32 %mul4, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %16 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %17 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %mul5 = mul nsw i32 %16, %17
  store i32 %mul5, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %18 = load i32, ptr @m, align 16
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr @m, align 16
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %19 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  ret i32 %19
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
