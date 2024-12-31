; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 20, ptr %x, align 4
  store i32 30, ptr %y, align 4
  %0 = load i32, ptr %x, align 4
  %1 = load i32, ptr %y, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, ptr %a, align 4
  %2 = load i32, ptr %x, align 4
  %3 = load i32, ptr %y, align 4
  %sub = sub nsw i32 %2, %3
  store i32 %sub, ptr %b, align 4
  %4 = load i32, ptr %x, align 4
  %5 = load i32, ptr %y, align 4
  %mul = mul nsw i32 %4, %5
  store i32 %mul, ptr %c, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %6 = load i32, ptr %x, align 4
  %7 = load i32, ptr %y, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, ptr %x, align 4
  %9 = load i32, ptr %y, align 4
  %add1 = add nsw i32 %8, %9
  %10 = load i32, ptr %a, align 4
  %cmp2 = icmp slt i32 %add1, %10
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %11 = load i32, ptr %x, align 4
  %12 = load i32, ptr %y, align 4
  %sub3 = sub nsw i32 %11, %12
  store i32 %sub3, ptr %c, align 4
  %13 = load i32, ptr %x, align 4
  %14 = load i32, ptr %y, align 4
  %sub4 = sub nsw i32 %13, %14
  store i32 %sub4, ptr %b, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %15 = load i32, ptr %x, align 4
  %16 = load i32, ptr %y, align 4
  %mul5 = mul nsw i32 %15, %16
  store i32 %mul5, ptr %c, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %y, align 4
  %mul6 = mul nsw i32 %17, %18
  store i32 %mul6, ptr %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %19 = load i32, ptr %x, align 4
  %add7 = add nsw i32 %19, 1
  store i32 %add7, ptr %x, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %20 = load i32, ptr %b, align 4
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
