; ModuleID = '<stdin>'
source_filename = "tests/testing/nsieve-bits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %div = udiv i32 40960000, 8
  %conv = zext i32 %div to i64
  %add = add i64 %conv, 4
  %call = call noalias ptr @malloc(i64 noundef %add) #5
  %tobool = icmp ne ptr %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc43, %if.end
  %m.0 = phi i32 [ 0, %if.end ], [ %inc44, %for.inc43 ]
  %cmp = icmp ule i32 %m.0, 2
  br i1 %cmp, label %for.body, label %for.end45

for.body:                                         ; preds = %for.cond
  %shr = lshr i32 40960000, %m.0
  %div2 = udiv i32 %shr, 8
  %conv3 = zext i32 %div2 to i64
  %add4 = add i64 %conv3, 4
  call void @llvm.memset.p0.i64(ptr align 4 %call, i8 -1, i64 %add4, i1 false)
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc39, %for.body
  %i.0 = phi i32 [ 2, %for.body ], [ %inc40, %for.inc39 ]
  %count.0 = phi i32 [ 0, %for.body ], [ %count.1, %for.inc39 ]
  %cmp6 = icmp ule i32 %i.0, %shr
  br i1 %cmp6, label %for.body8, label %for.end41

for.body8:                                        ; preds = %for.cond5
  %conv9 = zext i32 %i.0 to i64
  %div10 = udiv i64 %conv9, 32
  %arrayidx = getelementptr inbounds i32, ptr %call, i64 %div10
  %0 = load i32, ptr %arrayidx, align 4
  %conv11 = zext i32 %i.0 to i64
  %rem = urem i64 %conv11, 32
  %sh_prom = trunc i64 %rem to i32
  %shl = shl i32 1, %sh_prom
  %and = and i32 %0, %shl
  %tobool12 = icmp ne i32 %and, 0
  br i1 %tobool12, label %if.then13, label %if.end38

if.then13:                                        ; preds = %for.body8
  %inc = add i32 %count.0, 1
  %add14 = add i32 %i.0, %i.0
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc, %if.then13
  %j.0 = phi i32 [ %add14, %if.then13 ], [ %add37, %for.inc ]
  %cmp16 = icmp ule i32 %j.0, %shr
  br i1 %cmp16, label %for.body18, label %for.end

for.body18:                                       ; preds = %for.cond15
  %conv19 = zext i32 %j.0 to i64
  %div20 = udiv i64 %conv19, 32
  %arrayidx21 = getelementptr inbounds i32, ptr %call, i64 %div20
  %1 = load i32, ptr %arrayidx21, align 4
  %conv22 = zext i32 %j.0 to i64
  %rem23 = urem i64 %conv22, 32
  %sh_prom24 = trunc i64 %rem23 to i32
  %shl25 = shl i32 1, %sh_prom24
  %and26 = and i32 %1, %shl25
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.end36

if.then28:                                        ; preds = %for.body18
  %conv29 = zext i32 %j.0 to i64
  %rem30 = urem i64 %conv29, 32
  %sh_prom31 = trunc i64 %rem30 to i32
  %shl32 = shl i32 1, %sh_prom31
  %conv33 = zext i32 %j.0 to i64
  %div34 = udiv i64 %conv33, 32
  %arrayidx35 = getelementptr inbounds i32, ptr %call, i64 %div34
  %2 = load i32, ptr %arrayidx35, align 4
  %xor = xor i32 %2, %shl32
  store i32 %xor, ptr %arrayidx35, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then28, %for.body18
  br label %for.inc

for.inc:                                          ; preds = %if.end36
  %add37 = add i32 %j.0, %i.0
  br label %for.cond15, !llvm.loop !6

for.end:                                          ; preds = %for.cond15
  br label %if.end38

if.end38:                                         ; preds = %for.end, %for.body8
  %count.1 = phi i32 [ %inc, %for.end ], [ %count.0, %for.body8 ]
  br label %for.inc39

for.inc39:                                        ; preds = %if.end38
  %inc40 = add i32 %i.0, 1
  br label %for.cond5, !llvm.loop !8

for.end41:                                        ; preds = %for.cond5
  %call42 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %shr, i32 noundef %count.0)
  br label %for.inc43

for.inc43:                                        ; preds = %for.end41
  %inc44 = add i32 %m.0, 1
  br label %for.cond, !llvm.loop !9

for.end45:                                        ; preds = %for.cond
  call void @free(ptr noundef %call) #6
  br label %return

return:                                           ; preds = %for.end45, %if.then
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %if.then ]
  ret i32 %retval.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

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
