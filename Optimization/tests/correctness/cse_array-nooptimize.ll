; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse_array.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.arr = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [3 x i32], align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %arr, ptr align 4 @__const.main.arr, i64 12, i1 false)
  %arrayidx = getelementptr inbounds [3 x i32], ptr %arr, i64 0, i64 1
  %0 = load i32, ptr %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [3 x i32], ptr %arr, i64 0, i64 2
  %1 = load i32, ptr %arrayidx1, align 4
  %add = add nsw i32 %0, %1
  store i32 %add, ptr %x, align 4
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %arr, i64 0, i64 1
  %2 = load i32, ptr %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [3 x i32], ptr %arr, i64 0, i64 2
  %3 = load i32, ptr %arrayidx3, align 4
  %add4 = add nsw i32 %2, %3
  store i32 %add4, ptr %y, align 4
  %4 = load i32, ptr %x, align 4
  %5 = load i32, ptr %y, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %4, i32 noundef %5)
  ret i32 0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git bd76a3d41b4001cc1224acf7e88bb2644f8829e2)"}
