; ModuleID = '<stdin>'
source_filename = "tests/correctness/la2.c"
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
  store i32 50, ptr %x, align 4
  br label %do.body15

do.body15:                                        ; preds = %do.cond34, %do.end14
  br label %while.cond16

while.cond16:                                     ; preds = %do.end31, %do.body15
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %y, align 4
  %add17 = add nsw i32 %22, %23
  %24 = load i32, ptr %z, align 4
  %cmp18 = icmp slt i32 %add17, %24
  br i1 %cmp18, label %while.body19, label %while.end32

while.body19:                                     ; preds = %while.cond16
  %25 = load i32, ptr %x, align 4
  %add20 = add nsw i32 %25, 1
  store i32 %add20, ptr %x, align 4
  %26 = load i32, ptr %y, align 4
  %add21 = add nsw i32 %26, 1
  store i32 %add21, ptr %y, align 4
  br label %do.body22

do.body22:                                        ; preds = %do.cond28, %while.body19
  %27 = load i32, ptr %x, align 4
  %28 = load i32, ptr %x, align 4
  %mul23 = mul nsw i32 %27, %28
  store i32 %mul23, ptr %x, align 4
  %29 = load i32, ptr %x, align 4
  %cmp24 = icmp sgt i32 %29, 10
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %do.body22
  %30 = load i32, ptr %y, align 4
  %31 = load i32, ptr %y, align 4
  %mul26 = mul nsw i32 %30, %31
  store i32 %mul26, ptr %y, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %do.body22
  br label %do.cond28

do.cond28:                                        ; preds = %if.end27
  %32 = load i32, ptr %x, align 4
  %33 = load i32, ptr %p.addr, align 4
  %34 = load i32, ptr %p.addr, align 4
  %mul29 = mul nsw i32 %33, %34
  %cmp30 = icmp slt i32 %32, %mul29
  br i1 %cmp30, label %do.body22, label %do.end31, !llvm.loop !10

do.end31:                                         ; preds = %do.cond28
  br label %while.cond16, !llvm.loop !11

while.end32:                                      ; preds = %while.cond16
  %35 = load i32, ptr %z, align 4
  %add33 = add nsw i32 %35, 1
  store i32 %add33, ptr %z, align 4
  br label %do.cond34

do.cond34:                                        ; preds = %while.end32
  %36 = load i32, ptr %x, align 4
  %37 = load i32, ptr %p.addr, align 4
  %cmp35 = icmp slt i32 %36, %37
  br i1 %cmp35, label %do.body15, label %do.end36, !llvm.loop !12

do.end36:                                         ; preds = %do.cond34
  %38 = load i32, ptr %p.addr, align 4
  store i32 %38, ptr %x, align 4
  br label %do.body37

do.body37:                                        ; preds = %do.cond56, %do.end36
  br label %while.cond38

while.cond38:                                     ; preds = %do.end53, %do.body37
  %39 = load i32, ptr %x, align 4
  %40 = load i32, ptr %y, align 4
  %add39 = add nsw i32 %39, %40
  %41 = load i32, ptr %z, align 4
  %cmp40 = icmp slt i32 %add39, %41
  br i1 %cmp40, label %while.body41, label %while.end54

while.body41:                                     ; preds = %while.cond38
  %42 = load i32, ptr %x, align 4
  %add42 = add nsw i32 %42, 1
  store i32 %add42, ptr %x, align 4
  %43 = load i32, ptr %y, align 4
  %add43 = add nsw i32 %43, 1
  store i32 %add43, ptr %y, align 4
  br label %do.body44

do.body44:                                        ; preds = %do.cond50, %while.body41
  %44 = load i32, ptr %x, align 4
  %45 = load i32, ptr %x, align 4
  %mul45 = mul nsw i32 %44, %45
  store i32 %mul45, ptr %x, align 4
  %46 = load i32, ptr %x, align 4
  %cmp46 = icmp sgt i32 %46, 10
  br i1 %cmp46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %do.body44
  %47 = load i32, ptr %y, align 4
  %48 = load i32, ptr %y, align 4
  %mul48 = mul nsw i32 %47, %48
  store i32 %mul48, ptr %y, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %do.body44
  br label %do.cond50

do.cond50:                                        ; preds = %if.end49
  %49 = load i32, ptr %x, align 4
  %50 = load i32, ptr %p.addr, align 4
  %51 = load i32, ptr %p.addr, align 4
  %mul51 = mul nsw i32 %50, %51
  %cmp52 = icmp slt i32 %49, %mul51
  br i1 %cmp52, label %do.body44, label %do.end53, !llvm.loop !13

do.end53:                                         ; preds = %do.cond50
  br label %while.cond38, !llvm.loop !14

while.end54:                                      ; preds = %while.cond38
  %52 = load i32, ptr %z, align 4
  %add55 = add nsw i32 %52, 1
  store i32 %add55, ptr %z, align 4
  br label %do.cond56

do.cond56:                                        ; preds = %while.end54
  %53 = load i32, ptr %x, align 4
  %54 = load i32, ptr %p.addr, align 4
  %cmp57 = icmp slt i32 %53, %54
  br i1 %cmp57, label %do.body37, label %do.end58, !llvm.loop !15

do.end58:                                         ; preds = %do.cond56
  %55 = load i32, ptr %z, align 4
  ret i32 %55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call i32 @crazy_loops(i32 noundef 50)
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
