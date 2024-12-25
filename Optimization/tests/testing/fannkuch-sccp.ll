; ModuleID = '<stdin>'
source_filename = "tests/testing/fannkuch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Pfannkuchen(%d) = %ld\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %call = call i64 @fannkuch(i32 noundef 11)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 11, i64 noundef %call)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i64 @fannkuch(i32 noundef %n) #0 {
entry:
  %sub = sub nsw i32 %n, 1
  %cmp = icmp slt i32 %n, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %conv = sext i32 %n to i64
  %call = call noalias ptr @calloc(i64 noundef %conv, i64 noundef 4) #3
  %conv1 = sext i32 %n to i64
  %call2 = call noalias ptr @calloc(i64 noundef %conv1, i64 noundef 4) #3
  %conv3 = sext i32 %n to i64
  %call4 = call noalias ptr @calloc(i64 noundef %conv3, i64 noundef 4) #3
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ]
  %cmp5 = icmp slt i32 %i.0, %n
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, ptr %call2, i64 %idxprom
  store i32 %i.0, ptr %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  br label %for.cond7

for.cond7:                                        ; preds = %for.end103, %for.end
  %r.0 = phi i32 [ %n, %for.end ], [ %r.2, %for.end103 ]
  %flipsMax.0 = phi i64 [ 0, %for.end ], [ %flipsMax.2, %for.end103 ]
  %didpr.0 = phi i32 [ 0, %for.end ], [ %didpr.1, %for.end103 ]
  %cmp8 = icmp slt i32 %didpr.0, 30
  br i1 %cmp8, label %if.then10, label %if.end23

if.then10:                                        ; preds = %for.cond7
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc18, %if.then10
  %i.1 = phi i32 [ 0, %if.then10 ], [ %inc19, %for.inc18 ]
  %cmp12 = icmp slt i32 %i.1, %n
  br i1 %cmp12, label %for.body14, label %for.end20

for.body14:                                       ; preds = %for.cond11
  %idxprom15 = sext i32 %i.1 to i64
  %arrayidx16 = getelementptr inbounds i32, ptr %call2, i64 %idxprom15
  %0 = load i32, ptr %arrayidx16, align 4
  %add = add nsw i32 1, %0
  %call17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %add)
  br label %for.inc18

for.inc18:                                        ; preds = %for.body14
  %inc19 = add nsw i32 %i.1, 1
  br label %for.cond11, !llvm.loop !8

for.end20:                                        ; preds = %for.cond11
  %call21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %inc22 = add nsw i32 %didpr.0, 1
  br label %if.end23

if.end23:                                         ; preds = %for.end20, %for.cond7
  %didpr.1 = phi i32 [ %inc22, %for.end20 ], [ %didpr.0, %for.cond7 ]
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc31, %if.end23
  %r.1 = phi i32 [ %r.0, %if.end23 ], [ %dec, %for.inc31 ]
  %cmp25 = icmp ne i32 %r.1, 1
  br i1 %cmp25, label %for.body27, label %for.end32

for.body27:                                       ; preds = %for.cond24
  %sub28 = sub nsw i32 %r.1, 1
  %idxprom29 = sext i32 %sub28 to i64
  %arrayidx30 = getelementptr inbounds i32, ptr %call4, i64 %idxprom29
  store i32 %r.1, ptr %arrayidx30, align 4
  br label %for.inc31

for.inc31:                                        ; preds = %for.body27
  %dec = add nsw i32 %r.1, -1
  br label %for.cond24, !llvm.loop !9

for.end32:                                        ; preds = %for.cond24
  %arrayidx33 = getelementptr inbounds i32, ptr %call2, i64 0
  %1 = load i32, ptr %arrayidx33, align 4
  %cmp34 = icmp eq i32 %1, 0
  br i1 %cmp34, label %if.end79, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end32
  %idxprom36 = sext i32 %sub to i64
  %arrayidx37 = getelementptr inbounds i32, ptr %call2, i64 %idxprom36
  %2 = load i32, ptr %arrayidx37, align 4
  %cmp38 = icmp eq i32 %2, %sub
  br i1 %cmp38, label %if.end79, label %if.then40

if.then40:                                        ; preds = %lor.lhs.false
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc49, %if.then40
  %i.2 = phi i32 [ 1, %if.then40 ], [ %inc50, %for.inc49 ]
  %cmp42 = icmp slt i32 %i.2, %n
  br i1 %cmp42, label %for.body44, label %for.end51

for.body44:                                       ; preds = %for.cond41
  %idxprom45 = sext i32 %i.2 to i64
  %arrayidx46 = getelementptr inbounds i32, ptr %call2, i64 %idxprom45
  %3 = load i32, ptr %arrayidx46, align 4
  %idxprom47 = sext i32 %i.2 to i64
  %arrayidx48 = getelementptr inbounds i32, ptr %call, i64 %idxprom47
  store i32 %3, ptr %arrayidx48, align 4
  br label %for.inc49

for.inc49:                                        ; preds = %for.body44
  %inc50 = add nsw i32 %i.2, 1
  br label %for.cond41, !llvm.loop !10

for.end51:                                        ; preds = %for.cond41
  %arrayidx52 = getelementptr inbounds i32, ptr %call2, i64 0
  %4 = load i32, ptr %arrayidx52, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.end51
  %flips.0 = phi i64 [ 0, %for.end51 ], [ %inc70, %do.cond ]
  %k.0 = phi i32 [ %4, %for.end51 ], [ %7, %do.cond ]
  %sub53 = sub nsw i32 %k.0, 1
  br label %for.cond54

for.cond54:                                       ; preds = %for.inc66, %do.body
  %i.3 = phi i32 [ 1, %do.body ], [ %inc67, %for.inc66 ]
  %j.0 = phi i32 [ %sub53, %do.body ], [ %dec68, %for.inc66 ]
  %cmp55 = icmp slt i32 %i.3, %j.0
  br i1 %cmp55, label %for.body57, label %for.end69

for.body57:                                       ; preds = %for.cond54
  %idxprom58 = sext i32 %i.3 to i64
  %arrayidx59 = getelementptr inbounds i32, ptr %call, i64 %idxprom58
  %5 = load i32, ptr %arrayidx59, align 4
  %idxprom60 = sext i32 %j.0 to i64
  %arrayidx61 = getelementptr inbounds i32, ptr %call, i64 %idxprom60
  %6 = load i32, ptr %arrayidx61, align 4
  %idxprom62 = sext i32 %i.3 to i64
  %arrayidx63 = getelementptr inbounds i32, ptr %call, i64 %idxprom62
  store i32 %6, ptr %arrayidx63, align 4
  %idxprom64 = sext i32 %j.0 to i64
  %arrayidx65 = getelementptr inbounds i32, ptr %call, i64 %idxprom64
  store i32 %5, ptr %arrayidx65, align 4
  br label %for.inc66

for.inc66:                                        ; preds = %for.body57
  %inc67 = add nsw i32 %i.3, 1
  %dec68 = add nsw i32 %j.0, -1
  br label %for.cond54, !llvm.loop !11

for.end69:                                        ; preds = %for.cond54
  %inc70 = add nsw i64 %flips.0, 1
  %idxprom71 = sext i32 %k.0 to i64
  %arrayidx72 = getelementptr inbounds i32, ptr %call, i64 %idxprom71
  %7 = load i32, ptr %arrayidx72, align 4
  %idxprom73 = sext i32 %k.0 to i64
  %arrayidx74 = getelementptr inbounds i32, ptr %call, i64 %idxprom73
  store i32 %k.0, ptr %arrayidx74, align 4
  br label %do.cond

do.cond:                                          ; preds = %for.end69
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %do.body, label %do.end, !llvm.loop !12

do.end:                                           ; preds = %do.cond
  %cmp75 = icmp slt i64 %flipsMax.0, %inc70
  br i1 %cmp75, label %if.then77, label %if.end78

if.then77:                                        ; preds = %do.end
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %do.end
  %flipsMax.1 = phi i64 [ %inc70, %if.then77 ], [ %flipsMax.0, %do.end ]
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %lor.lhs.false, %for.end32
  %flipsMax.2 = phi i64 [ %flipsMax.0, %for.end32 ], [ %flipsMax.0, %lor.lhs.false ], [ %flipsMax.1, %if.end78 ]
  br label %for.cond80

for.cond80:                                       ; preds = %if.end101, %if.end79
  %r.2 = phi i32 [ %r.1, %if.end79 ], [ %inc102, %if.end101 ]
  %cmp81 = icmp eq i32 %r.2, %n
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %for.cond80
  br label %return

if.end84:                                         ; preds = %for.cond80
  %arrayidx85 = getelementptr inbounds i32, ptr %call2, i64 0
  %8 = load i32, ptr %arrayidx85, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end84
  %i.4 = phi i32 [ 0, %if.end84 ], [ %add88, %while.body ]
  %cmp86 = icmp slt i32 %i.4, %r.2
  br i1 %cmp86, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add88 = add nsw i32 %i.4, 1
  %idxprom89 = sext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds i32, ptr %call2, i64 %idxprom89
  %9 = load i32, ptr %arrayidx90, align 4
  %idxprom91 = sext i32 %i.4 to i64
  %arrayidx92 = getelementptr inbounds i32, ptr %call2, i64 %idxprom91
  store i32 %9, ptr %arrayidx92, align 4
  br label %while.cond, !llvm.loop !13

while.end:                                        ; preds = %while.cond
  %idxprom93 = sext i32 %r.2 to i64
  %arrayidx94 = getelementptr inbounds i32, ptr %call2, i64 %idxprom93
  store i32 %8, ptr %arrayidx94, align 4
  %idxprom95 = sext i32 %r.2 to i64
  %arrayidx96 = getelementptr inbounds i32, ptr %call4, i64 %idxprom95
  %10 = load i32, ptr %arrayidx96, align 4
  %sub97 = sub nsw i32 %10, 1
  store i32 %sub97, ptr %arrayidx96, align 4
  %cmp98 = icmp sgt i32 %sub97, 0
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %while.end
  br label %for.end103

if.end101:                                        ; preds = %while.end
  %inc102 = add nsw i32 %r.2, 1
  br label %for.cond80

for.end103:                                       ; preds = %if.then100
  br label %for.cond7

return:                                           ; preds = %if.then83, %if.then
  %retval.0 = phi i64 [ 0, %if.then ], [ %flipsMax.2, %if.then83 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) }

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
