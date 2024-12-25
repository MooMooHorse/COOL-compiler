; ModuleID = '<stdin>'
source_filename = "tests/correctness/la3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %p) #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %z.0 = phi i32 [ 5, %entry ], [ %add5, %do.cond ]
  %y.0 = phi i32 [ 25, %entry ], [ %y.1, %do.cond ]
  %x.0 = phi i32 [ 5, %entry ], [ %x.1, %do.cond ]
  br label %while.cond

while.cond:                                       ; preds = %while.body, %do.body
  %y.1 = phi i32 [ %y.0, %do.body ], [ %add4, %while.body ]
  %x.1 = phi i32 [ %x.0, %do.body ], [ %add3, %while.body ]
  %add2 = add nsw i32 %x.1, %y.1
  %cmp = icmp slt i32 %add2, %z.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add3 = add nsw i32 %x.1, 1
  %add4 = add nsw i32 %y.1, 1
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %add5 = add nsw i32 %z.0, 1
  br label %do.cond

do.cond:                                          ; preds = %while.end
  %cmp6 = icmp slt i32 %x.1, %p
  br i1 %cmp6, label %do.body, label %do.end, !llvm.loop !8

do.end:                                           ; preds = %do.cond
  br label %do.body7

do.body7:                                         ; preds = %do.cond16, %do.end
  %z.1 = phi i32 [ %add5, %do.end ], [ %add15, %do.cond16 ]
  %y.2 = phi i32 [ %y.1, %do.end ], [ %y.3, %do.cond16 ]
  %x.2 = phi i32 [ %x.1, %do.end ], [ %x.3, %do.cond16 ]
  br label %while.cond8

while.cond8:                                      ; preds = %while.body11, %do.body7
  %y.3 = phi i32 [ %y.2, %do.body7 ], [ %add13, %while.body11 ]
  %x.3 = phi i32 [ %x.2, %do.body7 ], [ %add12, %while.body11 ]
  %add9 = add nsw i32 %x.3, %y.3
  %cmp10 = icmp slt i32 %add9, %z.1
  br i1 %cmp10, label %while.body11, label %while.end14

while.body11:                                     ; preds = %while.cond8
  %add12 = add nsw i32 %x.3, 1
  %add13 = add nsw i32 %y.3, 1
  br label %while.cond8, !llvm.loop !9

while.end14:                                      ; preds = %while.cond8
  %add15 = add nsw i32 %z.1, 1
  br label %do.cond16

do.cond16:                                        ; preds = %while.end14
  %cmp17 = icmp slt i32 %x.3, %p
  br i1 %cmp17, label %do.body7, label %do.end18, !llvm.loop !10

do.end18:                                         ; preds = %do.cond16
  store i32 %x.3, ptr @m, align 16
  store i32 %y.3, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  store i32 %add15, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %0 = load i32, ptr @m, align 16
  %1 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add19 = add nsw i32 %0, %1
  %2 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %add20 = add nsw i32 %add19, %2
  store i32 %add20, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %3 = load i32, ptr @m, align 16
  %4 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %add21 = add nsw i32 %3, %4
  %5 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %sub22 = sub nsw i32 %add21, %5
  store i32 %sub22, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %6 = load i32, ptr @m, align 16
  %7 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub23 = sub nsw i32 %6, %7
  %8 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %add24 = add nsw i32 %sub23, %8
  store i32 %add24, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %9 = load i32, ptr @m, align 16
  %10 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %sub25 = sub nsw i32 %9, %10
  %11 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %sub26 = sub nsw i32 %sub25, %11
  store i32 %sub26, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 6), align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end18
  %i.0 = phi i32 [ 0, %do.end18 ], [ %inc, %for.inc ]
  %cmp27 = icmp slt i32 %i.0, 10
  br i1 %cmp27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom
  %12 = load i32, ptr %arrayidx, align 4
  %add28 = add nsw i32 %12, 1
  %idxprom29 = sext i32 %i.0 to i64
  %arrayidx30 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom29
  store i32 %add28, ptr %arrayidx30, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc43, %for.end
  %i31.0 = phi i32 [ 1, %for.end ], [ %inc44, %for.inc43 ]
  %cmp33 = icmp slt i32 %i31.0, 10
  br i1 %cmp33, label %for.body34, label %for.end45

for.body34:                                       ; preds = %for.cond32
  %idxprom35 = sext i32 %i31.0 to i64
  %arrayidx36 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom35
  %13 = load i32, ptr %arrayidx36, align 4
  %sub37 = sub nsw i32 %i31.0, 1
  %idxprom38 = sext i32 %sub37 to i64
  %arrayidx39 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom38
  %14 = load i32, ptr %arrayidx39, align 4
  %add40 = add nsw i32 %13, %14
  %idxprom41 = sext i32 %i31.0 to i64
  %arrayidx42 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom41
  store i32 %add40, ptr %arrayidx42, align 4
  br label %for.inc43

for.inc43:                                        ; preds = %for.body34
  %inc44 = add nsw i32 %i31.0, 1
  br label %for.cond32, !llvm.loop !12

for.end45:                                        ; preds = %for.cond32
  br label %for.cond47

for.cond47:                                       ; preds = %for.inc58, %for.end45
  %i46.0 = phi i32 [ 0, %for.end45 ], [ %inc59, %for.inc58 ]
  %cmp48 = icmp slt i32 %i46.0, 9
  br i1 %cmp48, label %for.body49, label %for.end60

for.body49:                                       ; preds = %for.cond47
  %idxprom50 = sext i32 %i46.0 to i64
  %arrayidx51 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom50
  %15 = load i32, ptr %arrayidx51, align 4
  %add52 = add nsw i32 %i46.0, 1
  %idxprom53 = sext i32 %add52 to i64
  %arrayidx54 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom53
  %16 = load i32, ptr %arrayidx54, align 4
  %add55 = add nsw i32 %15, %16
  %idxprom56 = sext i32 %i46.0 to i64
  %arrayidx57 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom56
  store i32 %add55, ptr %arrayidx57, align 4
  br label %for.inc58

for.inc58:                                        ; preds = %for.body49
  %inc59 = add nsw i32 %i46.0, 1
  br label %for.cond47, !llvm.loop !13

for.end60:                                        ; preds = %for.cond47
  br label %do.body61

do.body61:                                        ; preds = %do.cond86, %for.end60
  %z.2 = phi i32 [ %add15, %for.end60 ], [ %add69, %do.cond86 ]
  %y.4 = phi i32 [ %y.3, %for.end60 ], [ %y.5, %do.cond86 ]
  %x.4 = phi i32 [ %x.3, %for.end60 ], [ %x.5, %do.cond86 ]
  br label %while.cond62

while.cond62:                                     ; preds = %while.body65, %do.body61
  %y.5 = phi i32 [ %y.4, %do.body61 ], [ %add67, %while.body65 ]
  %x.5 = phi i32 [ %x.4, %do.body61 ], [ %add66, %while.body65 ]
  %add63 = add nsw i32 %x.5, %y.5
  %cmp64 = icmp slt i32 %add63, %z.2
  br i1 %cmp64, label %while.body65, label %while.end68

while.body65:                                     ; preds = %while.cond62
  %add66 = add nsw i32 %x.5, 1
  %add67 = add nsw i32 %y.5, 1
  br label %while.cond62, !llvm.loop !14

while.end68:                                      ; preds = %while.cond62
  %add69 = add nsw i32 %z.2, 1
  %17 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %add70 = add nsw i32 %17, %y.5
  store i32 %add70, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  br label %for.cond72

for.cond72:                                       ; preds = %for.inc83, %while.end68
  %i71.0 = phi i32 [ 0, %while.end68 ], [ %inc84, %for.inc83 ]
  %cmp73 = icmp slt i32 %i71.0, 9
  br i1 %cmp73, label %for.body74, label %for.end85

for.body74:                                       ; preds = %for.cond72
  %idxprom75 = sext i32 %i71.0 to i64
  %arrayidx76 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom75
  %18 = load i32, ptr %arrayidx76, align 4
  %add77 = add nsw i32 %i71.0, 1
  %idxprom78 = sext i32 %add77 to i64
  %arrayidx79 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom78
  %19 = load i32, ptr %arrayidx79, align 4
  %add80 = add nsw i32 %18, %19
  %idxprom81 = sext i32 %i71.0 to i64
  %arrayidx82 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %idxprom81
  store i32 %add80, ptr %arrayidx82, align 4
  br label %for.inc83

for.inc83:                                        ; preds = %for.body74
  %inc84 = add nsw i32 %i71.0, 1
  br label %for.cond72, !llvm.loop !15

for.end85:                                        ; preds = %for.cond72
  br label %do.cond86

do.cond86:                                        ; preds = %for.end85
  %20 = load i32, ptr @m, align 16
  %cmp87 = icmp slt i32 %20, %p
  br i1 %cmp87, label %do.body61, label %do.end88, !llvm.loop !16

do.end88:                                         ; preds = %do.cond86
  %21 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  ret i32 %21
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
