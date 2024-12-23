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
  br label %362

35:                                               ; preds = %27
  br label %36

36:                                               ; preds = %35, %20
  %.13 = phi i64 [ %.02, %20 ], [ %31, %35 ]
  %.1 = phi i32 [ 1, %20 ], [ %.01, %35 ]
  %37 = add nsw i32 %.07, 1
  br label %4, !llvm.loop !6

38:                                               ; preds = %4
  br label %39

39:                                               ; preds = %360, %38
  %40 = call i64 @time(ptr noundef null) #5
  store double 4.999750e-01, ptr @T, align 8
  store double 5.002500e-01, ptr @T1, align 8
  store double 2.000000e+00, ptr @T2, align 8
  br label %41

41:                                               ; preds = %355, %39
  %.06 = phi i32 [ 1, %39 ], [ %353, %355 ]
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
  %123 = icmp eq i32 %.06, 1
  br i1 %123, label %124, label %129

124:                                              ; preds = %122
  %125 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %126 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %127 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %128 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %42, i64 noundef %43, i64 noundef %42, double noundef %125, double noundef %126, double noundef %127, double noundef %128)
  br label %129

129:                                              ; preds = %124, %122
  br label %130

130:                                              ; preds = %133, %129
  %.2 = phi i64 [ 1, %129 ], [ %134, %133 ]
  %131 = icmp sle i64 %.2, %43
  br i1 %131, label %132, label %135

132:                                              ; preds = %130
  call void @PA(ptr noundef @E1)
  br label %133

133:                                              ; preds = %132
  %134 = add nsw i64 %.2, 1
  br label %130, !llvm.loop !10

135:                                              ; preds = %130
  %136 = icmp eq i32 %.06, 1
  br i1 %136, label %137, label %142

137:                                              ; preds = %135
  %138 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %139 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %140 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %141 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %43, i64 noundef %42, i64 noundef %42, double noundef %138, double noundef %139, double noundef %140, double noundef %141)
  br label %142

142:                                              ; preds = %137, %135
  store i32 1, ptr @J, align 4
  br label %143

143:                                              ; preds = %161, %142
  %.3 = phi i64 [ 1, %142 ], [ %162, %161 ]
  %144 = icmp sle i64 %.3, %44
  br i1 %144, label %145, label %163

145:                                              ; preds = %143
  %146 = load i32, ptr @J, align 4
  %147 = icmp eq i32 %146, 1
  br i1 %147, label %148, label %149

148:                                              ; preds = %145
  store i32 2, ptr @J, align 4
  br label %150

149:                                              ; preds = %145
  store i32 3, ptr @J, align 4
  br label %150

150:                                              ; preds = %149, %148
  %151 = load i32, ptr @J, align 4
  %152 = icmp sgt i32 %151, 2
  br i1 %152, label %153, label %154

153:                                              ; preds = %150
  store i32 0, ptr @J, align 4
  br label %155

154:                                              ; preds = %150
  store i32 1, ptr @J, align 4
  br label %155

155:                                              ; preds = %154, %153
  %156 = load i32, ptr @J, align 4
  %157 = icmp slt i32 %156, 1
  br i1 %157, label %158, label %159

158:                                              ; preds = %155
  store i32 1, ptr @J, align 4
  br label %160

159:                                              ; preds = %155
  store i32 0, ptr @J, align 4
  br label %160

160:                                              ; preds = %159, %158
  br label %161

161:                                              ; preds = %160
  %162 = add nsw i64 %.3, 1
  br label %143, !llvm.loop !11

163:                                              ; preds = %143
  %164 = icmp eq i32 %.06, 1
  br i1 %164, label %165, label %170

165:                                              ; preds = %163
  %166 = load i32, ptr @J, align 4
  %167 = sext i32 %166 to i64
  %168 = load i32, ptr @J, align 4
  %169 = sext i32 %168 to i64
  call void @POUT(i64 noundef %44, i64 noundef %167, i64 noundef %169, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %170

170:                                              ; preds = %165, %163
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  br label %171

171:                                              ; preds = %219, %170
  %.4 = phi i64 [ 1, %170 ], [ %220, %219 ]
  %172 = icmp sle i64 %.4, %45
  br i1 %172, label %173, label %221

173:                                              ; preds = %171
  %174 = load i32, ptr @J, align 4
  %175 = load i32, ptr @K, align 4
  %176 = load i32, ptr @J, align 4
  %177 = sub nsw i32 %175, %176
  %178 = mul nsw i32 %174, %177
  %179 = load i32, ptr @L, align 4
  %180 = load i32, ptr @K, align 4
  %181 = sub nsw i32 %179, %180
  %182 = mul nsw i32 %178, %181
  store i32 %182, ptr @J, align 4
  %183 = load i32, ptr @L, align 4
  %184 = load i32, ptr @K, align 4
  %185 = mul nsw i32 %183, %184
  %186 = load i32, ptr @L, align 4
  %187 = load i32, ptr @J, align 4
  %188 = sub nsw i32 %186, %187
  %189 = load i32, ptr @K, align 4
  %190 = mul nsw i32 %188, %189
  %191 = sub nsw i32 %185, %190
  store i32 %191, ptr @K, align 4
  %192 = load i32, ptr @L, align 4
  %193 = load i32, ptr @K, align 4
  %194 = sub nsw i32 %192, %193
  %195 = load i32, ptr @K, align 4
  %196 = load i32, ptr @J, align 4
  %197 = add nsw i32 %195, %196
  %198 = mul nsw i32 %194, %197
  store i32 %198, ptr @L, align 4
  %199 = load i32, ptr @J, align 4
  %200 = load i32, ptr @K, align 4
  %201 = add nsw i32 %199, %200
  %202 = load i32, ptr @L, align 4
  %203 = add nsw i32 %201, %202
  %204 = sitofp i32 %203 to double
  %205 = load i32, ptr @L, align 4
  %206 = sub nsw i32 %205, 1
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %207
  store double %204, ptr %208, align 8
  %209 = load i32, ptr @J, align 4
  %210 = load i32, ptr @K, align 4
  %211 = mul nsw i32 %209, %210
  %212 = load i32, ptr @L, align 4
  %213 = mul nsw i32 %211, %212
  %214 = sitofp i32 %213 to double
  %215 = load i32, ptr @K, align 4
  %216 = sub nsw i32 %215, 1
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %217
  store double %214, ptr %218, align 8
  br label %219

219:                                              ; preds = %173
  %220 = add nsw i64 %.4, 1
  br label %171, !llvm.loop !12

221:                                              ; preds = %171
  %222 = icmp eq i32 %.06, 1
  br i1 %222, label %223, label %232

223:                                              ; preds = %221
  %224 = load i32, ptr @J, align 4
  %225 = sext i32 %224 to i64
  %226 = load i32, ptr @K, align 4
  %227 = sext i32 %226 to i64
  %228 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %229 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %230 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %231 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %45, i64 noundef %225, i64 noundef %227, double noundef %228, double noundef %229, double noundef %230, double noundef %231)
  br label %232

232:                                              ; preds = %223, %221
  br label %233

233:                                              ; preds = %266, %232
  %.09 = phi double [ 5.000000e-01, %232 ], [ %250, %266 ]
  %.08 = phi double [ 5.000000e-01, %232 ], [ %265, %266 ]
  %.5 = phi i64 [ 1, %232 ], [ %267, %266 ]
  %234 = icmp sle i64 %.5, %46
  br i1 %234, label %235, label %268

235:                                              ; preds = %233
  %236 = load double, ptr @T, align 8
  %237 = load double, ptr @T2, align 8
  %238 = call double @sin(double noundef %.09) #5
  %239 = fmul double %237, %238
  %240 = call double @cos(double noundef %.09) #5
  %241 = fmul double %239, %240
  %242 = fadd double %.09, %.08
  %243 = call double @cos(double noundef %242) #5
  %244 = fsub double %.09, %.08
  %245 = call double @cos(double noundef %244) #5
  %246 = fadd double %243, %245
  %247 = fsub double %246, 1.000000e+00
  %248 = fdiv double %241, %247
  %249 = call double @atan(double noundef %248) #5
  %250 = fmul double %236, %249
  %251 = load double, ptr @T, align 8
  %252 = load double, ptr @T2, align 8
  %253 = call double @sin(double noundef %.08) #5
  %254 = fmul double %252, %253
  %255 = call double @cos(double noundef %.08) #5
  %256 = fmul double %254, %255
  %257 = fadd double %250, %.08
  %258 = call double @cos(double noundef %257) #5
  %259 = fsub double %250, %.08
  %260 = call double @cos(double noundef %259) #5
  %261 = fadd double %258, %260
  %262 = fsub double %261, 1.000000e+00
  %263 = fdiv double %256, %262
  %264 = call double @atan(double noundef %263) #5
  %265 = fmul double %251, %264
  br label %266

266:                                              ; preds = %235
  %267 = add nsw i64 %.5, 1
  br label %233, !llvm.loop !13

268:                                              ; preds = %233
  %269 = icmp eq i32 %.06, 1
  br i1 %269, label %270, label %275

270:                                              ; preds = %268
  %271 = load i32, ptr @J, align 4
  %272 = sext i32 %271 to i64
  %273 = load i32, ptr @K, align 4
  %274 = sext i32 %273 to i64
  call void @POUT(i64 noundef %46, i64 noundef %272, i64 noundef %274, double noundef %.09, double noundef %.09, double noundef %.08, double noundef %.08)
  br label %275

275:                                              ; preds = %270, %268
  store double 1.000000e+00, ptr %3, align 8
  br label %276

276:                                              ; preds = %279, %275
  %.6 = phi i64 [ 1, %275 ], [ %280, %279 ]
  %277 = icmp sle i64 %.6, %47
  br i1 %277, label %278, label %281

278:                                              ; preds = %276
  call void @P3(double noundef 1.000000e+00, double noundef 1.000000e+00, ptr noundef %3)
  br label %279

279:                                              ; preds = %278
  %280 = add nsw i64 %.6, 1
  br label %276, !llvm.loop !14

281:                                              ; preds = %276
  %282 = icmp eq i32 %.06, 1
  br i1 %282, label %283, label %290

283:                                              ; preds = %281
  %284 = load i32, ptr @J, align 4
  %285 = sext i32 %284 to i64
  %286 = load i32, ptr @K, align 4
  %287 = sext i32 %286 to i64
  %288 = load double, ptr %3, align 8
  %289 = load double, ptr %3, align 8
  call void @POUT(i64 noundef %47, i64 noundef %285, i64 noundef %287, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef %288, double noundef %289)
  br label %290

290:                                              ; preds = %283, %281
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double 2.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double 3.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  br label %291

291:                                              ; preds = %294, %290
  %.7 = phi i64 [ 1, %290 ], [ %295, %294 ]
  %292 = icmp sle i64 %.7, %48
  br i1 %292, label %293, label %296

293:                                              ; preds = %291
  call void @P0()
  br label %294

294:                                              ; preds = %293
  %295 = add nsw i64 %.7, 1
  br label %291, !llvm.loop !15

296:                                              ; preds = %291
  %297 = icmp eq i32 %.06, 1
  br i1 %297, label %298, label %307

298:                                              ; preds = %296
  %299 = load i32, ptr @J, align 4
  %300 = sext i32 %299 to i64
  %301 = load i32, ptr @K, align 4
  %302 = sext i32 %301 to i64
  %303 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %304 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %305 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %306 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %48, i64 noundef %300, i64 noundef %302, double noundef %303, double noundef %304, double noundef %305, double noundef %306)
  br label %307

307:                                              ; preds = %298, %296
  store i32 2, ptr @J, align 4
  store i32 3, ptr @K, align 4
  br label %308

308:                                              ; preds = %325, %307
  %.8 = phi i64 [ 1, %307 ], [ %326, %325 ]
  %309 = icmp sle i64 %.8, 0
  br i1 %309, label %310, label %327

310:                                              ; preds = %308
  %311 = load i32, ptr @J, align 4
  %312 = load i32, ptr @K, align 4
  %313 = add nsw i32 %311, %312
  store i32 %313, ptr @J, align 4
  %314 = load i32, ptr @J, align 4
  %315 = load i32, ptr @K, align 4
  %316 = add nsw i32 %314, %315
  store i32 %316, ptr @K, align 4
  %317 = load i32, ptr @K, align 4
  %318 = load i32, ptr @J, align 4
  %319 = sub nsw i32 %317, %318
  store i32 %319, ptr @J, align 4
  %320 = load i32, ptr @K, align 4
  %321 = load i32, ptr @J, align 4
  %322 = sub nsw i32 %320, %321
  %323 = load i32, ptr @J, align 4
  %324 = sub nsw i32 %322, %323
  store i32 %324, ptr @K, align 4
  br label %325

325:                                              ; preds = %310
  %326 = add nsw i64 %.8, 1
  br label %308, !llvm.loop !16

327:                                              ; preds = %308
  %328 = icmp eq i32 %.06, 1
  br i1 %328, label %329, label %334

329:                                              ; preds = %327
  %330 = load i32, ptr @J, align 4
  %331 = sext i32 %330 to i64
  %332 = load i32, ptr @K, align 4
  %333 = sext i32 %332 to i64
  call void @POUT(i64 noundef 0, i64 noundef %331, i64 noundef %333, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %334

334:                                              ; preds = %329, %327
  br label %335

335:                                              ; preds = %343, %334
  %.110 = phi double [ 7.500000e-01, %334 ], [ %342, %343 ]
  %.9 = phi i64 [ 1, %334 ], [ %344, %343 ]
  %336 = icmp sle i64 %.9, %49
  br i1 %336, label %337, label %345

337:                                              ; preds = %335
  %338 = call double @log(double noundef %.110) #5
  %339 = load double, ptr @T1, align 8
  %340 = fdiv double %338, %339
  %341 = call double @exp(double noundef %340) #5
  %342 = call double @sqrt(double noundef %341) #5
  br label %343

343:                                              ; preds = %337
  %344 = add nsw i64 %.9, 1
  br label %335, !llvm.loop !17

345:                                              ; preds = %335
  %346 = icmp eq i32 %.06, 1
  br i1 %346, label %347, label %352

347:                                              ; preds = %345
  %348 = load i32, ptr @J, align 4
  %349 = sext i32 %348 to i64
  %350 = load i32, ptr @K, align 4
  %351 = sext i32 %350 to i64
  call void @POUT(i64 noundef %49, i64 noundef %349, i64 noundef %351, double noundef %.110, double noundef %.110, double noundef %.110, double noundef %.110)
  br label %352

352:                                              ; preds = %347, %345
  %353 = add nsw i32 %.06, 1
  %354 = icmp sle i32 %353, 1
  br i1 %354, label %355, label %356

355:                                              ; preds = %352
  br label %41

356:                                              ; preds = %352
  %357 = call i64 @time(ptr noundef null) #5
  %358 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %359 = icmp ne i32 %.01, 0
  br i1 %359, label %360, label %361

360:                                              ; preds = %356
  br label %39

361:                                              ; preds = %356
  br label %362

362:                                              ; preds = %361, %32
  %.0 = phi i32 [ 1, %32 ], [ 0, %361 ]
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

2:                                                ; preds = %64, %1
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
  %16 = getelementptr inbounds double, ptr %0, i64 1
  store double %15, ptr %16, align 8
  %17 = getelementptr inbounds double, ptr %0, i64 1
  %18 = load double, ptr %17, align 8
  %19 = getelementptr inbounds double, ptr %0, i64 2
  %20 = load double, ptr %19, align 8
  %21 = fadd double %18, %20
  %22 = getelementptr inbounds double, ptr %0, i64 3
  %23 = load double, ptr %22, align 8
  %24 = fsub double %21, %23
  %25 = getelementptr inbounds double, ptr %0, i64 4
  %26 = load double, ptr %25, align 8
  %27 = fadd double %24, %26
  %28 = load double, ptr @T, align 8
  %29 = fmul double %27, %28
  %30 = getelementptr inbounds double, ptr %0, i64 2
  store double %29, ptr %30, align 8
  %31 = getelementptr inbounds double, ptr %0, i64 1
  %32 = load double, ptr %31, align 8
  %33 = getelementptr inbounds double, ptr %0, i64 2
  %34 = load double, ptr %33, align 8
  %35 = fsub double %32, %34
  %36 = getelementptr inbounds double, ptr %0, i64 3
  %37 = load double, ptr %36, align 8
  %38 = fadd double %35, %37
  %39 = getelementptr inbounds double, ptr %0, i64 4
  %40 = load double, ptr %39, align 8
  %41 = fadd double %38, %40
  %42 = load double, ptr @T, align 8
  %43 = fmul double %41, %42
  %44 = getelementptr inbounds double, ptr %0, i64 3
  store double %43, ptr %44, align 8
  %45 = getelementptr inbounds double, ptr %0, i64 1
  %46 = load double, ptr %45, align 8
  %47 = fneg double %46
  %48 = getelementptr inbounds double, ptr %0, i64 2
  %49 = load double, ptr %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds double, ptr %0, i64 3
  %52 = load double, ptr %51, align 8
  %53 = fadd double %50, %52
  %54 = getelementptr inbounds double, ptr %0, i64 4
  %55 = load double, ptr %54, align 8
  %56 = fadd double %53, %55
  %57 = load double, ptr @T2, align 8
  %58 = fdiv double %56, %57
  %59 = getelementptr inbounds double, ptr %0, i64 4
  store double %58, ptr %59, align 8
  %60 = load i32, ptr @J, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr @J, align 4
  %62 = load i32, ptr @J, align 4
  %63 = icmp slt i32 %62, 6
  br i1 %63, label %64, label %65

64:                                               ; preds = %2
  br label %2

65:                                               ; preds = %2
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
