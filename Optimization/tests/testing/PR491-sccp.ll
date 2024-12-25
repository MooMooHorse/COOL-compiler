; ModuleID = '<stdin>'
source_filename = "tests/testing/PR491.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i64 }

@.str = private unnamed_addr constant [11 x i8] c"u.l == 128\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"u.l < 0\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [35 x i8] c"assertion failed in line %u: '%s'\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @test(i32 noundef %r) #0 {
entry:
  %u = alloca %union.anon, align 8
  store i64 0, ptr %u, align 8
  %arrayidx = getelementptr inbounds [8 x i8], ptr %u, i64 0, i64 0
  store i8 -128, ptr %arrayidx, align 8
  %0 = load i64, ptr %u, align 8
  %cmp = icmp eq i64 %0, 128
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call = call i32 @assert_fail(ptr noundef @.str, i32 noundef 22)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %call, %cond.false ]
  %and = and i32 %r, %cond
  store i64 0, ptr %u, align 8
  %arrayidx1 = getelementptr inbounds [8 x i8], ptr %u, i64 0, i64 7
  store i8 -128, ptr %arrayidx1, align 1
  %1 = load i64, ptr %u, align 8
  %cmp2 = icmp slt i64 %1, 0
  br i1 %cmp2, label %cond.true3, label %cond.false4

cond.true3:                                       ; preds = %cond.end
  br label %cond.end6

cond.false4:                                      ; preds = %cond.end
  %call5 = call i32 @assert_fail(ptr noundef @.str.1, i32 noundef 24)
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false4, %cond.true3
  %cond7 = phi i32 [ 1, %cond.true3 ], [ %call5, %cond.false4 ]
  %and8 = and i32 %and, %cond7
  ret i32 %and8
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @assert_fail(ptr noundef %s, i32 noundef %l) #0 {
entry:
  %0 = load ptr, ptr @stderr, align 8
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str.2, i32 noundef %l, ptr noundef %s)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @test(i32 noundef 1)
  %cmp = icmp ne i32 %call, 1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git bd76a3d41b4001cc1224acf7e88bb2644f8829e2)"}
