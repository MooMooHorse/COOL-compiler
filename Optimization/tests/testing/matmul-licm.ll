; ModuleID = '<stdin>'
source_filename = "tests/testing/matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmul(i32 noundef %n, i32 noundef %m, i32 noundef %l, ptr noundef %A, ptr noundef %B, ptr noundef %C) #0 {
entry:
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  %2 = zext i32 %m to i64
  %3 = zext i32 %l to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %l to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc25, %for.inc24 ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %idxprom9 = sext i32 %i.0 to i64
  %idxprom17 = sext i32 %i.0 to i64
  %6 = mul nsw i64 %idxprom, %5
  %7 = mul nsw i64 %idxprom9, %1
  %8 = mul nsw i64 %idxprom17, %5
  %arrayidx = getelementptr inbounds i32, ptr %C, i64 %6
  %arrayidx10 = getelementptr inbounds i32, ptr %A, i64 %7
  %arrayidx18 = getelementptr inbounds i32, ptr %C, i64 %8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc21, %for.body
  %k.0 = phi i32 [ 0, %for.body ], [ %inc22, %for.inc21 ]
  %cmp2 = icmp slt i32 %k.0, %l
  br i1 %cmp2, label %for.body3, label %for.end23

for.body3:                                        ; preds = %for.cond1
  %idxprom4 = sext i32 %k.0 to i64
  %arrayidx5 = getelementptr inbounds i32, ptr %arrayidx, i64 %idxprom4
  store i32 0, ptr %arrayidx5, align 4
  %idxprom15 = sext i32 %k.0 to i64
  %idxprom19 = sext i32 %k.0 to i64
  %arrayidx20 = getelementptr inbounds i32, ptr %arrayidx18, i64 %idxprom19
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %j.0 = phi i32 [ 0, %for.body3 ], [ %inc, %for.inc ]
  %cmp7 = icmp slt i32 %j.0, %m
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %idxprom11 = sext i32 %j.0 to i64
  %arrayidx12 = getelementptr inbounds i32, ptr %arrayidx10, i64 %idxprom11
  %9 = load i32, ptr %arrayidx12, align 4
  %idxprom13 = sext i32 %j.0 to i64
  %10 = mul nsw i64 %idxprom13, %3
  %arrayidx14 = getelementptr inbounds i32, ptr %B, i64 %10
  %arrayidx16 = getelementptr inbounds i32, ptr %arrayidx14, i64 %idxprom15
  %11 = load i32, ptr %arrayidx16, align 4
  %mul = mul nsw i32 %9, %11
  %12 = load i32, ptr %arrayidx20, align 4
  %add = add nsw i32 %12, %mul
  store i32 %add, ptr %arrayidx20, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %inc = add nsw i32 %j.0, 1
  br label %for.cond6, !llvm.loop !6

for.end:                                          ; preds = %for.cond6
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %inc22 = add nsw i32 %k.0, 1
  br label %for.cond1, !llvm.loop !8

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %inc25 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end26:                                        ; preds = %for.cond
  ret void
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
