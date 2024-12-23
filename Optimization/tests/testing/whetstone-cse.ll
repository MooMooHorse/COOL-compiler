; ModuleID = '<stdin>'
source_filename = "tests/testing/whetstone.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1
@T = dso_local global double 0.000000e+00, align 8
@T1 = dso_local global double 0.000000e+00, align 8
@T2 = dso_local global double 0.000000e+00, align 8
@E1 = dso_local global [5 x double] zeroinitializer, align 16
@J = dso_local global i32 0, align 4
@K = dso_local global i32 0, align 4
@L = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca double, align 8
  br label %4

4:                                                ; preds = %36, %2
  %.07 = phi i32 [ 1, %2 ], [ %37, %36 ]
  %.02 = phi i64 [ 100000, %2 ], [ %.13, %36 ]
  %.01 = phi i32 [ 0, %2 ], [ %.1, %36 ]
  %5 = icmp slt i32 %.07, %0
  br i1 %5, label %6, label %38

6:                                                ; preds = %4
  %7 = sext i32 %.07 to i64
  %8 = getelementptr inbounds ptr, ptr %1, i64 %7
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @strncmp(ptr noundef %9, ptr noundef @.str, i64 noundef 2) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %20, label %12

12:                                               ; preds = %6
  %13 = sext i32 %.07 to i64
  %14 = getelementptr inbounds ptr, ptr %1, i64 %13
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds i8, ptr %15, i64 0
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 99
  br i1 %19, label %20, label %21

20:                                               ; preds = %12, %6
  br label %36

21:                                               ; preds = %12
  %22 = sext i32 %.07 to i64
  %23 = getelementptr inbounds ptr, ptr %1, i64 %22
  %24 = load ptr, ptr %23, align 8
  %25 = call i64 @atol(ptr noundef %24) #4
  %26 = icmp sgt i64 %25, 0
  br i1 %26, label %27, label %32

27:                                               ; preds = %21
  %28 = sext i32 %.07 to i64
  %29 = getelementptr inbounds ptr, ptr %1, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = call i64 @atol(ptr noundef %30) #4
  br label %35

32:                                               ; preds = %21
  %33 = load ptr, ptr @stderr, align 8
  %34 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef @.str.1)
  br label %353

35:                                               ; preds = %27
  br label %36

36:                                               ; preds = %35, %20
  %.13 = phi i64 [ %.02, %20 ], [ %31, %35 ]
  %.1 = phi i32 [ 1, %20 ], [ %.01, %35 ]
  %37 = add nsw i32 %.07, 1
  br label %4, !llvm.loop !6

38:                                               ; preds = %4
  br label %39

39:                                               ; preds = %351, %38
  %40 = call i64 @time(ptr noundef null) #5
  store double 4.999750e-01, ptr @T, align 8
  store double 5.002500e-01, ptr @T1, align 8
  store double 2.000000e+00, ptr @T2, align 8
  br label %41

41:                                               ; preds = %346, %39
  %.06 = phi i32 [ 1, %39 ], [ %344, %346 ]
  %42 = mul nsw i64 12, %.02
  %43 = mul nsw i64 14, %.02
  %44 = mul nsw i64 345, %.02
  %45 = mul nsw i64 210, %.02
  %46 = mul nsw i64 32, %.02
  %47 = mul nsw i64 899, %.02
  %48 = mul nsw i64 616, %.02
  %49 = mul nsw i64 93, %.02
  br label %50

50:                                               ; preds = %74, %41
  %.014 = phi double [ 1.000000e+00, %41 ], [ %57, %74 ]
  %.013 = phi double [ -1.000000e+00, %41 ], [ %62, %74 ]
  %.012 = phi double [ -1.000000e+00, %41 ], [ %67, %74 ]
  %.011 = phi double [ -1.000000e+00, %41 ], [ %73, %74 ]
  %.04 = phi i64 [ 1, %41 ], [ %75, %74 ]
  %51 = icmp sle i64 %.04, 0
  br i1 %51, label %52, label %76

52:                                               ; preds = %50
  %53 = fadd double %.014, %.013
  %54 = fadd double %53, %.012
  %55 = fsub double %54, %.011
  %56 = load double, ptr @T, align 8
  %57 = fmul double %55, %56
  %58 = fadd double %57, %.013
  %59 = fsub double %58, %.012
  %60 = fadd double %59, %.011
  %61 = load double, ptr @T, align 8
  %62 = fmul double %60, %61
  %63 = fsub double %57, %62
  %64 = fadd double %63, %.012
  %65 = fadd double %64, %.011
  %66 = load double, ptr @T, align 8
  %67 = fmul double %65, %66
  %68 = fneg double %57
  %69 = fadd double %68, %62
  %70 = fadd double %69, %67
  %71 = fadd double %70, %.011
  %72 = load double, ptr @T, align 8
  %73 = fmul double %71, %72
  br label %74

74:                                               ; preds = %52
  %75 = add nsw i64 %.04, 1
  br label %50, !llvm.loop !8

76:                                               ; preds = %50
  %77 = icmp eq i32 %.06, 1
  br i1 %77, label %78, label %79

78:                                               ; preds = %76
  call void @POUT(i64 noundef 0, i64 noundef 0, i64 noundef 0, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %79

79:                                               ; preds = %78, %76
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %80

80:                                               ; preds = %120, %79
  %.15 = phi i64 [ 1, %79 ], [ %121, %120 ]
  %81 = icmp sle i64 %.15, %42
  br i1 %81, label %82, label %122

82:                                               ; preds = %80
  %83 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %84 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %85 = fadd double %83, %84
  %86 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %87 = fadd double %85, %86
  %88 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %89 = fsub double %87, %88
  %90 = load double, ptr @T, align 8
  %91 = fmul double %89, %90
  store double %91, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %92 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %93 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %94 = fadd double %92, %93
  %95 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %96 = fsub double %94, %95
  %97 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %98 = fadd double %96, %97
  %99 = load double, ptr @T, align 8
  %100 = fmul double %98, %99
  store double %100, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %101 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %102 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %103 = fsub double %101, %102
  %104 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %105 = fadd double %103, %104
  %106 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %107 = fadd double %105, %106
  %108 = load double, ptr @T, align 8
  %109 = fmul double %107, %108
  store double %109, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %110 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %111 = fneg double %110
  %112 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %113 = fadd double %111, %112
  %114 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %115 = fadd double %113, %114
  %116 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %117 = fadd double %115, %116
  %118 = load double, ptr @T, align 8
  %119 = fmul double %117, %118
  store double %119, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %120

120:                                              ; preds = %82
  %121 = add nsw i64 %.15, 1
  br label %80, !llvm.loop !9

122:                                              ; preds = %80
  br i1 %77, label %123, label %128

123:                                              ; preds = %122
  %124 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %125 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %126 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %127 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %42, i64 noundef %43, i64 noundef %42, double noundef %124, double noundef %125, double noundef %126, double noundef %127)
  br label %128

128:                                              ; preds = %123, %122
  br label %129

129:                                              ; preds = %132, %128
  %.2 = phi i64 [ 1, %128 ], [ %133, %132 ]
  %130 = icmp sle i64 %.2, %43
  br i1 %130, label %131, label %134

131:                                              ; preds = %129
  call void @PA(ptr noundef @E1)
  br label %132

132:                                              ; preds = %131
  %133 = add nsw i64 %.2, 1
  br label %129, !llvm.loop !10

134:                                              ; preds = %129
  br i1 %77, label %135, label %140

135:                                              ; preds = %134
  %136 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %137 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %138 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %139 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %43, i64 noundef %42, i64 noundef %42, double noundef %136, double noundef %137, double noundef %138, double noundef %139)
  br label %140

140:                                              ; preds = %135, %134
  store i32 1, ptr @J, align 4
  br label %141

141:                                              ; preds = %159, %140
  %.3 = phi i64 [ 1, %140 ], [ %160, %159 ]
  %142 = icmp sle i64 %.3, %44
  br i1 %142, label %143, label %161

143:                                              ; preds = %141
  %144 = load i32, ptr @J, align 4
  %145 = icmp eq i32 %144, 1
  br i1 %145, label %146, label %147

146:                                              ; preds = %143
  store i32 2, ptr @J, align 4
  br label %148

147:                                              ; preds = %143
  store i32 3, ptr @J, align 4
  br label %148

148:                                              ; preds = %147, %146
  %149 = load i32, ptr @J, align 4
  %150 = icmp sgt i32 %149, 2
  br i1 %150, label %151, label %152

151:                                              ; preds = %148
  store i32 0, ptr @J, align 4
  br label %153

152:                                              ; preds = %148
  store i32 1, ptr @J, align 4
  br label %153

153:                                              ; preds = %152, %151
  %154 = load i32, ptr @J, align 4
  %155 = icmp slt i32 %154, 1
  br i1 %155, label %156, label %157

156:                                              ; preds = %153
  store i32 1, ptr @J, align 4
  br label %158

157:                                              ; preds = %153
  store i32 0, ptr @J, align 4
  br label %158

158:                                              ; preds = %157, %156
  br label %159

159:                                              ; preds = %158
  %160 = add nsw i64 %.3, 1
  br label %141, !llvm.loop !11

161:                                              ; preds = %141
  br i1 %77, label %162, label %167

162:                                              ; preds = %161
  %163 = load i32, ptr @J, align 4
  %164 = sext i32 %163 to i64
  %165 = load i32, ptr @J, align 4
  %166 = sext i32 %165 to i64
  call void @POUT(i64 noundef %44, i64 noundef %164, i64 noundef %166, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %167

167:                                              ; preds = %162, %161
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  br label %168

168:                                              ; preds = %216, %167
  %.4 = phi i64 [ 1, %167 ], [ %217, %216 ]
  %169 = icmp sle i64 %.4, %45
  br i1 %169, label %170, label %218

170:                                              ; preds = %168
  %171 = load i32, ptr @J, align 4
  %172 = load i32, ptr @K, align 4
  %173 = load i32, ptr @J, align 4
  %174 = sub nsw i32 %172, %173
  %175 = mul nsw i32 %171, %174
  %176 = load i32, ptr @L, align 4
  %177 = load i32, ptr @K, align 4
  %178 = sub nsw i32 %176, %177
  %179 = mul nsw i32 %175, %178
  store i32 %179, ptr @J, align 4
  %180 = load i32, ptr @L, align 4
  %181 = load i32, ptr @K, align 4
  %182 = mul nsw i32 %180, %181
  %183 = load i32, ptr @L, align 4
  %184 = load i32, ptr @J, align 4
  %185 = sub nsw i32 %183, %184
  %186 = load i32, ptr @K, align 4
  %187 = mul nsw i32 %185, %186
  %188 = sub nsw i32 %182, %187
  store i32 %188, ptr @K, align 4
  %189 = load i32, ptr @L, align 4
  %190 = load i32, ptr @K, align 4
  %191 = sub nsw i32 %189, %190
  %192 = load i32, ptr @K, align 4
  %193 = load i32, ptr @J, align 4
  %194 = add nsw i32 %192, %193
  %195 = mul nsw i32 %191, %194
  store i32 %195, ptr @L, align 4
  %196 = load i32, ptr @J, align 4
  %197 = load i32, ptr @K, align 4
  %198 = add nsw i32 %196, %197
  %199 = load i32, ptr @L, align 4
  %200 = add nsw i32 %198, %199
  %201 = sitofp i32 %200 to double
  %202 = load i32, ptr @L, align 4
  %203 = sub nsw i32 %202, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %204
  store double %201, ptr %205, align 8
  %206 = load i32, ptr @J, align 4
  %207 = load i32, ptr @K, align 4
  %208 = mul nsw i32 %206, %207
  %209 = load i32, ptr @L, align 4
  %210 = mul nsw i32 %208, %209
  %211 = sitofp i32 %210 to double
  %212 = load i32, ptr @K, align 4
  %213 = sub nsw i32 %212, 1
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %214
  store double %211, ptr %215, align 8
  br label %216

216:                                              ; preds = %170
  %217 = add nsw i64 %.4, 1
  br label %168, !llvm.loop !12

218:                                              ; preds = %168
  br i1 %77, label %219, label %228

219:                                              ; preds = %218
  %220 = load i32, ptr @J, align 4
  %221 = sext i32 %220 to i64
  %222 = load i32, ptr @K, align 4
  %223 = sext i32 %222 to i64
  %224 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %225 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %226 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %227 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %45, i64 noundef %221, i64 noundef %223, double noundef %224, double noundef %225, double noundef %226, double noundef %227)
  br label %228

228:                                              ; preds = %219, %218
  br label %229

229:                                              ; preds = %262, %228
  %.09 = phi double [ 5.000000e-01, %228 ], [ %246, %262 ]
  %.08 = phi double [ 5.000000e-01, %228 ], [ %261, %262 ]
  %.5 = phi i64 [ 1, %228 ], [ %263, %262 ]
  %230 = icmp sle i64 %.5, %46
  br i1 %230, label %231, label %264

231:                                              ; preds = %229
  %232 = load double, ptr @T, align 8
  %233 = load double, ptr @T2, align 8
  %234 = call double @sin(double noundef %.09) #5
  %235 = fmul double %233, %234
  %236 = call double @cos(double noundef %.09) #5
  %237 = fmul double %235, %236
  %238 = fadd double %.09, %.08
  %239 = call double @cos(double noundef %238) #5
  %240 = fsub double %.09, %.08
  %241 = call double @cos(double noundef %240) #5
  %242 = fadd double %239, %241
  %243 = fsub double %242, 1.000000e+00
  %244 = fdiv double %237, %243
  %245 = call double @atan(double noundef %244) #5
  %246 = fmul double %232, %245
  %247 = load double, ptr @T, align 8
  %248 = load double, ptr @T2, align 8
  %249 = call double @sin(double noundef %.08) #5
  %250 = fmul double %248, %249
  %251 = call double @cos(double noundef %.08) #5
  %252 = fmul double %250, %251
  %253 = fadd double %246, %.08
  %254 = call double @cos(double noundef %253) #5
  %255 = fsub double %246, %.08
  %256 = call double @cos(double noundef %255) #5
  %257 = fadd double %254, %256
  %258 = fsub double %257, 1.000000e+00
  %259 = fdiv double %252, %258
  %260 = call double @atan(double noundef %259) #5
  %261 = fmul double %247, %260
  br label %262

262:                                              ; preds = %231
  %263 = add nsw i64 %.5, 1
  br label %229, !llvm.loop !13

264:                                              ; preds = %229
  br i1 %77, label %265, label %270

265:                                              ; preds = %264
  %266 = load i32, ptr @J, align 4
  %267 = sext i32 %266 to i64
  %268 = load i32, ptr @K, align 4
  %269 = sext i32 %268 to i64
  call void @POUT(i64 noundef %46, i64 noundef %267, i64 noundef %269, double noundef %.09, double noundef %.09, double noundef %.08, double noundef %.08)
  br label %270

270:                                              ; preds = %265, %264
  store double 1.000000e+00, ptr %3, align 8
  br label %271

271:                                              ; preds = %274, %270
  %.6 = phi i64 [ 1, %270 ], [ %275, %274 ]
  %272 = icmp sle i64 %.6, %47
  br i1 %272, label %273, label %276

273:                                              ; preds = %271
  call void @P3(double noundef 1.000000e+00, double noundef 1.000000e+00, ptr noundef %3)
  br label %274

274:                                              ; preds = %273
  %275 = add nsw i64 %.6, 1
  br label %271, !llvm.loop !14

276:                                              ; preds = %271
  br i1 %77, label %277, label %284

277:                                              ; preds = %276
  %278 = load i32, ptr @J, align 4
  %279 = sext i32 %278 to i64
  %280 = load i32, ptr @K, align 4
  %281 = sext i32 %280 to i64
  %282 = load double, ptr %3, align 8
  %283 = load double, ptr %3, align 8
  call void @POUT(i64 noundef %47, i64 noundef %279, i64 noundef %281, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef %282, double noundef %283)
  br label %284

284:                                              ; preds = %277, %276
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double 2.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double 3.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  br label %285

285:                                              ; preds = %288, %284
  %.7 = phi i64 [ 1, %284 ], [ %289, %288 ]
  %286 = icmp sle i64 %.7, %48
  br i1 %286, label %287, label %290

287:                                              ; preds = %285
  call void @P0()
  br label %288

288:                                              ; preds = %287
  %289 = add nsw i64 %.7, 1
  br label %285, !llvm.loop !15

290:                                              ; preds = %285
  br i1 %77, label %291, label %300

291:                                              ; preds = %290
  %292 = load i32, ptr @J, align 4
  %293 = sext i32 %292 to i64
  %294 = load i32, ptr @K, align 4
  %295 = sext i32 %294 to i64
  %296 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %297 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %298 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %299 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %48, i64 noundef %293, i64 noundef %295, double noundef %296, double noundef %297, double noundef %298, double noundef %299)
  br label %300

300:                                              ; preds = %291, %290
  store i32 2, ptr @J, align 4
  store i32 3, ptr @K, align 4
  br label %301

301:                                              ; preds = %318, %300
  %.8 = phi i64 [ 1, %300 ], [ %319, %318 ]
  %302 = icmp sle i64 %.8, 0
  br i1 %302, label %303, label %320

303:                                              ; preds = %301
  %304 = load i32, ptr @J, align 4
  %305 = load i32, ptr @K, align 4
  %306 = add nsw i32 %304, %305
  store i32 %306, ptr @J, align 4
  %307 = load i32, ptr @J, align 4
  %308 = load i32, ptr @K, align 4
  %309 = add nsw i32 %307, %308
  store i32 %309, ptr @K, align 4
  %310 = load i32, ptr @K, align 4
  %311 = load i32, ptr @J, align 4
  %312 = sub nsw i32 %310, %311
  store i32 %312, ptr @J, align 4
  %313 = load i32, ptr @K, align 4
  %314 = load i32, ptr @J, align 4
  %315 = sub nsw i32 %313, %314
  %316 = load i32, ptr @J, align 4
  %317 = sub nsw i32 %315, %316
  store i32 %317, ptr @K, align 4
  br label %318

318:                                              ; preds = %303
  %319 = add nsw i64 %.8, 1
  br label %301, !llvm.loop !16

320:                                              ; preds = %301
  br i1 %77, label %321, label %326

321:                                              ; preds = %320
  %322 = load i32, ptr @J, align 4
  %323 = sext i32 %322 to i64
  %324 = load i32, ptr @K, align 4
  %325 = sext i32 %324 to i64
  call void @POUT(i64 noundef 0, i64 noundef %323, i64 noundef %325, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %326

326:                                              ; preds = %321, %320
  br label %327

327:                                              ; preds = %335, %326
  %.110 = phi double [ 7.500000e-01, %326 ], [ %334, %335 ]
  %.9 = phi i64 [ 1, %326 ], [ %336, %335 ]
  %328 = icmp sle i64 %.9, %49
  br i1 %328, label %329, label %337

329:                                              ; preds = %327
  %330 = call double @log(double noundef %.110) #5
  %331 = load double, ptr @T1, align 8
  %332 = fdiv double %330, %331
  %333 = call double @exp(double noundef %332) #5
  %334 = call double @sqrt(double noundef %333) #5
  br label %335

335:                                              ; preds = %329
  %336 = add nsw i64 %.9, 1
  br label %327, !llvm.loop !17

337:                                              ; preds = %327
  br i1 %77, label %338, label %343

338:                                              ; preds = %337
  %339 = load i32, ptr @J, align 4
  %340 = sext i32 %339 to i64
  %341 = load i32, ptr @K, align 4
  %342 = sext i32 %341 to i64
  call void @POUT(i64 noundef %49, i64 noundef %340, i64 noundef %342, double noundef %.110, double noundef %.110, double noundef %.110, double noundef %.110)
  br label %343

343:                                              ; preds = %338, %337
  %344 = add nsw i32 %.06, 1
  %345 = icmp sle i32 %344, 1
  br i1 %345, label %346, label %347

346:                                              ; preds = %343
  br label %41

347:                                              ; preds = %343
  %348 = call i64 @time(ptr noundef null) #5
  %349 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %350 = icmp ne i32 %.01, 0
  br i1 %350, label %351, label %352

351:                                              ; preds = %347
  br label %39

352:                                              ; preds = %347
  br label %353

353:                                              ; preds = %352, %32
  %.0 = phi i32 [ 1, %32 ], [ 0, %352 ]
  ret i32 %.0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @atol(ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @POUT(i64 noundef %0, i64 noundef %1, i64 noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6) #0 {
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %0, i64 noundef %1, i64 noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PA(ptr noundef %0) #0 {
  store i32 0, ptr @J, align 4
  br label %2

2:                                                ; preds = %48, %1
  %3 = getelementptr inbounds double, ptr %0, i64 1
  %4 = load double, ptr %3, align 8
  %5 = getelementptr inbounds double, ptr %0, i64 2
  %6 = load double, ptr %5, align 8
  %7 = fadd double %4, %6
  %8 = getelementptr inbounds double, ptr %0, i64 3
  %9 = load double, ptr %8, align 8
  %10 = fadd double %7, %9
  %11 = getelementptr inbounds double, ptr %0, i64 4
  %12 = load double, ptr %11, align 8
  %13 = fsub double %10, %12
  %14 = load double, ptr @T, align 8
  %15 = fmul double %13, %14
  store double %15, ptr %3, align 8
  %16 = load double, ptr %3, align 8
  %17 = load double, ptr %5, align 8
  %18 = fadd double %16, %17
  %19 = load double, ptr %8, align 8
  %20 = fsub double %18, %19
  %21 = load double, ptr %11, align 8
  %22 = fadd double %20, %21
  %23 = load double, ptr @T, align 8
  %24 = fmul double %22, %23
  store double %24, ptr %5, align 8
  %25 = load double, ptr %3, align 8
  %26 = load double, ptr %5, align 8
  %27 = fsub double %25, %26
  %28 = load double, ptr %8, align 8
  %29 = fadd double %27, %28
  %30 = load double, ptr %11, align 8
  %31 = fadd double %29, %30
  %32 = load double, ptr @T, align 8
  %33 = fmul double %31, %32
  store double %33, ptr %8, align 8
  %34 = load double, ptr %3, align 8
  %35 = fneg double %34
  %36 = load double, ptr %5, align 8
  %37 = fadd double %35, %36
  %38 = load double, ptr %8, align 8
  %39 = fadd double %37, %38
  %40 = load double, ptr %11, align 8
  %41 = fadd double %39, %40
  %42 = load double, ptr @T2, align 8
  %43 = fdiv double %41, %42
  store double %43, ptr %11, align 8
  %44 = load i32, ptr @J, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr @J, align 4
  %46 = load i32, ptr @J, align 4
  %47 = icmp slt i32 %46, 6
  br i1 %47, label %48, label %49

48:                                               ; preds = %2
  br label %2

49:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare double @atan(double noundef) #3

; Function Attrs: nounwind
declare double @sin(double noundef) #3

; Function Attrs: nounwind
declare double @cos(double noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @P3(double noundef %0, double noundef %1, ptr noundef %2) #0 {
  %4 = load double, ptr @T, align 8
  %5 = fadd double %0, %1
  %6 = fmul double %4, %5
  %7 = load double, ptr @T, align 8
  %8 = fadd double %6, %1
  %9 = fmul double %7, %8
  %10 = fadd double %6, %9
  %11 = load double, ptr @T2, align 8
  %12 = fdiv double %10, %11
  store double %12, ptr %2, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @P0() #0 {
  %1 = load i32, ptr @K, align 4
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %2
  %4 = load double, ptr %3, align 8
  %5 = load i32, ptr @J, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %6
  store double %4, ptr %7, align 8
  %8 = load i32, ptr @L, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %9
  %11 = load double, ptr %10, align 8
  %12 = load i32, ptr @K, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %13
  store double %11, ptr %14, align 8
  %15 = load i32, ptr @J, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %16
  %18 = load double, ptr %17, align 8
  %19 = load i32, ptr @L, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %20
  store double %18, ptr %21, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

; Function Attrs: nounwind
declare double @exp(double noundef) #3

; Function Attrs: nounwind
declare double @log(double noundef) #3

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }
attributes #5 = { nounwind }

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
