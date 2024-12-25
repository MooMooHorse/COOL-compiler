; ModuleID = '<stdin>'
source_filename = "tests/testing/puzzle.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@next = internal global i64 1, align 8
@.str = private unnamed_addr constant [21 x i8] c"Found duplicate: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand() #0 {
entry:
  %0 = load i64, ptr @next, align 8
  %mul = mul i64 %0, 1103515245
  %add = add i64 %mul, 12345
  store i64 %add, ptr @next, align 8
  %1 = load i64, ptr @next, align 8
  %div = udiv i64 %1, 65536
  %conv = trunc i64 %div to i32
  %rem = urem i32 %conv, 32767
  %add1 = add i32 %rem, 1
  ret i32 %add1
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @srand(i32 noundef %seed) #0 {
entry:
  %conv = zext i32 %seed to i64
  store i64 %conv, ptr @next, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @randInt(i32 noundef %min, i32 noundef %max) #0 {
entry:
  %sub = sub nsw i32 %max, %min
  %add = add nsw i32 %sub, 1
  %conv = sitofp i32 %add to double
  %call = call i32 @rand() #4
  %conv1 = sitofp i32 %call to double
  %div = fdiv double %conv1, 3.276800e+04
  %mul = fmul double %conv, %div
  %conv2 = fptosi double %mul to i32
  %cmp = icmp eq i32 %conv2, %add
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %add4 = add nsw i32 %conv2, %min
  %sub5 = sub nsw i32 %add4, 1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %add6 = add nsw i32 %conv2, %min
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub5, %cond.true ], [ %add6, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle(ptr noundef %items, i32 noundef %len) #0 {
entry:
  %sub = sub nsw i32 %len, 1
  %conv = sext i32 %sub to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ %conv, %entry ], [ %dec, %for.inc ]
  %cmp = icmp ugt i64 %i.0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = add i64 %i.0, 1
  %conv2 = uitofp i64 %add to double
  %call = call i32 @rand() #4
  %conv3 = sitofp i32 %call to double
  %div = fdiv double %conv3, 3.276800e+04
  %mul = fmul double %conv2, %div
  %conv4 = fptosi double %mul to i32
  %conv5 = sext i32 %conv4 to i64
  %add6 = add i64 %i.0, 1
  %cmp7 = icmp eq i64 %conv5, %add6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %sub9 = sub i64 %conv5, 1
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub9, %cond.true ], [ %conv5, %cond.false ]
  %arrayidx = getelementptr inbounds i32, ptr %items, i64 %i.0
  %0 = load i32, ptr %arrayidx, align 4
  %arrayidx10 = getelementptr inbounds i32, ptr %items, i64 %cond
  %1 = load i32, ptr %arrayidx10, align 4
  %arrayidx11 = getelementptr inbounds i32, ptr %items, i64 %i.0
  store i32 %1, ptr %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds i32, ptr %items, i64 %cond
  store i32 %0, ptr %arrayidx12, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %dec = add i64 %i.0, -1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createRandomArray(i32 noundef %size) #0 {
entry:
  %add = add nsw i32 %size, 1
  %conv = sext i32 %add to i64
  %mul = mul i64 %conv, 4
  %call = call noalias ptr @malloc(i64 noundef %mul) #5
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, %add
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, ptr %call, i64 %idxprom
  store i32 %i.0, ptr %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %call2 = call i32 @randInt(i32 noundef 1, i32 noundef %size)
  %arrayidx3 = getelementptr inbounds i32, ptr %call, i64 0
  store i32 %call2, ptr %arrayidx3, align 4
  call void @shuffle(ptr noundef %call, i32 noundef %add)
  ret ptr %call
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @findDuplicate(ptr noundef %data, i32 noundef %len) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %result.0 = phi i32 [ 0, %entry ], [ %xor1, %for.inc ]
  %cmp = icmp slt i32 %i.0, %len
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, 1
  %xor = xor i32 %result.0, %add
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, ptr %data, i64 %idxprom
  %0 = load i32, ptr %arrayidx, align 4
  %xor1 = xor i32 %xor, %0
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %xor2 = xor i32 %result.0, %len
  ret i32 %xor2
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  call void @srand(i32 noundef 1) #4
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc7, %for.inc6 ]
  %duplicate.0 = phi i32 [ undef, %entry ], [ %duplicate.1, %for.inc6 ]
  %cmp = icmp slt i32 %i.0, 5
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  %call = call ptr @createRandomArray(i32 noundef 500000)
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %duplicate.1 = phi i32 [ %duplicate.0, %for.body ], [ %call4, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, 200
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call4 = call i32 @findDuplicate(ptr noundef %call, i32 noundef 500001)
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add nsw i32 %j.0, 1
  br label %for.cond1, !llvm.loop !10

for.end:                                          ; preds = %for.cond1
  call void @free(ptr noundef %call) #4
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %duplicate.1)
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %inc7 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !11

for.end8:                                         ; preds = %for.cond
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
