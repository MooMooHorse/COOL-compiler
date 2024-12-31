; ModuleID = '<stdin>'
source_filename = "tests/correctness/hard2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @changeall(ptr noundef %p) #0 {
entry:
  %p.addr = alloca ptr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 0
  %1 = load i32, ptr %arrayidx, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, ptr %arrayidx, align 4
  %2 = load ptr, ptr %p.addr, align 8
  %arrayidx1 = getelementptr inbounds i32, ptr %2, i64 1
  %3 = load i32, ptr %arrayidx1, align 4
  %inc2 = add nsw i32 %3, 1
  store i32 %inc2, ptr %arrayidx1, align 4
  %4 = load ptr, ptr %p.addr, align 8
  %arrayidx3 = getelementptr inbounds i32, ptr %4, i64 2
  %5 = load i32, ptr %arrayidx3, align 4
  %inc4 = add nsw i32 %5, 1
  store i32 %inc4, ptr %arrayidx3, align 4
  %6 = load ptr, ptr %p.addr, align 8
  %arrayidx5 = getelementptr inbounds i32, ptr %6, i64 3
  %7 = load i32, ptr %arrayidx5, align 4
  %inc6 = add nsw i32 %7, 1
  store i32 %inc6, ptr %arrayidx5, align 4
  %8 = load ptr, ptr %p.addr, align 8
  %arrayidx7 = getelementptr inbounds i32, ptr %8, i64 1
  %9 = load i32, ptr %arrayidx7, align 4
  ret i32 %9
}

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

while.cond:                                       ; preds = %if.end, %entry
  %6 = load i32, ptr @m, align 16
  %7 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %8, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %9 = load ptr, ptr %p, align 8
  %call = call i32 @changeall(ptr noundef %9)
  %10 = load i32, ptr @m, align 16
  %11 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add1 = add nsw i32 %10, %11
  %12 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %cmp2 = icmp slt i32 %add1, %12
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %13 = load i32, ptr @m, align 16
  %14 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub3 = sub nsw i32 %13, %14
  store i32 %sub3, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %15 = load i32, ptr @m, align 16
  %16 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %mul4 = mul nsw i32 %15, %16
  store i32 %mul4, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %17 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %18 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %mul5 = mul nsw i32 %17, %18
  store i32 %mul5, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %19 = load i32, ptr @m, align 16
  %inc = add nsw i32 %19, 1
  store i32 %inc, ptr @m, align 16
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %20 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  ret i32 %20
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
