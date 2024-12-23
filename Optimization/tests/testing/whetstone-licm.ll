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
  %39 = mul nsw i64 12, %.02
  %40 = mul nsw i64 14, %.02
  %41 = mul nsw i64 345, %.02
  %42 = mul nsw i64 210, %.02
  %43 = mul nsw i64 32, %.02
  %44 = mul nsw i64 899, %.02
  %45 = mul nsw i64 616, %.02
  %46 = mul nsw i64 93, %.02
  %47 = icmp ne i32 %.01, 0
  br label %48

48:                                               ; preds = %360, %38
  %49 = call i64 @time(ptr noundef null) #5
  store double 4.999750e-01, ptr @T, align 8
  store double 5.002500e-01, ptr @T1, align 8
  store double 2.000000e+00, ptr @T2, align 8
  br label %50

50:                                               ; preds = %356, %48
  %.06 = phi i32 [ 1, %48 ], [ %354, %356 ]
  br label %51

51:                                               ; preds = %75, %50
  %.014 = phi double [ 1.000000e+00, %50 ], [ %58, %75 ]
  %.013 = phi double [ -1.000000e+00, %50 ], [ %63, %75 ]
  %.012 = phi double [ -1.000000e+00, %50 ], [ %68, %75 ]
  %.011 = phi double [ -1.000000e+00, %50 ], [ %74, %75 ]
  %.04 = phi i64 [ 1, %50 ], [ %76, %75 ]
  %52 = icmp sle i64 %.04, 0
  br i1 %52, label %53, label %77

53:                                               ; preds = %51
  %54 = fadd double %.014, %.013
  %55 = fadd double %54, %.012
  %56 = fsub double %55, %.011
  %57 = load double, ptr @T, align 8
  %58 = fmul double %56, %57
  %59 = fadd double %58, %.013
  %60 = fsub double %59, %.012
  %61 = fadd double %60, %.011
  %62 = load double, ptr @T, align 8
  %63 = fmul double %61, %62
  %64 = fsub double %58, %63
  %65 = fadd double %64, %.012
  %66 = fadd double %65, %.011
  %67 = load double, ptr @T, align 8
  %68 = fmul double %66, %67
  %69 = fneg double %58
  %70 = fadd double %69, %63
  %71 = fadd double %70, %68
  %72 = fadd double %71, %.011
  %73 = load double, ptr @T, align 8
  %74 = fmul double %72, %73
  br label %75

75:                                               ; preds = %53
  %76 = add nsw i64 %.04, 1
  br label %51, !llvm.loop !8

77:                                               ; preds = %51
  %78 = icmp eq i32 %.06, 1
  br i1 %78, label %79, label %80

79:                                               ; preds = %77
  call void @POUT(i64 noundef 0, i64 noundef 0, i64 noundef 0, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %80

80:                                               ; preds = %79, %77
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %81

81:                                               ; preds = %121, %80
  %.15 = phi i64 [ 1, %80 ], [ %122, %121 ]
  %82 = icmp sle i64 %.15, %39
  br i1 %82, label %83, label %123

83:                                               ; preds = %81
  %84 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %85 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %86 = fadd double %84, %85
  %87 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %88 = fadd double %86, %87
  %89 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %90 = fsub double %88, %89
  %91 = load double, ptr @T, align 8
  %92 = fmul double %90, %91
  store double %92, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %93 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %94 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %95 = fadd double %93, %94
  %96 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %97 = fsub double %95, %96
  %98 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %99 = fadd double %97, %98
  %100 = load double, ptr @T, align 8
  %101 = fmul double %99, %100
  store double %101, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %102 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %103 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %104 = fsub double %102, %103
  %105 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %106 = fadd double %104, %105
  %107 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %108 = fadd double %106, %107
  %109 = load double, ptr @T, align 8
  %110 = fmul double %108, %109
  store double %110, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %111 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %112 = fneg double %111
  %113 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %114 = fadd double %112, %113
  %115 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %116 = fadd double %114, %115
  %117 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %118 = fadd double %116, %117
  %119 = load double, ptr @T, align 8
  %120 = fmul double %118, %119
  store double %120, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %121

121:                                              ; preds = %83
  %122 = add nsw i64 %.15, 1
  br label %81, !llvm.loop !9

123:                                              ; preds = %81
  %124 = icmp eq i32 %.06, 1
  br i1 %124, label %125, label %130

125:                                              ; preds = %123
  %126 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %127 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %128 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %129 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %39, i64 noundef %40, i64 noundef %39, double noundef %126, double noundef %127, double noundef %128, double noundef %129)
  br label %130

130:                                              ; preds = %125, %123
  br label %131

131:                                              ; preds = %134, %130
  %.2 = phi i64 [ 1, %130 ], [ %135, %134 ]
  %132 = icmp sle i64 %.2, %40
  br i1 %132, label %133, label %136

133:                                              ; preds = %131
  call void @PA(ptr noundef @E1)
  br label %134

134:                                              ; preds = %133
  %135 = add nsw i64 %.2, 1
  br label %131, !llvm.loop !10

136:                                              ; preds = %131
  %137 = icmp eq i32 %.06, 1
  br i1 %137, label %138, label %143

138:                                              ; preds = %136
  %139 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %140 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %141 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %142 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %40, i64 noundef %39, i64 noundef %39, double noundef %139, double noundef %140, double noundef %141, double noundef %142)
  br label %143

143:                                              ; preds = %138, %136
  store i32 1, ptr @J, align 4
  br label %144

144:                                              ; preds = %162, %143
  %.3 = phi i64 [ 1, %143 ], [ %163, %162 ]
  %145 = icmp sle i64 %.3, %41
  br i1 %145, label %146, label %164

146:                                              ; preds = %144
  %147 = load i32, ptr @J, align 4
  %148 = icmp eq i32 %147, 1
  br i1 %148, label %149, label %150

149:                                              ; preds = %146
  store i32 2, ptr @J, align 4
  br label %151

150:                                              ; preds = %146
  store i32 3, ptr @J, align 4
  br label %151

151:                                              ; preds = %150, %149
  %152 = load i32, ptr @J, align 4
  %153 = icmp sgt i32 %152, 2
  br i1 %153, label %154, label %155

154:                                              ; preds = %151
  store i32 0, ptr @J, align 4
  br label %156

155:                                              ; preds = %151
  store i32 1, ptr @J, align 4
  br label %156

156:                                              ; preds = %155, %154
  %157 = load i32, ptr @J, align 4
  %158 = icmp slt i32 %157, 1
  br i1 %158, label %159, label %160

159:                                              ; preds = %156
  store i32 1, ptr @J, align 4
  br label %161

160:                                              ; preds = %156
  store i32 0, ptr @J, align 4
  br label %161

161:                                              ; preds = %160, %159
  br label %162

162:                                              ; preds = %161
  %163 = add nsw i64 %.3, 1
  br label %144, !llvm.loop !11

164:                                              ; preds = %144
  %165 = icmp eq i32 %.06, 1
  br i1 %165, label %166, label %171

166:                                              ; preds = %164
  %167 = load i32, ptr @J, align 4
  %168 = sext i32 %167 to i64
  %169 = load i32, ptr @J, align 4
  %170 = sext i32 %169 to i64
  call void @POUT(i64 noundef %41, i64 noundef %168, i64 noundef %170, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %171

171:                                              ; preds = %166, %164
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  br label %172

172:                                              ; preds = %220, %171
  %.4 = phi i64 [ 1, %171 ], [ %221, %220 ]
  %173 = icmp sle i64 %.4, %42
  br i1 %173, label %174, label %222

174:                                              ; preds = %172
  %175 = load i32, ptr @J, align 4
  %176 = load i32, ptr @K, align 4
  %177 = load i32, ptr @J, align 4
  %178 = sub nsw i32 %176, %177
  %179 = mul nsw i32 %175, %178
  %180 = load i32, ptr @L, align 4
  %181 = load i32, ptr @K, align 4
  %182 = sub nsw i32 %180, %181
  %183 = mul nsw i32 %179, %182
  store i32 %183, ptr @J, align 4
  %184 = load i32, ptr @L, align 4
  %185 = load i32, ptr @K, align 4
  %186 = mul nsw i32 %184, %185
  %187 = load i32, ptr @L, align 4
  %188 = load i32, ptr @J, align 4
  %189 = sub nsw i32 %187, %188
  %190 = load i32, ptr @K, align 4
  %191 = mul nsw i32 %189, %190
  %192 = sub nsw i32 %186, %191
  store i32 %192, ptr @K, align 4
  %193 = load i32, ptr @L, align 4
  %194 = load i32, ptr @K, align 4
  %195 = sub nsw i32 %193, %194
  %196 = load i32, ptr @K, align 4
  %197 = load i32, ptr @J, align 4
  %198 = add nsw i32 %196, %197
  %199 = mul nsw i32 %195, %198
  store i32 %199, ptr @L, align 4
  %200 = load i32, ptr @J, align 4
  %201 = load i32, ptr @K, align 4
  %202 = add nsw i32 %200, %201
  %203 = load i32, ptr @L, align 4
  %204 = add nsw i32 %202, %203
  %205 = sitofp i32 %204 to double
  %206 = load i32, ptr @L, align 4
  %207 = sub nsw i32 %206, 1
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %208
  store double %205, ptr %209, align 8
  %210 = load i32, ptr @J, align 4
  %211 = load i32, ptr @K, align 4
  %212 = mul nsw i32 %210, %211
  %213 = load i32, ptr @L, align 4
  %214 = mul nsw i32 %212, %213
  %215 = sitofp i32 %214 to double
  %216 = load i32, ptr @K, align 4
  %217 = sub nsw i32 %216, 1
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %218
  store double %215, ptr %219, align 8
  br label %220

220:                                              ; preds = %174
  %221 = add nsw i64 %.4, 1
  br label %172, !llvm.loop !12

222:                                              ; preds = %172
  %223 = icmp eq i32 %.06, 1
  br i1 %223, label %224, label %233

224:                                              ; preds = %222
  %225 = load i32, ptr @J, align 4
  %226 = sext i32 %225 to i64
  %227 = load i32, ptr @K, align 4
  %228 = sext i32 %227 to i64
  %229 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %230 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %231 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %232 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %42, i64 noundef %226, i64 noundef %228, double noundef %229, double noundef %230, double noundef %231, double noundef %232)
  br label %233

233:                                              ; preds = %224, %222
  br label %234

234:                                              ; preds = %267, %233
  %.09 = phi double [ 5.000000e-01, %233 ], [ %251, %267 ]
  %.08 = phi double [ 5.000000e-01, %233 ], [ %266, %267 ]
  %.5 = phi i64 [ 1, %233 ], [ %268, %267 ]
  %235 = icmp sle i64 %.5, %43
  br i1 %235, label %236, label %269

236:                                              ; preds = %234
  %237 = load double, ptr @T, align 8
  %238 = load double, ptr @T2, align 8
  %239 = call double @sin(double noundef %.09) #5
  %240 = fmul double %238, %239
  %241 = call double @cos(double noundef %.09) #5
  %242 = fmul double %240, %241
  %243 = fadd double %.09, %.08
  %244 = call double @cos(double noundef %243) #5
  %245 = fsub double %.09, %.08
  %246 = call double @cos(double noundef %245) #5
  %247 = fadd double %244, %246
  %248 = fsub double %247, 1.000000e+00
  %249 = fdiv double %242, %248
  %250 = call double @atan(double noundef %249) #5
  %251 = fmul double %237, %250
  %252 = load double, ptr @T, align 8
  %253 = load double, ptr @T2, align 8
  %254 = call double @sin(double noundef %.08) #5
  %255 = fmul double %253, %254
  %256 = call double @cos(double noundef %.08) #5
  %257 = fmul double %255, %256
  %258 = fadd double %251, %.08
  %259 = call double @cos(double noundef %258) #5
  %260 = fsub double %251, %.08
  %261 = call double @cos(double noundef %260) #5
  %262 = fadd double %259, %261
  %263 = fsub double %262, 1.000000e+00
  %264 = fdiv double %257, %263
  %265 = call double @atan(double noundef %264) #5
  %266 = fmul double %252, %265
  br label %267

267:                                              ; preds = %236
  %268 = add nsw i64 %.5, 1
  br label %234, !llvm.loop !13

269:                                              ; preds = %234
  %270 = icmp eq i32 %.06, 1
  br i1 %270, label %271, label %276

271:                                              ; preds = %269
  %272 = load i32, ptr @J, align 4
  %273 = sext i32 %272 to i64
  %274 = load i32, ptr @K, align 4
  %275 = sext i32 %274 to i64
  call void @POUT(i64 noundef %43, i64 noundef %273, i64 noundef %275, double noundef %.09, double noundef %.09, double noundef %.08, double noundef %.08)
  br label %276

276:                                              ; preds = %271, %269
  store double 1.000000e+00, ptr %3, align 8
  br label %277

277:                                              ; preds = %280, %276
  %.6 = phi i64 [ 1, %276 ], [ %281, %280 ]
  %278 = icmp sle i64 %.6, %44
  br i1 %278, label %279, label %282

279:                                              ; preds = %277
  call void @P3(double noundef 1.000000e+00, double noundef 1.000000e+00, ptr noundef %3)
  br label %280

280:                                              ; preds = %279
  %281 = add nsw i64 %.6, 1
  br label %277, !llvm.loop !14

282:                                              ; preds = %277
  %283 = icmp eq i32 %.06, 1
  br i1 %283, label %284, label %291

284:                                              ; preds = %282
  %285 = load i32, ptr @J, align 4
  %286 = sext i32 %285 to i64
  %287 = load i32, ptr @K, align 4
  %288 = sext i32 %287 to i64
  %289 = load double, ptr %3, align 8
  %290 = load double, ptr %3, align 8
  call void @POUT(i64 noundef %44, i64 noundef %286, i64 noundef %288, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef %289, double noundef %290)
  br label %291

291:                                              ; preds = %284, %282
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double 2.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double 3.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  br label %292

292:                                              ; preds = %295, %291
  %.7 = phi i64 [ 1, %291 ], [ %296, %295 ]
  %293 = icmp sle i64 %.7, %45
  br i1 %293, label %294, label %297

294:                                              ; preds = %292
  call void @P0()
  br label %295

295:                                              ; preds = %294
  %296 = add nsw i64 %.7, 1
  br label %292, !llvm.loop !15

297:                                              ; preds = %292
  %298 = icmp eq i32 %.06, 1
  br i1 %298, label %299, label %308

299:                                              ; preds = %297
  %300 = load i32, ptr @J, align 4
  %301 = sext i32 %300 to i64
  %302 = load i32, ptr @K, align 4
  %303 = sext i32 %302 to i64
  %304 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %305 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %306 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %307 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %45, i64 noundef %301, i64 noundef %303, double noundef %304, double noundef %305, double noundef %306, double noundef %307)
  br label %308

308:                                              ; preds = %299, %297
  store i32 2, ptr @J, align 4
  store i32 3, ptr @K, align 4
  br label %309

309:                                              ; preds = %326, %308
  %.8 = phi i64 [ 1, %308 ], [ %327, %326 ]
  %310 = icmp sle i64 %.8, 0
  br i1 %310, label %311, label %328

311:                                              ; preds = %309
  %312 = load i32, ptr @J, align 4
  %313 = load i32, ptr @K, align 4
  %314 = add nsw i32 %312, %313
  store i32 %314, ptr @J, align 4
  %315 = load i32, ptr @J, align 4
  %316 = load i32, ptr @K, align 4
  %317 = add nsw i32 %315, %316
  store i32 %317, ptr @K, align 4
  %318 = load i32, ptr @K, align 4
  %319 = load i32, ptr @J, align 4
  %320 = sub nsw i32 %318, %319
  store i32 %320, ptr @J, align 4
  %321 = load i32, ptr @K, align 4
  %322 = load i32, ptr @J, align 4
  %323 = sub nsw i32 %321, %322
  %324 = load i32, ptr @J, align 4
  %325 = sub nsw i32 %323, %324
  store i32 %325, ptr @K, align 4
  br label %326

326:                                              ; preds = %311
  %327 = add nsw i64 %.8, 1
  br label %309, !llvm.loop !16

328:                                              ; preds = %309
  %329 = icmp eq i32 %.06, 1
  br i1 %329, label %330, label %335

330:                                              ; preds = %328
  %331 = load i32, ptr @J, align 4
  %332 = sext i32 %331 to i64
  %333 = load i32, ptr @K, align 4
  %334 = sext i32 %333 to i64
  call void @POUT(i64 noundef 0, i64 noundef %332, i64 noundef %334, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %335

335:                                              ; preds = %330, %328
  br label %336

336:                                              ; preds = %344, %335
  %.110 = phi double [ 7.500000e-01, %335 ], [ %343, %344 ]
  %.9 = phi i64 [ 1, %335 ], [ %345, %344 ]
  %337 = icmp sle i64 %.9, %46
  br i1 %337, label %338, label %346

338:                                              ; preds = %336
  %339 = call double @log(double noundef %.110) #5
  %340 = load double, ptr @T1, align 8
  %341 = fdiv double %339, %340
  %342 = call double @exp(double noundef %341) #5
  %343 = call double @sqrt(double noundef %342) #5
  br label %344

344:                                              ; preds = %338
  %345 = add nsw i64 %.9, 1
  br label %336, !llvm.loop !17

346:                                              ; preds = %336
  %347 = icmp eq i32 %.06, 1
  br i1 %347, label %348, label %353

348:                                              ; preds = %346
  %349 = load i32, ptr @J, align 4
  %350 = sext i32 %349 to i64
  %351 = load i32, ptr @K, align 4
  %352 = sext i32 %351 to i64
  call void @POUT(i64 noundef %46, i64 noundef %350, i64 noundef %352, double noundef %.110, double noundef %.110, double noundef %.110, double noundef %.110)
  br label %353

353:                                              ; preds = %348, %346
  %354 = add nsw i32 %.06, 1
  %355 = icmp sle i32 %354, 1
  br i1 %355, label %356, label %357

356:                                              ; preds = %353
  br label %50

357:                                              ; preds = %353
  %358 = call i64 @time(ptr noundef null) #5
  %359 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br i1 %47, label %360, label %361

360:                                              ; preds = %357
  br label %48

361:                                              ; preds = %357
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
  %2 = getelementptr inbounds double, ptr %0, i64 1
  %3 = getelementptr inbounds double, ptr %0, i64 2
  %4 = getelementptr inbounds double, ptr %0, i64 3
  %5 = getelementptr inbounds double, ptr %0, i64 4
  %6 = getelementptr inbounds double, ptr %0, i64 1
  %7 = getelementptr inbounds double, ptr %0, i64 1
  %8 = getelementptr inbounds double, ptr %0, i64 2
  %9 = getelementptr inbounds double, ptr %0, i64 3
  %10 = getelementptr inbounds double, ptr %0, i64 4
  %11 = getelementptr inbounds double, ptr %0, i64 2
  %12 = getelementptr inbounds double, ptr %0, i64 1
  %13 = getelementptr inbounds double, ptr %0, i64 2
  %14 = getelementptr inbounds double, ptr %0, i64 3
  %15 = getelementptr inbounds double, ptr %0, i64 4
  %16 = getelementptr inbounds double, ptr %0, i64 3
  %17 = getelementptr inbounds double, ptr %0, i64 1
  %18 = getelementptr inbounds double, ptr %0, i64 2
  %19 = getelementptr inbounds double, ptr %0, i64 3
  %20 = getelementptr inbounds double, ptr %0, i64 4
  %21 = load double, ptr @T2, align 8
  %22 = getelementptr inbounds double, ptr %0, i64 4
  br label %23

23:                                               ; preds = %64, %1
  %24 = load double, ptr %2, align 8
  %25 = load double, ptr %3, align 8
  %26 = fadd double %24, %25
  %27 = load double, ptr %4, align 8
  %28 = fadd double %26, %27
  %29 = load double, ptr %5, align 8
  %30 = fsub double %28, %29
  %31 = load double, ptr @T, align 8
  %32 = fmul double %30, %31
  store double %32, ptr %6, align 8
  %33 = load double, ptr %7, align 8
  %34 = load double, ptr %8, align 8
  %35 = fadd double %33, %34
  %36 = load double, ptr %9, align 8
  %37 = fsub double %35, %36
  %38 = load double, ptr %10, align 8
  %39 = fadd double %37, %38
  %40 = load double, ptr @T, align 8
  %41 = fmul double %39, %40
  store double %41, ptr %11, align 8
  %42 = load double, ptr %12, align 8
  %43 = load double, ptr %13, align 8
  %44 = fsub double %42, %43
  %45 = load double, ptr %14, align 8
  %46 = fadd double %44, %45
  %47 = load double, ptr %15, align 8
  %48 = fadd double %46, %47
  %49 = load double, ptr @T, align 8
  %50 = fmul double %48, %49
  store double %50, ptr %16, align 8
  %51 = load double, ptr %17, align 8
  %52 = fneg double %51
  %53 = load double, ptr %18, align 8
  %54 = fadd double %52, %53
  %55 = load double, ptr %19, align 8
  %56 = fadd double %54, %55
  %57 = load double, ptr %20, align 8
  %58 = fadd double %56, %57
  %59 = fdiv double %58, %21
  store double %59, ptr %22, align 8
  %60 = load i32, ptr @J, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr @J, align 4
  %62 = load i32, ptr @J, align 4
  %63 = icmp slt i32 %62, 6
  br i1 %63, label %64, label %65

64:                                               ; preds = %23
  br label %23

65:                                               ; preds = %23
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
