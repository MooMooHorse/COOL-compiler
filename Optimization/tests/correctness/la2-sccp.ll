; ModuleID = '<stdin>'
source_filename = "tests/correctness/la2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %p) #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %do.cond12, %entry
  %y.0 = phi i32 [ 25, %entry ], [ %y.1, %do.cond12 ]
  %x.0 = phi i32 [ 5, %entry ], [ %x.1, %do.cond12 ]
  %z.0 = phi i32 [ 5, %entry ], [ %add11, %do.cond12 ]
  br label %while.cond

while.cond:                                       ; preds = %do.end, %do.body
  %y.1 = phi i32 [ %y.0, %do.body ], [ %y.3, %do.end ]
  %x.1 = phi i32 [ %x.0, %do.body ], [ %mul6, %do.end ]
  %add2 = add nsw i32 %x.1, %y.1
  %cmp = icmp slt i32 %add2, %z.0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add3 = add nsw i32 %x.1, 1
  %add4 = add nsw i32 %y.1, 1
  br label %do.body5

do.body5:                                         ; preds = %do.cond, %while.body
  %y.2 = phi i32 [ %add4, %while.body ], [ %y.3, %do.cond ]
  %x.2 = phi i32 [ %add3, %while.body ], [ %mul6, %do.cond ]
  %mul6 = mul nsw i32 %x.2, %x.2
  %cmp7 = icmp sgt i32 %mul6, 10
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %do.body5
  %mul8 = mul nsw i32 %y.2, %y.2
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body5
  %y.3 = phi i32 [ %mul8, %if.then ], [ %y.2, %do.body5 ]
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %mul9 = mul nsw i32 %p, %p
  %cmp10 = icmp slt i32 %mul6, %mul9
  br i1 %cmp10, label %do.body5, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  br label %while.cond, !llvm.loop !8

while.end:                                        ; preds = %while.cond
  %add11 = add nsw i32 %z.0, 1
  br label %do.cond12

do.cond12:                                        ; preds = %while.end
  %cmp13 = icmp slt i32 %x.1, %p
  br i1 %cmp13, label %do.body, label %do.end14, !llvm.loop !9

do.end14:                                         ; preds = %do.cond12
  br label %do.body15

do.body15:                                        ; preds = %do.cond34, %do.end14
  %y.4 = phi i32 [ %y.1, %do.end14 ], [ %y.5, %do.cond34 ]
  %x.3 = phi i32 [ 50, %do.end14 ], [ %x.4, %do.cond34 ]
  %z.1 = phi i32 [ %add11, %do.end14 ], [ %add33, %do.cond34 ]
  br label %while.cond16

while.cond16:                                     ; preds = %do.end31, %do.body15
  %y.5 = phi i32 [ %y.4, %do.body15 ], [ %y.7, %do.end31 ]
  %x.4 = phi i32 [ %x.3, %do.body15 ], [ %mul23, %do.end31 ]
  %add17 = add nsw i32 %x.4, %y.5
  %cmp18 = icmp slt i32 %add17, %z.1
  br i1 %cmp18, label %while.body19, label %while.end32

while.body19:                                     ; preds = %while.cond16
  %add20 = add nsw i32 %x.4, 1
  %add21 = add nsw i32 %y.5, 1
  br label %do.body22

do.body22:                                        ; preds = %do.cond28, %while.body19
  %y.6 = phi i32 [ %add21, %while.body19 ], [ %y.7, %do.cond28 ]
  %x.5 = phi i32 [ %add20, %while.body19 ], [ %mul23, %do.cond28 ]
  %mul23 = mul nsw i32 %x.5, %x.5
  %cmp24 = icmp sgt i32 %mul23, 10
  br i1 %cmp24, label %if.then25, label %if.end27

if.then25:                                        ; preds = %do.body22
  %mul26 = mul nsw i32 %y.6, %y.6
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %do.body22
  %y.7 = phi i32 [ %mul26, %if.then25 ], [ %y.6, %do.body22 ]
  br label %do.cond28

do.cond28:                                        ; preds = %if.end27
  %mul29 = mul nsw i32 %p, %p
  %cmp30 = icmp slt i32 %mul23, %mul29
  br i1 %cmp30, label %do.body22, label %do.end31, !llvm.loop !10

do.end31:                                         ; preds = %do.cond28
  br label %while.cond16, !llvm.loop !11

while.end32:                                      ; preds = %while.cond16
  %add33 = add nsw i32 %z.1, 1
  br label %do.cond34

do.cond34:                                        ; preds = %while.end32
  %cmp35 = icmp slt i32 %x.4, %p
  br i1 %cmp35, label %do.body15, label %do.end36, !llvm.loop !12

do.end36:                                         ; preds = %do.cond34
  br label %do.body37

do.body37:                                        ; preds = %do.cond56, %do.end36
  %y.8 = phi i32 [ %y.5, %do.end36 ], [ %y.9, %do.cond56 ]
  %x.6 = phi i32 [ %p, %do.end36 ], [ %x.7, %do.cond56 ]
  %z.2 = phi i32 [ %add33, %do.end36 ], [ %add55, %do.cond56 ]
  br label %while.cond38

while.cond38:                                     ; preds = %do.end53, %do.body37
  %y.9 = phi i32 [ %y.8, %do.body37 ], [ %y.11, %do.end53 ]
  %x.7 = phi i32 [ %x.6, %do.body37 ], [ %mul45, %do.end53 ]
  %add39 = add nsw i32 %x.7, %y.9
  %cmp40 = icmp slt i32 %add39, %z.2
  br i1 %cmp40, label %while.body41, label %while.end54

while.body41:                                     ; preds = %while.cond38
  %add42 = add nsw i32 %x.7, 1
  %add43 = add nsw i32 %y.9, 1
  br label %do.body44

do.body44:                                        ; preds = %do.cond50, %while.body41
  %y.10 = phi i32 [ %add43, %while.body41 ], [ %y.11, %do.cond50 ]
  %x.8 = phi i32 [ %add42, %while.body41 ], [ %mul45, %do.cond50 ]
  %mul45 = mul nsw i32 %x.8, %x.8
  %cmp46 = icmp sgt i32 %mul45, 10
  br i1 %cmp46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %do.body44
  %mul48 = mul nsw i32 %y.10, %y.10
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %do.body44
  %y.11 = phi i32 [ %mul48, %if.then47 ], [ %y.10, %do.body44 ]
  br label %do.cond50

do.cond50:                                        ; preds = %if.end49
  %mul51 = mul nsw i32 %p, %p
  %cmp52 = icmp slt i32 %mul45, %mul51
  br i1 %cmp52, label %do.body44, label %do.end53, !llvm.loop !13

do.end53:                                         ; preds = %do.cond50
  br label %while.cond38, !llvm.loop !14

while.end54:                                      ; preds = %while.cond38
  %add55 = add nsw i32 %z.2, 1
  br label %do.cond56

do.cond56:                                        ; preds = %while.end54
  %cmp57 = icmp slt i32 %x.7, %p
  br i1 %cmp57, label %do.body37, label %do.end58, !llvm.loop !15

do.end58:                                         ; preds = %do.cond56
  ret i32 %add55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
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
