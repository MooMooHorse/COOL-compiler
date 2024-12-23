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
  %12 = add i64 %1, 1
  %13 = mul i64 1, %12
  call void @llvm.memset.p0.i64(ptr align 1 %11, i8 0, i64 %13, i1 false)
  %14 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 4096, i1 false)
  %15 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %15, i8 0, i64 2048, i1 false)
  %16 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 2048, i1 false)
  %17 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %17, i8 0, i64 2048, i1 false)
  %18 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %18, i8 0, i64 256, i1 false)
  br label %19

19:                                               ; preds = %28, %2
  %.033 = phi ptr [ %0, %2 ], [ %27, %28 ]
  %.02 = phi i64 [ 0, %2 ], [ %29, %28 ]
  %20 = icmp ult i64 %.02, %1
  br i1 %20, label %21, label %30

21:                                               ; preds = %19
  %22 = load i8, ptr %.033, align 1
  %23 = zext i8 %22 to i64
  %24 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %23
  %25 = load i64, ptr %24, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr %24, align 8
  %27 = getelementptr inbounds i8, ptr %.033, i32 1
  br label %28

28:                                               ; preds = %21
  %29 = add i64 %.02, 1
  br label %19, !llvm.loop !8

30:                                               ; preds = %19
  br label %31

31:                                               ; preds = %41, %30
  %.010 = phi i64 [ 0, %30 ], [ %.111, %41 ]
  %.13 = phi i64 [ 0, %30 ], [ %42, %41 ]
  %32 = icmp ult i64 %.13, 256
  br i1 %32, label %33, label %43

33:                                               ; preds = %31
  %34 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %.13
  %35 = load i64, ptr %34, align 8
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %33
  %38 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 %.010
  store i64 %.13, ptr %38, align 8
  %39 = add i64 %.010, 1
  br label %40

40:                                               ; preds = %37, %33
  %.111 = phi i64 [ %39, %37 ], [ %.010, %33 ]
  br label %41

41:                                               ; preds = %40
  %42 = add i64 %.13, 1
  br label %31, !llvm.loop !9

43:                                               ; preds = %31
  %44 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  %45 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %46 = trunc i64 %.010 to i32
  br label %47

47:                                               ; preds = %51, %43
  %.24 = phi i64 [ %.010, %43 ], [ %52, %51 ]
  %48 = icmp ugt i64 %.24, 0
  br i1 %48, label %49, label %53

49:                                               ; preds = %47
  %50 = trunc i64 %.24 to i32
  call void @heap_adjust(ptr noundef %44, ptr noundef %45, i32 noundef %46, i32 noundef %50)
  br label %51

51:                                               ; preds = %49
  %52 = add i64 %.24, -1
  br label %47, !llvm.loop !10

53:                                               ; preds = %47
  %54 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %55 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %56 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  %57 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %58 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %59 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %60 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  %61 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 0
  %62 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 0
  br label %63

63:                                               ; preds = %65, %53
  %.212 = phi i64 [ %.010, %53 ], [ %66, %65 ]
  %64 = icmp ugt i64 %.212, 1
  br i1 %64, label %65, label %88

65:                                               ; preds = %63
  %66 = add i64 %.212, -1
  %67 = load i64, ptr %54, align 16
  %68 = getelementptr inbounds [256 x i64], ptr %4, i64 0, i64 %66
  %69 = load i64, ptr %68, align 8
  store i64 %69, ptr %55, align 16
  %70 = trunc i64 %66 to i32
  call void @heap_adjust(ptr noundef %56, ptr noundef %57, i32 noundef %70, i32 noundef 1)
  %71 = load i64, ptr %58, align 16
  %72 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %67
  %75 = load i64, ptr %74, align 8
  %76 = add i64 %73, %75
  %77 = add i64 256, %66
  %78 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %77
  store i64 %76, ptr %78, align 8
  %79 = add i64 256, %66
  %80 = trunc i64 %79 to i32
  %81 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %67
  store i32 %80, ptr %81, align 4
  %82 = sub i64 -256, %66
  %83 = trunc i64 %82 to i32
  %84 = load i64, ptr %59, align 16
  %85 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %84
  store i32 %83, ptr %85, align 4
  %86 = add i64 256, %66
  store i64 %86, ptr %60, align 16
  %87 = trunc i64 %66 to i32
  call void @heap_adjust(ptr noundef %61, ptr noundef %62, i32 noundef %87, i32 noundef 1)
  br label %63, !llvm.loop !11

88:                                               ; preds = %63
  %89 = add i64 256, %.212
  %90 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %89
  store i32 0, ptr %90, align 4
  br label %91

91:                                               ; preds = %127, %88
  %.045 = phi i64 [ 0, %88 ], [ %.247, %127 ]
  %.042 = phi i64 [ 0, %88 ], [ %128, %127 ]
  %.039 = phi i64 [ 0, %88 ], [ %.241, %127 ]
  %92 = icmp ult i64 %.042, 256
  br i1 %92, label %93, label %129

93:                                               ; preds = %91
  %94 = getelementptr inbounds [512 x i64], ptr %3, i64 0, i64 %.042
  %95 = load i64, ptr %94, align 8
  %96 = icmp ne i64 %95, 0
  br i1 %96, label %100, label %97

97:                                               ; preds = %93
  %98 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.042
  store i64 0, ptr %98, align 8
  %99 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.042
  store i8 0, ptr %99, align 1
  br label %126

100:                                              ; preds = %93
  %101 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %.042
  %102 = load i32, ptr %101, align 4
  br label %103

103:                                              ; preds = %110, %100
  %.043 = phi i64 [ 0, %100 ], [ %.144, %110 ]
  %.037 = phi i32 [ %102, %100 ], [ %113, %110 ]
  %.05 = phi i64 [ 1, %100 ], [ %114, %110 ]
  %.3 = phi i64 [ 0, %100 ], [ %115, %110 ]
  %104 = icmp ne i32 %.037, 0
  br i1 %104, label %105, label %116

105:                                              ; preds = %103
  %106 = icmp slt i32 %.037, 0
  br i1 %106, label %107, label %110

107:                                              ; preds = %105
  %108 = add i64 %.043, %.05
  %109 = sub nsw i32 0, %.037
  br label %110

110:                                              ; preds = %107, %105
  %.144 = phi i64 [ %108, %107 ], [ %.043, %105 ]
  %.138 = phi i32 [ %109, %107 ], [ %.037, %105 ]
  %111 = sext i32 %.138 to i64
  %112 = getelementptr inbounds [512 x i32], ptr %5, i64 0, i64 %111
  %113 = load i32, ptr %112, align 4
  %114 = shl i64 %.05, 1
  %115 = add i64 %.3, 1
  br label %103, !llvm.loop !12

116:                                              ; preds = %103
  %117 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.042
  store i64 %.043, ptr %117, align 8
  %118 = trunc i64 %.3 to i8
  %119 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.042
  store i8 %118, ptr %119, align 1
  %120 = icmp ugt i64 %.043, %.045
  br i1 %120, label %121, label %122

121:                                              ; preds = %116
  br label %122

122:                                              ; preds = %121, %116
  %.146 = phi i64 [ %.043, %121 ], [ %.045, %116 ]
  %123 = icmp ugt i64 %.3, %.039
  br i1 %123, label %124, label %125

124:                                              ; preds = %122
  br label %125

125:                                              ; preds = %124, %122
  %.140 = phi i64 [ %.3, %124 ], [ %.039, %122 ]
  br label %126

126:                                              ; preds = %125, %97
  %.247 = phi i64 [ %.146, %125 ], [ %.045, %97 ]
  %.241 = phi i64 [ %.140, %125 ], [ %.039, %97 ]
  br label %127

127:                                              ; preds = %126
  %128 = add i64 %.042, 1
  br label %91, !llvm.loop !13

129:                                              ; preds = %91
  %130 = icmp ugt i64 %.039, 64
  br i1 %130, label %131, label %134

131:                                              ; preds = %129
  %132 = load ptr, ptr @stderr, align 8
  %133 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %132, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

134:                                              ; preds = %129
  %135 = icmp eq i64 %.045, 0
  br i1 %135, label %136, label %139

136:                                              ; preds = %134
  %137 = load ptr, ptr @stderr, align 8
  %138 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %137, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

139:                                              ; preds = %134
  br label %140

140:                                              ; preds = %190, %139
  %.134 = phi ptr [ %0, %139 ], [ %189, %190 ]
  %.028 = phi i64 [ 0, %139 ], [ %.129, %190 ]
  %.024 = phi i8 [ 0, %139 ], [ %.125, %190 ]
  %.16 = phi i64 [ 0, %139 ], [ %191, %190 ]
  %.01 = phi i32 [ -1, %139 ], [ %.1, %190 ]
  %141 = icmp ult i64 %.16, %1
  br i1 %141, label %142, label %192

142:                                              ; preds = %140
  %143 = load i8, ptr %.134, align 1
  %144 = zext i8 %143 to i64
  %145 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %144
  %146 = load i8, ptr %145, align 1
  %147 = zext i8 %146 to i32
  %148 = sub nsw i32 %147, 1
  %149 = shl i32 1, %148
  %150 = sext i32 %149 to i64
  br label %151

151:                                              ; preds = %186, %142
  %.129 = phi i64 [ %.028, %142 ], [ %.230, %186 ]
  %.125 = phi i8 [ %.024, %142 ], [ %.327, %186 ]
  %.015 = phi i64 [ %150, %142 ], [ %185, %186 ]
  %.4 = phi i64 [ 0, %142 ], [ %187, %186 ]
  %.1 = phi i32 [ %.01, %142 ], [ %.2, %186 ]
  %152 = load i8, ptr %.134, align 1
  %153 = zext i8 %152 to i64
  %154 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %153
  %155 = load i8, ptr %154, align 1
  %156 = zext i8 %155 to i64
  %157 = icmp ult i64 %.4, %156
  br i1 %157, label %158, label %188

158:                                              ; preds = %151
  %159 = icmp eq i32 %.1, 7
  br i1 %159, label %160, label %168

160:                                              ; preds = %158
  %161 = getelementptr inbounds i8, ptr %11, i64 %.129
  store i8 %.125, ptr %161, align 1
  %162 = add i64 %.129, 1
  %163 = icmp eq i64 %162, %1
  br i1 %163, label %164, label %167

164:                                              ; preds = %160
  %165 = load ptr, ptr @stderr, align 8
  %166 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %165, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

167:                                              ; preds = %160
  br label %173

168:                                              ; preds = %158
  %169 = add nsw i32 %.1, 1
  %170 = sext i8 %.125 to i32
  %171 = shl i32 %170, 1
  %172 = trunc i32 %171 to i8
  br label %173

173:                                              ; preds = %168, %167
  %.230 = phi i64 [ %162, %167 ], [ %.129, %168 ]
  %.226 = phi i8 [ 0, %167 ], [ %172, %168 ]
  %.2 = phi i32 [ 0, %167 ], [ %169, %168 ]
  %174 = load i8, ptr %.134, align 1
  %175 = zext i8 %174 to i64
  %176 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %175
  %177 = load i64, ptr %176, align 8
  %178 = and i64 %177, %.015
  %179 = icmp ne i64 %178, 0
  br i1 %179, label %180, label %184

180:                                              ; preds = %173
  %181 = sext i8 %.226 to i32
  %182 = or i32 %181, 1
  %183 = trunc i32 %182 to i8
  br label %184

184:                                              ; preds = %180, %173
  %.327 = phi i8 [ %183, %180 ], [ %.226, %173 ]
  %185 = lshr i64 %.015, 1
  br label %186

186:                                              ; preds = %184
  %187 = add i64 %.4, 1
  br label %151, !llvm.loop !14

188:                                              ; preds = %151
  %189 = getelementptr inbounds i8, ptr %.134, i32 1
  br label %190

190:                                              ; preds = %188
  %191 = add i64 %.16, 1
  br label %140, !llvm.loop !15

192:                                              ; preds = %140
  %193 = sub nsw i32 7, %.01
  %194 = sext i8 %.024 to i32
  %195 = shl i32 %194, %193
  %196 = trunc i32 %195 to i8
  %197 = getelementptr inbounds i8, ptr %11, i64 %.028
  store i8 %196, ptr %197, align 1
  %198 = add i64 %.028, 1
  %199 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %199, i8 0, i64 2048, i1 false)
  %200 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  br label %201

201:                                              ; preds = %241, %192
  %.27 = phi i64 [ 0, %192 ], [ %242, %241 ]
  %.0 = phi ptr [ %200, %192 ], [ %205, %241 ]
  %202 = icmp ult i64 %.27, 256
  br i1 %202, label %203, label %243

203:                                              ; preds = %201
  %204 = trunc i64 %.27 to i8
  store i8 %204, ptr %.0, align 1
  %205 = getelementptr inbounds i8, ptr %.0, i32 1
  %206 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.27
  %207 = load i64, ptr %206, align 8
  %208 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %209 = load i8, ptr %208, align 1
  %210 = zext i8 %209 to i64
  %211 = or i64 %207, %210
  %212 = icmp ne i64 %211, 0
  br i1 %212, label %213, label %240

213:                                              ; preds = %203
  %214 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %215 = load i8, ptr %214, align 1
  %216 = zext i8 %215 to i32
  %217 = sub nsw i32 %216, 1
  %218 = shl i32 1, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 %.27
  %221 = getelementptr inbounds [256 x i64], ptr %6, i64 0, i64 %.27
  %222 = load i8, ptr %220, align 1
  %223 = load i64, ptr %221, align 8
  %224 = zext i8 %222 to i64
  br label %225

225:                                              ; preds = %236, %213
  %.019 = phi i64 [ 0, %213 ], [ %.120, %236 ]
  %.116 = phi i64 [ %219, %213 ], [ %235, %236 ]
  %.5 = phi i64 [ 0, %213 ], [ %237, %236 ]
  %226 = icmp ult i64 %.5, %224
  br i1 %226, label %227, label %238

227:                                              ; preds = %225
  %228 = mul i64 %.019, 2
  %229 = add i64 %228, 1
  %230 = and i64 %223, %.116
  %231 = icmp ne i64 %230, 0
  br i1 %231, label %232, label %234

232:                                              ; preds = %227
  %233 = add i64 %229, 1
  br label %234

234:                                              ; preds = %232, %227
  %.120 = phi i64 [ %233, %232 ], [ %229, %227 ]
  %235 = lshr i64 %.116, 1
  br label %236

236:                                              ; preds = %234
  %237 = add i64 %.5, 1
  br label %225, !llvm.loop !16

238:                                              ; preds = %225
  %239 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.27
  store i64 %.019, ptr %239, align 8
  br label %240

240:                                              ; preds = %238, %203
  br label %241

241:                                              ; preds = %240
  %242 = add i64 %.27, 1
  br label %201, !llvm.loop !17

243:                                              ; preds = %201
  br label %244

244:                                              ; preds = %273, %243
  %.6 = phi i64 [ 1, %243 ], [ %274, %273 ]
  %245 = icmp ult i64 %.6, 256
  br i1 %245, label %246, label %275

246:                                              ; preds = %244
  %247 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.6
  %248 = load i64, ptr %247, align 8
  %249 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.6
  %250 = load i8, ptr %249, align 1
  br label %251

251:                                              ; preds = %260, %246
  %.38 = phi i64 [ %.6, %246 ], [ %269, %260 ]
  %252 = icmp ne i64 %.38, 0
  br i1 %252, label %253, label %258

253:                                              ; preds = %251
  %254 = sub i64 %.38, 1
  %255 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %254
  %256 = load i64, ptr %255, align 8
  %257 = icmp ugt i64 %256, %248
  br label %258

258:                                              ; preds = %253, %251
  %259 = phi i1 [ false, %251 ], [ %257, %253 ]
  br i1 %259, label %260, label %270

260:                                              ; preds = %258
  %261 = sub i64 %.38, 1
  %262 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %261
  %263 = load i64, ptr %262, align 8
  %264 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.38
  store i64 %263, ptr %264, align 8
  %265 = sub i64 %.38, 1
  %266 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %265
  %267 = load i8, ptr %266, align 1
  %268 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.38
  store i8 %267, ptr %268, align 1
  %269 = add i64 %.38, -1
  br label %251, !llvm.loop !18

270:                                              ; preds = %258
  %271 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.38
  store i64 %248, ptr %271, align 8
  %272 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.38
  store i8 %250, ptr %272, align 1
  br label %273

273:                                              ; preds = %270
  %274 = add i64 %.6, 1
  br label %244, !llvm.loop !19

275:                                              ; preds = %244
  br label %276

276:                                              ; preds = %281, %275
  %.49 = phi i64 [ 0, %275 ], [ %282, %281 ]
  %277 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.49
  %278 = load i64, ptr %277, align 8
  %279 = icmp eq i64 %278, 0
  br i1 %279, label %280, label %283

280:                                              ; preds = %276
  br label %281

281:                                              ; preds = %280
  %282 = add i64 %.49, 1
  br label %276, !llvm.loop !20

283:                                              ; preds = %276
  br label %284

284:                                              ; preds = %317, %283
  %.235 = phi ptr [ %0, %283 ], [ %.336, %317 ]
  %.031 = phi ptr [ %11, %283 ], [ %.132, %317 ]
  %.221 = phi i64 [ 0, %283 ], [ %.423, %317 ]
  %.217 = phi i64 [ 128, %283 ], [ %.318, %317 ]
  %.313 = phi i64 [ 0, %283 ], [ %.414, %317 ]
  %.7 = phi i64 [ %.49, %283 ], [ %.9, %317 ]
  %285 = icmp ult i64 %.313, %1
  br i1 %285, label %286, label %318

286:                                              ; preds = %284
  %287 = mul i64 %.221, 2
  %288 = add i64 %287, 1
  %289 = load i8, ptr %.031, align 1
  %290 = zext i8 %289 to i64
  %291 = and i64 %290, %.217
  %292 = icmp ne i64 %291, 0
  br i1 %292, label %293, label %295

293:                                              ; preds = %286
  %294 = add i64 %288, 1
  br label %295

295:                                              ; preds = %293, %286
  %.322 = phi i64 [ %294, %293 ], [ %288, %286 ]
  br label %296

296:                                              ; preds = %300, %295
  %.8 = phi i64 [ %.7, %295 ], [ %301, %300 ]
  %297 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.8
  %298 = load i64, ptr %297, align 8
  %299 = icmp ult i64 %298, %.322
  br i1 %299, label %300, label %302

300:                                              ; preds = %296
  %301 = add i64 %.8, 1
  br label %296, !llvm.loop !21

302:                                              ; preds = %296
  %303 = getelementptr inbounds [256 x i64], ptr %8, i64 0, i64 %.8
  %304 = load i64, ptr %303, align 8
  %305 = icmp eq i64 %.322, %304
  br i1 %305, label %306, label %311

306:                                              ; preds = %302
  %307 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 %.8
  %308 = load i8, ptr %307, align 1
  store i8 %308, ptr %.235, align 1
  %309 = getelementptr inbounds i8, ptr %.235, i32 1
  %310 = add i64 %.313, 1
  br label %311

311:                                              ; preds = %306, %302
  %.336 = phi ptr [ %309, %306 ], [ %.235, %302 ]
  %.423 = phi i64 [ 0, %306 ], [ %.322, %302 ]
  %.414 = phi i64 [ %310, %306 ], [ %.313, %302 ]
  %.9 = phi i64 [ %.49, %306 ], [ %.8, %302 ]
  %312 = icmp ugt i64 %.217, 1
  br i1 %312, label %313, label %315

313:                                              ; preds = %311
  %314 = lshr i64 %.217, 1
  br label %317

315:                                              ; preds = %311
  %316 = getelementptr inbounds i8, ptr %.031, i32 1
  br label %317

317:                                              ; preds = %315, %313
  %.132 = phi ptr [ %.031, %313 ], [ %316, %315 ]
  %.318 = phi i64 [ %314, %313 ], [ 128, %315 ]
  br label %284, !llvm.loop !22

318:                                              ; preds = %284
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
  %10 = sdiv i32 %2, 2
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds i64, ptr %0, i64 %11
  br label %13

13:                                               ; preds = %42, %4
  %.01 = phi i32 [ %3, %4 ], [ %.0, %42 ]
  %14 = icmp sle i32 %.01, %10
  br i1 %14, label %15, label %48

15:                                               ; preds = %13
  %16 = add nsw i32 %.01, %.01
  %17 = icmp slt i32 %16, %2
  br i1 %17, label %18, label %33

18:                                               ; preds = %15
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i64, ptr %5, i64 %19
  %21 = load i64, ptr %20, align 8
  %22 = getelementptr inbounds i64, ptr %0, i64 %21
  %23 = load i64, ptr %22, align 8
  %24 = add nsw i32 %16, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i64, ptr %5, i64 %25
  %27 = load i64, ptr %26, align 8
  %28 = getelementptr inbounds i64, ptr %0, i64 %27
  %29 = load i64, ptr %28, align 8
  %30 = icmp ugt i64 %23, %29
  br i1 %30, label %31, label %33

31:                                               ; preds = %18
  %32 = add nsw i32 %16, 1
  br label %33

33:                                               ; preds = %31, %18, %15
  %.0 = phi i32 [ %32, %31 ], [ %16, %18 ], [ %16, %15 ]
  %34 = load i64, ptr %12, align 8
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds i64, ptr %5, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i64, ptr %0, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = icmp ult i64 %34, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %33
  br label %48

42:                                               ; preds = %33
  %43 = sext i32 %.0 to i64
  %44 = getelementptr inbounds i64, ptr %5, i64 %43
  %45 = load i64, ptr %44, align 8
  %46 = sext i32 %.01 to i64
  %47 = getelementptr inbounds i64, ptr %5, i64 %46
  store i64 %45, ptr %47, align 8
  br label %13, !llvm.loop !23

48:                                               ; preds = %41, %13
  %49 = sext i32 %9 to i64
  %50 = sext i32 %.01 to i64
  %51 = getelementptr inbounds i64, ptr %5, i64 %50
  store i64 %49, ptr %51, align 8
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
  %5 = getelementptr inbounds ptr, ptr %1, i64 1
  br label %6

6:                                                ; preds = %14, %4
  %.01 = phi i32 [ 1, %4 ], [ %15, %14 ]
  %7 = icmp slt i32 %.01, %0
  br i1 %7, label %8, label %16

8:                                                ; preds = %6
  %9 = load ptr, ptr %5, align 8
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str.4) #10
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

12:                                               ; preds = %8
  br label %16

13:                                               ; preds = %8
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !24

16:                                               ; preds = %12, %6
  %.0 = phi i8 [ 1, %12 ], [ 0, %6 ]
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
