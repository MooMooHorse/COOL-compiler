; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse-demo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @test1(i8 noundef signext %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = sext i8 %0 to i32
  %5 = sext i8 %0 to i32
  store i32 %4, ptr %1, align 4
  store i32 %5, ptr %1, align 4
  store volatile i32 %4, ptr %2, align 4
  store volatile i32 %5, ptr %2, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test2(float noundef %0, float noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = fadd float %0, %1
  %6 = fptosi float %5 to i32
  store i32 %6, ptr %2, align 4
  %7 = fptosi float %5 to i32
  store i32 %7, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @g(i32 noundef %0) #0 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test3(ptr noundef %0) #0 {
  %2 = icmp ne ptr %0, null
  br i1 %2, label %6, label %3

3:                                                ; preds = %1
  %4 = xor i1 %2, true
  %5 = zext i1 %4 to i32
  call void @g(i32 noundef %5)
  br label %6

6:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 3, ptr %1, align 4
  store i32 4, ptr %2, align 4
  store i32 5, ptr %3, align 4
  call void @test1(i8 noundef signext 97, ptr noundef %1, ptr noundef %2)
  call void @test2(float noundef 1.000000e+00, float noundef 2.000000e+00, ptr noundef %3, ptr noundef %1)
  call void @test3(ptr noundef %3)
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr %2, align 4
  %6 = add nsw i32 %4, %5
  %7 = load i32, ptr %3, align 4
  %8 = add nsw i32 %6, %7
  ret i32 %8
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
