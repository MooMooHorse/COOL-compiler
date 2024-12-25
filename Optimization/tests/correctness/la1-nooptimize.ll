; ModuleID = '<stdin>'
source_filename = "tests/correctness/la1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %p) #0 {
entry:
  %p.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 %p, ptr %p.addr, align 4
  store i32 5, ptr %x, align 4
  %0 = load i32, ptr %x, align 4
  %1 = load i32, ptr %x, align 4
  %mul = mul nsw i32 %0, %1
  store i32 %mul, ptr %y, align 4
  %2 = load i32, ptr %x, align 4
  %3 = load i32, ptr %x, align 4
  %mul1 = mul nsw i32 %2, %3
  %4 = load i32, ptr %x, align 4
  %add = add nsw i32 %mul1, %4
  %5 = load i32, ptr %y, align 4
  %sub = sub nsw i32 %add, %5
  store i32 %sub, ptr %z, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond12, %entry
  br label %while.cond

while.cond:                                       ; preds = %do.end, %do.body
  %6 = load i32, ptr %x, align 4
  %7 = load i32, ptr %y, align 4
  %add2 = add nsw i32 %6, %7
  %8 = load i32, ptr %z, align 4
  %cmp = icmp slt i32 %add2, %8
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32, ptr %x, align 4
  %add3 = add nsw i32 %9, 1
  store i32 %add3, ptr %x, align 4
  %10 = load i32, ptr %y, align 4
  %add4 = add nsw i32 %10, 1
  store i32 %add4, ptr %y, align 4
  br label %do.body5

do.body5:                                         ; preds = %do.cond, %while.body
  %11 = load i32, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %mul6 = mul nsw i32 %11, %12
  store i32 %mul6, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %cmp7 = icmp sgt i32 %13, 10
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %do.body5
  %14 = load i32, ptr %y, align 4
  %15 = load i32, ptr %y, align 4
  %mul8 = mul nsw i32 %14, %15
  store i32 %mul8, ptr %y, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body5
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %16 = load i32, ptr %x, align 4
  %17 = load i32, ptr %p.addr, align 4
  %18 = load i32, ptr %p.addr, align 4
  %mul9 = mul nsw i32 %17, %18
  %cmp10 = icmp slt i32 %16, %mul9
  br i1 %cmp10, label %do.body5, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %19 = load i32, ptr %z, align 4
  %add11 = add nsw i32 %19, 1
  store i32 %add11, ptr %z, align 4
  br label %do.cond12

do.cond12:                                        ; preds = %while.end
  %20 = load i32, ptr %x, align 4
  %21 = load i32, ptr %p.addr, align 4
  %cmp13 = icmp slt i32 %20, %21
  br i1 %cmp13, label %do.body, label %do.end14, !llvm.loop !9

do.end14:                                         ; preds = %do.cond12
  %22 = load i32, ptr %z, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call i32 @crazy_loops(i32 noundef 1000)
  ret i32 %call
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
