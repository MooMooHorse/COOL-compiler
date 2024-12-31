; ModuleID = '<stdin>'
source_filename = "tests/correctness/la3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %p) #0 {
entry:
  %p.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %i = alloca i32, align 4
  %i31 = alloca i32, align 4
  %i46 = alloca i32, align 4
  %i71 = alloca i32, align 4
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

do.body:                                          ; preds = %do.cond, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.body
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
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %11 = load i32, ptr %z, align 4
  %add5 = add nsw i32 %11, 1
  store i32 %add5, ptr %z, align 4
  br label %do.cond

do.cond:                                          ; preds = %while.end
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %p.addr, align 4
  %cmp6 = icmp slt i32 %12, %13
  br i1 %cmp6, label %do.body, label %do.end, !llvm.loop !8

do.end:                                           ; preds = %do.cond
  br label %do.body7

do.body7:                                         ; preds = %do.cond16, %do.end
  br label %while.cond8

while.cond8:                                      ; preds = %while.body11, %do.body7
  %14 = load i32, ptr %x, align 4
  %15 = load i32, ptr %y, align 4
  %add9 = add nsw i32 %14, %15
  %16 = load i32, ptr %z, align 4
  %cmp10 = icmp slt i32 %add9, %16
  br i1 %cmp10, label %while.body11, label %while.end14

while.body11:                                     ; preds = %while.cond8
  %17 = load i32, ptr %x, align 4
  %add12 = add nsw i32 %17, 1
  store i32 %add12, ptr %x, align 4
  %18 = load i32, ptr %y, align 4
  %add13 = add nsw i32 %18, 1
  store i32 %add13, ptr %y, align 4
  br label %while.cond8, !llvm.loop !9

while.end14:                                      ; preds = %while.cond8
  %19 = load i32, ptr %z, align 4
  %add15 = add nsw i32 %19, 1
  store i32 %add15, ptr %z, align 4
  br label %do.cond16

do.cond16:                                        ; preds = %while.end14
  %20 = load i32, ptr %x, align 4
  %21 = load i32, ptr %p.addr, align 4
  %cmp17 = icmp slt i32 %20, %21
  br i1 %cmp17, label %do.body7, label %do.end18, !llvm.loop !10

do.end18:                                         ; preds = %do.cond16
  %22 = load i32, ptr %x, align 4
  store i32 %22, ptr @m, align 16
  %23 = load i32, ptr %y, align 4
  store i32 %23, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %24 = load i32, ptr %z, align 4
  store i32 %24, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %25 = load i32, ptr @m, align 16
  %26 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add19 = add nsw i32 %25, %26
  %27 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %add20 = add nsw i32 %add19, %27
  store i32 %add20, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %28 = load i32, ptr @m, align 16
  %29 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add21 = add nsw i32 %28, %29
  %30 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %sub22 = sub nsw i32 %add21, %30
  store i32 %sub22, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %31 = load i32, ptr @m, align 16
  %32 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub23 = sub nsw i32 %31, %32
  %33 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %add24 = add nsw i32 %sub23, %33
  store i32 %add24, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %34 = load i32, ptr @m, align 16
  %35 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub25 = sub nsw i32 %34, %35
  %36 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %sub26 = sub nsw i32 %sub25, %36
  store i32 %sub26, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 6), align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end18
  %37 = load i32, ptr %i, align 4
  %cmp27 = icmp slt i32 %37, 10
  br i1 %cmp27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %38 = load i32, ptr %i, align 4
  %idxprom = sext i32 %38 to i64
  %arrayidx = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom
  %39 = load i32, ptr %arrayidx, align 4
  %add28 = add nsw i32 %39, 1
  %40 = load i32, ptr %i, align 4
  %idxprom29 = sext i32 %40 to i64
  %arrayidx30 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom29
  store i32 %add28, ptr %arrayidx30, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %41 = load i32, ptr %i, align 4
  %inc = add nsw i32 %41, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  store i32 1, ptr %i31, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc43, %for.end
  %42 = load i32, ptr %i31, align 4
  %cmp33 = icmp slt i32 %42, 10
  br i1 %cmp33, label %for.body34, label %for.end45

for.body34:                                       ; preds = %for.cond32
  %43 = load i32, ptr %i31, align 4
  %idxprom35 = sext i32 %43 to i64
  %arrayidx36 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom35
  %44 = load i32, ptr %arrayidx36, align 4
  %45 = load i32, ptr %i31, align 4
  %sub37 = sub nsw i32 %45, 1
  %idxprom38 = sext i32 %sub37 to i64
  %arrayidx39 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom38
  %46 = load i32, ptr %arrayidx39, align 4
  %add40 = add nsw i32 %44, %46
  %47 = load i32, ptr %i31, align 4
  %idxprom41 = sext i32 %47 to i64
  %arrayidx42 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom41
  store i32 %add40, ptr %arrayidx42, align 4
  br label %for.inc43

for.inc43:                                        ; preds = %for.body34
  %48 = load i32, ptr %i31, align 4
  %inc44 = add nsw i32 %48, 1
  store i32 %inc44, ptr %i31, align 4
  br label %for.cond32, !llvm.loop !12

for.end45:                                        ; preds = %for.cond32
  store i32 0, ptr %i46, align 4
  br label %for.cond47

for.cond47:                                       ; preds = %for.inc58, %for.end45
  %49 = load i32, ptr %i46, align 4
  %cmp48 = icmp slt i32 %49, 9
  br i1 %cmp48, label %for.body49, label %for.end60

for.body49:                                       ; preds = %for.cond47
  %50 = load i32, ptr %i46, align 4
  %idxprom50 = sext i32 %50 to i64
  %arrayidx51 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom50
  %51 = load i32, ptr %arrayidx51, align 4
  %52 = load i32, ptr %i46, align 4
  %add52 = add nsw i32 %52, 1
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom53
  %53 = load i32, ptr %arrayidx54, align 4
  %add55 = add nsw i32 %51, %53
  %54 = load i32, ptr %i46, align 4
  %idxprom56 = sext i32 %54 to i64
  %arrayidx57 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom56
  store i32 %add55, ptr %arrayidx57, align 4
  br label %for.inc58

for.inc58:                                        ; preds = %for.body49
  %55 = load i32, ptr %i46, align 4
  %inc59 = add nsw i32 %55, 1
  store i32 %inc59, ptr %i46, align 4
  br label %for.cond47, !llvm.loop !13

for.end60:                                        ; preds = %for.cond47
  br label %do.body61

do.body61:                                        ; preds = %do.cond86, %for.end60
  br label %while.cond62

while.cond62:                                     ; preds = %while.body65, %do.body61
  %56 = load i32, ptr %x, align 4
  %57 = load i32, ptr %y, align 4
  %add63 = add nsw i32 %56, %57
  %58 = load i32, ptr %z, align 4
  %cmp64 = icmp slt i32 %add63, %58
  br i1 %cmp64, label %while.body65, label %while.end68

while.body65:                                     ; preds = %while.cond62
  %59 = load i32, ptr %x, align 4
  %add66 = add nsw i32 %59, 1
  store i32 %add66, ptr %x, align 4
  %60 = load i32, ptr %y, align 4
  %add67 = add nsw i32 %60, 1
  store i32 %add67, ptr %y, align 4
  br label %while.cond62, !llvm.loop !14

while.end68:                                      ; preds = %while.cond62
  %61 = load i32, ptr %z, align 4
  %add69 = add nsw i32 %61, 1
  store i32 %add69, ptr %z, align 4
  %62 = load i32, ptr %y, align 4
  %63 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %add70 = add nsw i32 %63, %62
  store i32 %add70, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  store i32 0, ptr %i71, align 4
  br label %for.cond72

for.cond72:                                       ; preds = %for.inc83, %while.end68
  %64 = load i32, ptr %i71, align 4
  %cmp73 = icmp slt i32 %64, 9
  br i1 %cmp73, label %for.body74, label %for.end85

for.body74:                                       ; preds = %for.cond72
  %65 = load i32, ptr %i71, align 4
  %idxprom75 = sext i32 %65 to i64
  %arrayidx76 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom75
  %66 = load i32, ptr %arrayidx76, align 4
  %67 = load i32, ptr %i71, align 4
  %add77 = add nsw i32 %67, 1
  %idxprom78 = sext i32 %add77 to i64
  %arrayidx79 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom78
  %68 = load i32, ptr %arrayidx79, align 4
  %add80 = add nsw i32 %66, %68
  %69 = load i32, ptr %i71, align 4
  %idxprom81 = sext i32 %69 to i64
  %arrayidx82 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom81
  store i32 %add80, ptr %arrayidx82, align 4
  br label %for.inc83

for.inc83:                                        ; preds = %for.body74
  %70 = load i32, ptr %i71, align 4
  %inc84 = add nsw i32 %70, 1
  store i32 %inc84, ptr %i71, align 4
  br label %for.cond72, !llvm.loop !15

for.end85:                                        ; preds = %for.cond72
  br label %do.cond86

do.cond86:                                        ; preds = %for.end85
  %71 = load i32, ptr @m, align 16
  %72 = load i32, ptr %p.addr, align 4
  %cmp87 = icmp slt i32 %71, %72
  br i1 %cmp87, label %do.body61, label %do.end88, !llvm.loop !16

do.end88:                                         ; preds = %do.cond86
  %73 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  ret i32 %73
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
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git ce919e92afed6522fae11fdf69158b4b9ead2296)"}
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
!16 = distinct !{!16, !7}
