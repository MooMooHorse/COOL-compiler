; ModuleID = '<stdin>'
source_filename = "tests/correctness/licm4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @do_loop(i32 noundef %x, i32 noundef %y, ptr noundef %z) #0 {
entry:
  store i32 2, ptr %z, align 4
  %cmp = icmp slt i32 %x, 0
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  br label %do.cond

do.cond:                                          ; preds = %do.body
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  ret i32 %x
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %x = alloca i32, align 4
  store i32 2, ptr %x, align 4
  %call = call i32 @do_loop(i32 noundef 2, i32 noundef 3, ptr noundef %x)
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
