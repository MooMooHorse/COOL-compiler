; ModuleID = '<stdin>'
source_filename = "tests/correctness/la3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@m = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @crazy_loops(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 5, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %10, %11
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %3, align 4
  %15 = mul nsw i32 %13, %14
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %15, %16
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, ptr %5, align 4
  br label %20

20:                                               ; preds = %35, %1
  br label %21

21:                                               ; preds = %27, %20
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %5, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %32

27:                                               ; preds = %21
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %21, !llvm.loop !6

32:                                               ; preds = %21
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %35

35:                                               ; preds = %32
  %36 = load i32, ptr %3, align 4
  %37 = load i32, ptr %2, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %20, label %39, !llvm.loop !8

39:                                               ; preds = %35
  br label %40

40:                                               ; preds = %55, %39
  br label %41

41:                                               ; preds = %47, %40
  %42 = load i32, ptr %3, align 4
  %43 = load i32, ptr %4, align 4
  %44 = add nsw i32 %42, %43
  %45 = load i32, ptr %5, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %52

47:                                               ; preds = %41
  %48 = load i32, ptr %3, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %3, align 4
  %50 = load i32, ptr %4, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %4, align 4
  br label %41, !llvm.loop !9

52:                                               ; preds = %41
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %5, align 4
  br label %55

55:                                               ; preds = %52
  %56 = load i32, ptr %3, align 4
  %57 = load i32, ptr %2, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %40, label %59, !llvm.loop !10

59:                                               ; preds = %55
  %60 = load i32, ptr %3, align 4
  store i32 %60, ptr @m, align 16
  %61 = load i32, ptr %4, align 4
  store i32 %61, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %62 = load i32, ptr %5, align 4
  store i32 %62, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %63 = load i32, ptr @m, align 16
  %64 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %65 = add nsw i32 %63, %64
  %66 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %67 = add nsw i32 %65, %66
  store i32 %67, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 3), align 4
  %68 = load i32, ptr @m, align 16
  %69 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %70 = add nsw i32 %68, %69
  %71 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %72 = sub nsw i32 %70, %71
  store i32 %72, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 4), align 16
  %73 = load i32, ptr @m, align 16
  %74 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %75 = sub nsw i32 %73, %74
  %76 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %77 = add nsw i32 %75, %76
  store i32 %77, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 5), align 4
  %78 = load i32, ptr @m, align 16
  %79 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 1), align 4
  %80 = sub nsw i32 %78, %79
  %81 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %82 = sub nsw i32 %80, %81
  store i32 %82, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 6), align 8
  store i32 0, ptr %6, align 4
  br label %83

83:                                               ; preds = %95, %59
  %84 = load i32, ptr %6, align 4
  %85 = icmp slt i32 %84, 10
  br i1 %85, label %86, label %98

86:                                               ; preds = %83
  %87 = load i32, ptr %6, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = add nsw i32 %90, 1
  %92 = load i32, ptr %6, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %93
  store i32 %91, ptr %94, align 4
  br label %95

95:                                               ; preds = %86
  %96 = load i32, ptr %6, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %6, align 4
  br label %83, !llvm.loop !11

98:                                               ; preds = %83
  store i32 1, ptr %7, align 4
  br label %99

99:                                               ; preds = %116, %98
  %100 = load i32, ptr %7, align 4
  %101 = icmp slt i32 %100, 10
  br i1 %101, label %102, label %119

102:                                              ; preds = %99
  %103 = load i32, ptr %7, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = load i32, ptr %7, align 4
  %108 = sub nsw i32 %107, 1
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %109
  %111 = load i32, ptr %110, align 4
  %112 = add nsw i32 %106, %111
  %113 = load i32, ptr %7, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %114
  store i32 %112, ptr %115, align 4
  br label %116

116:                                              ; preds = %102
  %117 = load i32, ptr %7, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, ptr %7, align 4
  br label %99, !llvm.loop !12

119:                                              ; preds = %99
  store i32 0, ptr %8, align 4
  br label %120

120:                                              ; preds = %137, %119
  %121 = load i32, ptr %8, align 4
  %122 = icmp slt i32 %121, 9
  br i1 %122, label %123, label %140

123:                                              ; preds = %120
  %124 = load i32, ptr %8, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %125
  %127 = load i32, ptr %126, align 4
  %128 = load i32, ptr %8, align 4
  %129 = add nsw i32 %128, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %130
  %132 = load i32, ptr %131, align 4
  %133 = add nsw i32 %127, %132
  %134 = load i32, ptr %8, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %135
  store i32 %133, ptr %136, align 4
  br label %137

137:                                              ; preds = %123
  %138 = load i32, ptr %8, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, ptr %8, align 4
  br label %120, !llvm.loop !13

140:                                              ; preds = %120
  br label %141

141:                                              ; preds = %180, %140
  br label %142

142:                                              ; preds = %148, %141
  %143 = load i32, ptr %3, align 4
  %144 = load i32, ptr %4, align 4
  %145 = add nsw i32 %143, %144
  %146 = load i32, ptr %5, align 4
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %148, label %153

148:                                              ; preds = %142
  %149 = load i32, ptr %3, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, ptr %3, align 4
  %151 = load i32, ptr %4, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, ptr %4, align 4
  br label %142, !llvm.loop !14

153:                                              ; preds = %142
  %154 = load i32, ptr %5, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %5, align 4
  %156 = load i32, ptr %4, align 4
  %157 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  %158 = add nsw i32 %157, %156
  store i32 %158, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  store i32 0, ptr %9, align 4
  br label %159

159:                                              ; preds = %176, %153
  %160 = load i32, ptr %9, align 4
  %161 = icmp slt i32 %160, 9
  br i1 %161, label %162, label %179

162:                                              ; preds = %159
  %163 = load i32, ptr %9, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %164
  %166 = load i32, ptr %165, align 4
  %167 = load i32, ptr %9, align 4
  %168 = add nsw i32 %167, 1
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %169
  %171 = load i32, ptr %170, align 4
  %172 = add nsw i32 %166, %171
  %173 = load i32, ptr %9, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [10 x i32], ptr @m, i64 0, i64 %174
  store i32 %172, ptr %175, align 4
  br label %176

176:                                              ; preds = %162
  %177 = load i32, ptr %9, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, ptr %9, align 4
  br label %159, !llvm.loop !15

179:                                              ; preds = %159
  br label %180

180:                                              ; preds = %179
  %181 = load i32, ptr @m, align 16
  %182 = load i32, ptr %2, align 4
  %183 = icmp slt i32 %181, %182
  br i1 %183, label %141, label %184, !llvm.loop !16

184:                                              ; preds = %180
  %185 = load i32, ptr getelementptr inbounds ([10 x i32], ptr @m, i64 0, i64 2), align 8
  ret i32 %185
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i32 @crazy_loops(i32 noundef 1000)
  ret i32 %2
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
!16 = distinct !{!16, !7}
