; ModuleID = '<stdin>'
source_filename = "tests/testing/huffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [26 x i8] c"error: bit code overflow\0A\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"error: file has only one value!\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"error: no compression\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global ptr, align 8
@.str.5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @generate_test_data(i64 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef %0) #7
  br label %3

3:                                                ; preds = %11, %1
  %.01 = phi ptr [ %2, %1 ], [ %10, %11 ]
  %.0 = phi i32 [ 0, %1 ], [ %12, %11 ]
  %4 = sext i32 %.0 to i64
  %5 = icmp ult i64 %4, %0
  br i1 %5, label %6, label %13

6:                                                ; preds = %3
  %7 = call i64 @random4()
  %8 = getelementptr inbounds i8, ptr @.str, i64 %7
  %9 = load i8, ptr %8, align 1
  store i8 %9, ptr %.01, align 1
  %10 = getelementptr inbounds i8, ptr %.01, i32 1
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

13:                                               ; preds = %3
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @compdecomp(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca [512 x i64], align 16
  %4 = alloca [256 x i64], align 16
  %5 = alloca [512 x i32], align 16
  %6 = alloca [256 x i64], align 16
  %7 = alloca [256 x i8], align 16
  %8 = alloca [256 x i64], align 16
  %9 = alloca [256 x i8], align 16
  %10 = add i64 %1, 1
  %11 = call noalias ptr @malloc(i64 noundef %10) #7
  %12 = mul i64 1, %10
  call void @llvm.memset.p0.i64(ptr align 1 %11, i8 0, i64 %12, i1 false)
  %13 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 4096, i1 false)
  %14 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 2048, i1 false)
  %15 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %15, i8 0, i64 2048, i1 false)
  %16 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 2048, i1 false)
  %17 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %17, i8 0, i64 256, i1 false)
  br label %18

18:                                               ; preds = %27, %2
  %.033 = phi ptr [ %0, %2 ], [ %26, %27 ]
  %.02 = phi i64 [ 0, %2 ], [ %28, %27 ]
  %19 = icmp ult i64 %.02, %1
  br i1 %19, label %20, label %29

20:                                               ; preds = %18
  %21 = load i8, ptr %.033, align 1
  %22 = zext i8 %21 to i64
  %23 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %22
  %24 = load i64, ptr %23, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr %23, align 8
  %26 = getelementptr inbounds i8, ptr %.033, i32 1
  br label %27

27:                                               ; preds = %20
  %28 = add i64 %.02, 1
  br label %18, !llvm.loop !8

29:                                               ; preds = %18
  br label %30

30:                                               ; preds = %40, %29
  %.010 = phi i64 [ 0, %29 ], [ %.111, %40 ]
  %.13 = phi i64 [ 0, %29 ], [ %41, %40 ]
  %31 = icmp ult i64 %.13, 256
  br i1 %31, label %32, label %42

32:                                               ; preds = %30
  %33 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %.13
  %34 = load i64, ptr %33, align 8
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %32
  %37 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 %.010
  store i64 %.13, ptr %37, align 8
  %38 = add i64 %.010, 1
  br label %39

39:                                               ; preds = %36, %32
  %.111 = phi i64 [ %38, %36 ], [ %.010, %32 ]
  br label %40

40:                                               ; preds = %39
  %41 = add i64 %.13, 1
  br label %30, !llvm.loop !9

42:                                               ; preds = %30
  br label %43

43:                                               ; preds = %48, %42
  %.24 = phi i64 [ %.010, %42 ], [ %49, %48 ]
  %44 = icmp ugt i64 %.24, 0
  br i1 %44, label %45, label %50

45:                                               ; preds = %43
  %46 = trunc i64 %.010 to i32
  %47 = trunc i64 %.24 to i32
  call void @heap_adjust(ptr noundef %13, ptr noundef %14, i32 noundef %46, i32 noundef %47)
  br label %48

48:                                               ; preds = %45
  %49 = add i64 %.24, -1
  br label %43, !llvm.loop !10

50:                                               ; preds = %43
  br label %51

51:                                               ; preds = %53, %50
  %.212 = phi i64 [ %.010, %50 ], [ %54, %53 ]
  %52 = icmp ugt i64 %.212, 1
  br i1 %52, label %53, label %74

53:                                               ; preds = %51
  %54 = add i64 %.212, -1
  %55 = load i64, ptr %14, align 16
  %56 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 %54
  %57 = load i64, ptr %56, align 8
  store i64 %57, ptr %14, align 16
  %58 = trunc i64 %54 to i32
  call void @heap_adjust(ptr noundef %13, ptr noundef %14, i32 noundef %58, i32 noundef 1)
  %59 = load i64, ptr %14, align 16
  %60 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %59
  %61 = load i64, ptr %60, align 8
  %62 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %55
  %63 = load i64, ptr %62, align 8
  %64 = add i64 %61, %63
  %65 = add i64 256, %54
  %66 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %65
  store i64 %64, ptr %66, align 8
  %67 = trunc i64 %65 to i32
  %68 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %55
  store i32 %67, ptr %68, align 4
  %69 = sub i64 -256, %54
  %70 = trunc i64 %69 to i32
  %71 = load i64, ptr %14, align 16
  %72 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %71
  store i32 %70, ptr %72, align 4
  store i64 %65, ptr %14, align 16
  %73 = trunc i64 %54 to i32
  call void @heap_adjust(ptr noundef %13, ptr noundef %14, i32 noundef %73, i32 noundef 1)
  br label %51, !llvm.loop !11

74:                                               ; preds = %51
  %75 = add i64 256, %.212
  %76 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %75
  store i32 0, ptr %76, align 4
  br label %77

77:                                               ; preds = %112, %74
  %.045 = phi i64 [ 0, %74 ], [ %.247, %112 ]
  %.042 = phi i64 [ 0, %74 ], [ %113, %112 ]
  %.039 = phi i64 [ 0, %74 ], [ %.241, %112 ]
  %78 = icmp ult i64 %.042, 256
  br i1 %78, label %79, label %114

79:                                               ; preds = %77
  %80 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %.042
  %81 = load i64, ptr %80, align 8
  %82 = icmp ne i64 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.042
  store i64 0, ptr %84, align 8
  %85 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.042
  store i8 0, ptr %85, align 1
  br label %111

86:                                               ; preds = %79
  %87 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %.042
  %88 = load i32, ptr %87, align 4
  br label %89

89:                                               ; preds = %95, %86
  %.043 = phi i64 [ 0, %86 ], [ %.144, %95 ]
  %.037 = phi i32 [ %88, %86 ], [ %98, %95 ]
  %.05 = phi i64 [ 1, %86 ], [ %99, %95 ]
  %.3 = phi i64 [ 0, %86 ], [ %100, %95 ]
  %90 = icmp ne i32 %.037, 0
  br i1 %90, label %91, label %101

91:                                               ; preds = %89
  br i1 %90, label %92, label %95

92:                                               ; preds = %91
  %93 = add i64 %.043, %.05
  %94 = sub nsw i32 0, %.037
  br label %95

95:                                               ; preds = %92, %91
  %.144 = phi i64 [ %93, %92 ], [ %.043, %91 ]
  %.138 = phi i32 [ %94, %92 ], [ %.037, %91 ]
  %96 = sext i32 %.138 to i64
  %97 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %96
  %98 = load i32, ptr %97, align 4
  %99 = shl i64 %.05, 1
  %100 = add i64 %.3, 1
  br label %89, !llvm.loop !12

101:                                              ; preds = %89
  %102 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.042
  store i64 %.043, ptr %102, align 8
  %103 = trunc i64 %.3 to i8
  %104 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.042
  store i8 %103, ptr %104, align 1
  %105 = icmp ugt i64 %.043, %.045
  br i1 %105, label %106, label %107

106:                                              ; preds = %101
  br label %107

107:                                              ; preds = %106, %101
  %.146 = phi i64 [ %.043, %106 ], [ %.045, %101 ]
  %108 = icmp ugt i64 %.3, %.039
  br i1 %108, label %109, label %110

109:                                              ; preds = %107
  br label %110

110:                                              ; preds = %109, %107
  %.140 = phi i64 [ %.3, %109 ], [ %.039, %107 ]
  br label %111

111:                                              ; preds = %110, %83
  %.247 = phi i64 [ %.146, %110 ], [ %.045, %83 ]
  %.241 = phi i64 [ %.140, %110 ], [ %.039, %83 ]
  br label %112

112:                                              ; preds = %111
  %113 = add i64 %.042, 1
  br label %77, !llvm.loop !13

114:                                              ; preds = %77
  %115 = icmp ugt i64 %.039, 64
  br i1 %115, label %116, label %119

116:                                              ; preds = %114
  %117 = load ptr, ptr @stderr, align 8
  %118 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %117, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

119:                                              ; preds = %114
  %120 = icmp eq i64 %.045, 0
  br i1 %120, label %121, label %124

121:                                              ; preds = %119
  %122 = load ptr, ptr @stderr, align 8
  %123 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %122, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

124:                                              ; preds = %119
  br label %125

125:                                              ; preds = %175, %124
  %.134 = phi ptr [ %0, %124 ], [ %174, %175 ]
  %.028 = phi i64 [ 0, %124 ], [ %.129, %175 ]
  %.024 = phi i8 [ 0, %124 ], [ %.125, %175 ]
  %.16 = phi i64 [ 0, %124 ], [ %176, %175 ]
  %.01 = phi i32 [ -1, %124 ], [ %.1, %175 ]
  %126 = icmp ult i64 %.16, %1
  br i1 %126, label %127, label %177

127:                                              ; preds = %125
  %128 = load i8, ptr %.134, align 1
  %129 = zext i8 %128 to i64
  %130 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %129
  %131 = load i8, ptr %130, align 1
  %132 = zext i8 %131 to i32
  %133 = sub nsw i32 %132, 1
  %134 = shl i32 1, %133
  %135 = sext i32 %134 to i64
  br label %136

136:                                              ; preds = %171, %127
  %.129 = phi i64 [ %.028, %127 ], [ %.230, %171 ]
  %.125 = phi i8 [ %.024, %127 ], [ %.327, %171 ]
  %.015 = phi i64 [ %135, %127 ], [ %170, %171 ]
  %.4 = phi i64 [ 0, %127 ], [ %172, %171 ]
  %.1 = phi i32 [ %.01, %127 ], [ %.2, %171 ]
  %137 = load i8, ptr %.134, align 1
  %138 = zext i8 %137 to i64
  %139 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %138
  %140 = load i8, ptr %139, align 1
  %141 = zext i8 %140 to i64
  %142 = icmp ult i64 %.4, %141
  br i1 %142, label %143, label %173

143:                                              ; preds = %136
  %144 = icmp eq i32 %.1, 7
  br i1 %144, label %145, label %153

145:                                              ; preds = %143
  %146 = getelementptr inbounds i8, ptr %11, i64 %.129
  store i8 %.125, ptr %146, align 1
  %147 = add i64 %.129, 1
  %148 = icmp eq i64 %147, %1
  br i1 %148, label %149, label %152

149:                                              ; preds = %145
  %150 = load ptr, ptr @stderr, align 8
  %151 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %150, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

152:                                              ; preds = %145
  br label %158

153:                                              ; preds = %143
  %154 = add nsw i32 %.1, 1
  %155 = sext i8 %.125 to i32
  %156 = shl i32 %155, 1
  %157 = trunc i32 %156 to i8
  br label %158

158:                                              ; preds = %153, %152
  %.230 = phi i64 [ %147, %152 ], [ %.129, %153 ]
  %.226 = phi i8 [ 0, %152 ], [ %157, %153 ]
  %.2 = phi i32 [ 0, %152 ], [ %154, %153 ]
  %159 = load i8, ptr %.134, align 1
  %160 = zext i8 %159 to i64
  %161 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %160
  %162 = load i64, ptr %161, align 8
  %163 = and i64 %162, %.015
  %164 = icmp ne i64 %163, 0
  br i1 %164, label %165, label %169

165:                                              ; preds = %158
  %166 = sext i8 %.226 to i32
  %167 = or i32 %166, 1
  %168 = trunc i32 %167 to i8
  br label %169

169:                                              ; preds = %165, %158
  %.327 = phi i8 [ %168, %165 ], [ %.226, %158 ]
  %170 = lshr i64 %.015, 1
  br label %171

171:                                              ; preds = %169
  %172 = add i64 %.4, 1
  br label %136, !llvm.loop !14

173:                                              ; preds = %136
  %174 = getelementptr inbounds i8, ptr %.134, i32 1
  br label %175

175:                                              ; preds = %173
  %176 = add i64 %.16, 1
  br label %125, !llvm.loop !15

177:                                              ; preds = %125
  %178 = sub nsw i32 7, %.01
  %179 = sext i8 %.024 to i32
  %180 = shl i32 %179, %178
  %181 = trunc i32 %180 to i8
  %182 = getelementptr inbounds i8, ptr %11, i64 %.028
  store i8 %181, ptr %182, align 1
  %183 = add i64 %.028, 1
  %184 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %184, i8 0, i64 2048, i1 false)
  %185 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  br label %186

186:                                              ; preds = %223, %177
  %.27 = phi i64 [ 0, %177 ], [ %224, %223 ]
  %.0 = phi ptr [ %185, %177 ], [ %190, %223 ]
  %187 = icmp ult i64 %.27, 256
  br i1 %187, label %188, label %225

188:                                              ; preds = %186
  %189 = trunc i64 %.27 to i8
  store i8 %189, ptr %.0, align 1
  %190 = getelementptr inbounds i8, ptr %.0, i32 1
  %191 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.27
  %192 = load i64, ptr %191, align 8
  %193 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %194 = load i8, ptr %193, align 1
  %195 = zext i8 %194 to i64
  %196 = or i64 %192, %195
  %197 = icmp ne i64 %196, 0
  br i1 %197, label %198, label %222

198:                                              ; preds = %188
  %199 = load i8, ptr %193, align 1
  %200 = zext i8 %199 to i32
  %201 = sub nsw i32 %200, 1
  %202 = shl i32 1, %201
  %203 = sext i32 %202 to i64
  br label %204

204:                                              ; preds = %218, %198
  %.019 = phi i64 [ 0, %198 ], [ %.120, %218 ]
  %.116 = phi i64 [ %203, %198 ], [ %217, %218 ]
  %.5 = phi i64 [ 0, %198 ], [ %219, %218 ]
  %205 = load i8, ptr %193, align 1
  %206 = zext i8 %205 to i64
  %207 = icmp ult i64 %.5, %206
  br i1 %207, label %208, label %220

208:                                              ; preds = %204
  %209 = mul i64 %.019, 2
  %210 = add i64 %209, 1
  %211 = load i64, ptr %191, align 8
  %212 = and i64 %211, %.116
  %213 = icmp ne i64 %212, 0
  br i1 %213, label %214, label %216

214:                                              ; preds = %208
  %215 = add i64 %210, 1
  br label %216

216:                                              ; preds = %214, %208
  %.120 = phi i64 [ %215, %214 ], [ %210, %208 ]
  %217 = lshr i64 %.116, 1
  br label %218

218:                                              ; preds = %216
  %219 = add i64 %.5, 1
  br label %204, !llvm.loop !16

220:                                              ; preds = %204
  %221 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.27
  store i64 %.019, ptr %221, align 8
  br label %222

222:                                              ; preds = %220, %188
  br label %223

223:                                              ; preds = %222
  %224 = add i64 %.27, 1
  br label %186, !llvm.loop !17

225:                                              ; preds = %186
  br label %226

226:                                              ; preds = %254, %225
  %.6 = phi i64 [ 1, %225 ], [ %255, %254 ]
  %227 = icmp ult i64 %.6, 256
  br i1 %227, label %228, label %256

228:                                              ; preds = %226
  %229 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.6
  %230 = load i64, ptr %229, align 8
  %231 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.6
  %232 = load i8, ptr %231, align 1
  br label %233

233:                                              ; preds = %242, %228
  %.38 = phi i64 [ %.6, %228 ], [ %250, %242 ]
  %234 = icmp ne i64 %.38, 0
  br i1 %234, label %235, label %240

235:                                              ; preds = %233
  %236 = sub i64 %.38, 1
  %237 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %236
  %238 = load i64, ptr %237, align 8
  %239 = icmp ugt i64 %238, %230
  br label %240

240:                                              ; preds = %235, %233
  %241 = phi i1 [ false, %233 ], [ %239, %235 ]
  br i1 %241, label %242, label %251

242:                                              ; preds = %240
  %243 = sub i64 %.38, 1
  %244 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %243
  %245 = load i64, ptr %244, align 8
  %246 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.38
  store i64 %245, ptr %246, align 8
  %247 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %243
  %248 = load i8, ptr %247, align 1
  %249 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.38
  store i8 %248, ptr %249, align 1
  %250 = add i64 %.38, -1
  br label %233, !llvm.loop !18

251:                                              ; preds = %240
  %252 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.38
  store i64 %230, ptr %252, align 8
  %253 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.38
  store i8 %232, ptr %253, align 1
  br label %254

254:                                              ; preds = %251
  %255 = add i64 %.6, 1
  br label %226, !llvm.loop !19

256:                                              ; preds = %226
  br label %257

257:                                              ; preds = %262, %256
  %.49 = phi i64 [ 0, %256 ], [ %263, %262 ]
  %258 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.49
  %259 = load i64, ptr %258, align 8
  %260 = icmp eq i64 %259, 0
  br i1 %260, label %261, label %264

261:                                              ; preds = %257
  br label %262

262:                                              ; preds = %261
  %263 = add i64 %.49, 1
  br label %257, !llvm.loop !20

264:                                              ; preds = %257
  br label %265

265:                                              ; preds = %297, %264
  %.235 = phi ptr [ %0, %264 ], [ %.336, %297 ]
  %.031 = phi ptr [ %11, %264 ], [ %.132, %297 ]
  %.221 = phi i64 [ 0, %264 ], [ %.423, %297 ]
  %.217 = phi i64 [ 128, %264 ], [ %.318, %297 ]
  %.313 = phi i64 [ 0, %264 ], [ %.414, %297 ]
  %.7 = phi i64 [ %.49, %264 ], [ %.9, %297 ]
  %266 = icmp ult i64 %.313, %1
  br i1 %266, label %267, label %298

267:                                              ; preds = %265
  %268 = mul i64 %.221, 2
  %269 = add i64 %268, 1
  %270 = load i8, ptr %.031, align 1
  %271 = zext i8 %270 to i64
  %272 = and i64 %271, %.217
  %273 = icmp ne i64 %272, 0
  br i1 %273, label %274, label %276

274:                                              ; preds = %267
  %275 = add i64 %269, 1
  br label %276

276:                                              ; preds = %274, %267
  %.322 = phi i64 [ %275, %274 ], [ %269, %267 ]
  br label %277

277:                                              ; preds = %281, %276
  %.8 = phi i64 [ %.7, %276 ], [ %282, %281 ]
  %278 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.8
  %279 = load i64, ptr %278, align 8
  %280 = icmp ult i64 %279, %.322
  br i1 %280, label %281, label %283

281:                                              ; preds = %277
  %282 = add i64 %.8, 1
  br label %277, !llvm.loop !21

283:                                              ; preds = %277
  %284 = load i64, ptr %278, align 8
  %285 = icmp eq i64 %.322, %284
  br i1 %285, label %286, label %291

286:                                              ; preds = %283
  %287 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.8
  %288 = load i8, ptr %287, align 1
  store i8 %288, ptr %.235, align 1
  %289 = getelementptr inbounds i8, ptr %.235, i32 1
  %290 = add i64 %.313, 1
  br label %291

291:                                              ; preds = %286, %283
  %.336 = phi ptr [ %289, %286 ], [ %.235, %283 ]
  %.423 = phi i64 [ 0, %286 ], [ %.322, %283 ]
  %.414 = phi i64 [ %290, %286 ], [ %.313, %283 ]
  %.9 = phi i64 [ %.49, %286 ], [ %.8, %283 ]
  %292 = icmp ugt i64 %.217, 1
  br i1 %292, label %293, label %295

293:                                              ; preds = %291
  %294 = lshr i64 %.217, 1
  br label %297

295:                                              ; preds = %291
  %296 = getelementptr inbounds i8, ptr %.031, i32 1
  br label %297

297:                                              ; preds = %295, %293
  %.132 = phi ptr [ %.031, %293 ], [ %296, %295 ]
  %.318 = phi i64 [ %294, %293 ], [ 128, %295 ]
  br label %265, !llvm.loop !22

298:                                              ; preds = %265
  call void @free(ptr noundef %11) #9
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal void @heap_adjust(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = getelementptr inbounds i64, ptr %1, i32 -1
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds i64, ptr %5, i64 %6
  %8 = load i64, ptr %7, align 8
  %9 = trunc i64 %8 to i32
  br label %10

10:                                               ; preds = %41, %4
  %.01 = phi i32 [ %3, %4 ], [ %.0, %41 ]
  %11 = sdiv i32 %2, 2
  %12 = icmp sle i32 %.01, %11
  br i1 %12, label %13, label %47

13:                                               ; preds = %10
  %14 = add nsw i32 %.01, %.01
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %16, label %30

16:                                               ; preds = %13
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i64, ptr %5, i64 %17
  %19 = load i64, ptr %18, align 8
  %20 = getelementptr inbounds i64, ptr %0, i64 %19
  %21 = load i64, ptr %20, align 8
  %22 = add nsw i32 %14, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i64, ptr %5, i64 %23
  %25 = load i64, ptr %24, align 8
  %26 = getelementptr inbounds i64, ptr %0, i64 %25
  %27 = load i64, ptr %26, align 8
  %28 = icmp ugt i64 %21, %27
  br i1 %28, label %29, label %30

29:                                               ; preds = %16
  br label %30

30:                                               ; preds = %29, %16, %13
  %.0 = phi i32 [ %22, %29 ], [ %14, %16 ], [ %14, %13 ]
  %31 = sext i32 %9 to i64
  %32 = getelementptr inbounds i64, ptr %0, i64 %31
  %33 = load i64, ptr %32, align 8
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds i64, ptr %5, i64 %34
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds i64, ptr %0, i64 %36
  %38 = load i64, ptr %37, align 8
  %39 = icmp ult i64 %33, %38
  br i1 %39, label %40, label %41

40:                                               ; preds = %30
  br label %47

41:                                               ; preds = %30
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds i64, ptr %5, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = sext i32 %.01 to i64
  %46 = getelementptr inbounds i64, ptr %5, i64 %45
  store i64 %44, ptr %46, align 8
  br label %10, !llvm.loop !23

47:                                               ; preds = %40, %10
  %48 = sext i32 %9 to i64
  %49 = sext i32 %.01 to i64
  %50 = getelementptr inbounds i64, ptr %5, i64 %49
  store i64 %48, ptr %50, align 8
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp sgt i32 %0, 1
  br i1 %3, label %4, label %17

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %14, %4
  %.01 = phi i32 [ 1, %4 ], [ %15, %14 ]
  %6 = icmp slt i32 %.01, %0
  br i1 %6, label %7, label %16

7:                                                ; preds = %5
  %8 = getelementptr inbounds ptr, ptr %1, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str.4) #10
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %7
  br label %16

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !24

16:                                               ; preds = %12, %5
  %.0 = phi i8 [ 1, %12 ], [ 0, %5 ]
  br label %17

17:                                               ; preds = %16, %2
  %.1 = phi i8 [ %.0, %16 ], [ 0, %2 ]
  %18 = call ptr @generate_test_data(i64 noundef 10000000)
  br label %19

19:                                               ; preds = %22, %17
  %.12 = phi i32 [ 0, %17 ], [ %23, %22 ]
  %20 = icmp slt i32 %.12, 30
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  call void @compdecomp(ptr noundef %18, i64 noundef 10000000)
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.12, 1
  br label %19, !llvm.loop !25

24:                                               ; preds = %19
  call void @free(ptr noundef %18) #9
  %25 = trunc i8 %.1 to i1
  br i1 %25, label %26, label %29

26:                                               ; preds = %24
  %27 = load ptr, ptr @stdout, align 8
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %27, ptr noundef @.str.5, double noundef 0.000000e+00)
  br label %32

29:                                               ; preds = %24
  %30 = load ptr, ptr @stdout, align 8
  %31 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %30, ptr noundef @.str.6, double noundef 0.000000e+00)
  br label %32

32:                                               ; preds = %29, %26
  %33 = load ptr, ptr @stdout, align 8
  %34 = call i32 @fflush(ptr noundef %33)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #6

declare i32 @fflush(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define internal i64 @random4() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = xor i64 %1, 123459876
  store i64 %2, ptr @seed, align 8
  %3 = load i64, ptr @seed, align 8
  %4 = sdiv i64 %3, 127773
  %5 = load i64, ptr @seed, align 8
  %6 = mul nsw i64 %4, 127773
  %7 = sub nsw i64 %5, %6
  %8 = mul nsw i64 16807, %7
  %9 = mul nsw i64 2836, %4
  %10 = sub nsw i64 %8, %9
  store i64 %10, ptr @seed, align 8
  %11 = load i64, ptr @seed, align 8
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %0
  %14 = load i64, ptr @seed, align 8
  %15 = add nsw i64 %14, 2147483647
  store i64 %15, ptr @seed, align 8
  br label %16

16:                                               ; preds = %13, %0
  %17 = load i64, ptr @seed, align 8
  %18 = srem i64 %17, 32
  %19 = load i64, ptr @seed, align 8
  %20 = xor i64 %19, 123459876
  store i64 %20, ptr @seed, align 8
  ret i64 %18
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind readonly willreturn }

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
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
