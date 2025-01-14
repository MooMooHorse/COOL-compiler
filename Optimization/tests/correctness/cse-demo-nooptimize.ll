; ModuleID = '<stdin>'
source_filename = "tests/correctness/cse-demo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @test1(i8 noundef signext %c, ptr noundef %x, ptr noundef %y) #0 {
entry:
  %c.addr = alloca i8, align 1
  %x.addr = alloca ptr, align 8
  %y.addr = alloca ptr, align 8
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  store i8 %c, ptr %c.addr, align 1
  store ptr %x, ptr %x.addr, align 8
  store ptr %y, ptr %y.addr, align 8
  %0 = load i8, ptr %c.addr, align 1
  %conv = sext i8 %0 to i32
  store i32 %conv, ptr %p, align 4
  %1 = load i8, ptr %c.addr, align 1
  %conv1 = sext i8 %1 to i32
  store i32 %conv1, ptr %q, align 4
  %2 = load i32, ptr %p, align 4
  %3 = load ptr, ptr %x.addr, align 8
  store i32 %2, ptr %3, align 4
  %4 = load i32, ptr %q, align 4
  %5 = load ptr, ptr %x.addr, align 8
  store i32 %4, ptr %5, align 4
  %6 = load i32, ptr %p, align 4
  %7 = load ptr, ptr %y.addr, align 8
  store volatile i32 %6, ptr %7, align 4
  %8 = load i32, ptr %q, align 4
  %9 = load ptr, ptr %y.addr, align 8
  store volatile i32 %8, ptr %9, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test2(float noundef %x, float noundef %y, ptr noundef %m, ptr noundef %n) #0 {
entry:
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  %m.addr = alloca ptr, align 8
  %n.addr = alloca ptr, align 8
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store float %x, ptr %x.addr, align 4
  store float %y, ptr %y.addr, align 4
  store ptr %m, ptr %m.addr, align 8
  store ptr %n, ptr %n.addr, align 8
  %0 = load float, ptr %x.addr, align 4
  %1 = load float, ptr %y.addr, align 4
  %add = fadd float %0, %1
  %conv = fptosi float %add to i32
  store i32 %conv, ptr %c, align 4
  %2 = load i32, ptr %c, align 4
  %3 = load ptr, ptr %m.addr, align 8
  store i32 %2, ptr %3, align 4
  %4 = load float, ptr %x.addr, align 4
  %5 = load float, ptr %y.addr, align 4
  %add1 = fadd float %4, %5
  %conv2 = fptosi float %add1 to i32
  store i32 %conv2, ptr %d, align 4
  %6 = load i32, ptr %d, align 4
  %7 = load ptr, ptr %n.addr, align 8
  store i32 %6, ptr %7, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @g(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @test3(ptr noundef %p) #0 {
entry:
  %p.addr = alloca ptr, align 8
  store ptr %p, ptr %p.addr, align 8
  %0 = load ptr, ptr %p.addr, align 8
  %tobool = icmp ne ptr %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr %p.addr, align 8
  %tobool1 = icmp ne ptr %1, null
  %lnot = xor i1 %tobool1, true
  %lnot.ext = zext i1 %lnot to i32
  call void @g(i32 noundef %lnot.ext)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 3, ptr %x, align 4
  store i32 4, ptr %y, align 4
  store i32 5, ptr %m, align 4
  call void @test1(i8 noundef signext 97, ptr noundef %x, ptr noundef %y)
  call void @test2(float noundef 1.000000e+00, float noundef 2.000000e+00, ptr noundef %m, ptr noundef %x)
  call void @test3(ptr noundef %m)
  %0 = load i32, ptr %x, align 4
  %1 = load i32, ptr %y, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32, ptr %m, align 4
  %add1 = add nsw i32 %add, %2
  ret i32 %add1
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
