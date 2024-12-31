; ModuleID = '<stdin>'
source_filename = "tests/testing/almabench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FD8C637FD3B6253, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FE725849423E3E0, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FF000011136AEF5, double 0.000000e+00, double 0.000000e+00], [3 x double] [double 0x3FF860FD96F0D223, double 3.000000e-10, double 0.000000e+00], [3 x double] [double 0x4014CF7737365089, double 1.913200e-06, double -3.900000e-09], [3 x double] [double 0x40231C1D0EBB7C0F, double -2.138960e-05, double 4.440000e-08], [3 x double] [double 0x403337EC14C35EFA, double -3.716000e-07, double 0x3E7A47A3038502A4], [3 x double] [double 0x403E1C425059FB17, double -1.663500e-06, double 6.860000e-08]], align 16
@dlm = internal constant [8 x [3 x double]] [[3 x double] [double 0x406F88076B035926, double 0x41F40BBCADEE3CB4, double -1.927890e+00], [3 x double] [double 0x4066BF5A874FEAFA, double 0x41DF6432F5157881, double 5.938100e-01], [3 x double] [double 0x40591DDA6DBF7622, double 0x41D34FC2F3B56502, double -2.044110e+00], [3 x double] [double 0x407636ED90F7B482, double 0x41C4890A4B784DFD, double 9.426400e-01], [3 x double] [double 0x40412CFE90EA1D96, double 0x419A0C7E6F1EA0BA, double 0xC03E9A915379FA98], [3 x double] [double 0x404909E9B1DFE17D, double 0x4184FA9E14756430, double 0x4052E76ED677707A], [3 x double] [double 0x4073A0E14D09C902, double 0x416D6BA57E0EFDCA, double -1.750830e+00], [3 x double] [double 0x4073059422411D82, double 0x415E0127CD46B26C, double 2.110300e-01]], align 16
@e = internal constant [8 x [3 x double]] [[3 x double] [double 0x3FCA52242A37D430, double 0x3F2ABF4B9459E7F4, double -2.834900e-06], [3 x double] [double 0x3F7BBCDE77820827, double 0xBF3F4DAC25FB4BC2, double 9.812700e-06], [3 x double] [double 0x3F911C1175CC9F7B, double 0xBF3B8C8FA536F731, double -1.267340e-05], [3 x double] [double 0x3FB7E91AD74BF5B0, double 0x3F4DA66143B5E407, double -8.064100e-06], [3 x double] [double 0x3FA8D4B857E48742, double 0x3F5ABE2B9A18B7B5, double -4.713660e-05], [3 x double] [double 0x3FAC70CE5FA41E66, double 0xBF6C6594A86FD58E, double -6.436390e-05], [3 x double] [double 0x3FA7BF479022D287, double 0xBF31E2FE6AE927D8, double 7.891300e-06], [3 x double] [double 0x3F835D88E0FE76D8, double 6.032630e-05, double 0.000000e+00]], align 16
@pi = internal constant [8 x [3 x double]] [[3 x double] [double 0x40535D310DE9F882, double 0x40B6571DAB9F559B, double -4.830160e+00], [3 x double] [double 0x40607209DADFB507, double 0x4065EF9096BB98C8, double 0xC07F27B59DDC1E79], [3 x double] [double 0x4059BBFD82CD2461, double 0x40C6AE2D2BD3C361, double 0x404AA34C6E6D9BE5], [3 x double] [double 0x407500F6B7DFD5BE, double 0x40CF363AC3222920, double -6.232800e+01], [3 x double] [double 0x402CA993F265B897, double 0x40BE4EC06AD2DCB1, double 0x40703F599ED7C6FC], [3 x double] [double 0x405743A9C7642D26, double 0x40D3EADFA415F45E, double 0x4067C84DFCE3150E], [3 x double] [double 0x4065A02B58283528, double 0x40A91F1FF04577D9, double 0xC0410BE37DE939EB], [3 x double] [double 0x40480F65305B6785, double 0x40906AE060FE4799, double 0x403B65ACEEE0F3CB]], align 16
@dinc = internal constant [8 x [3 x double]] [[3 x double] [double 0x401C051B1D92B7FE, double 0xC06AC83387160957, double 2.897700e-01], [3 x double] [double 0x400B28447E34386C, double 0xC03ED828A1DFB939, double 0xC0275B52007DD441], [3 x double] [double 0.000000e+00, double 0x407D5F90F51AC9B0, double -3.350530e+00], [3 x double] [double 0x3FFD987ACB2252BB, double 0xC072551355475A32, double -8.118300e+00], [3 x double] [double 0x3FF4DA2E7A10E830, double 0xC051E3C504816F00, double 0x4027E7EBAF102364], [3 x double] [double 0x4003E939471E778F, double 0x4056F686594AF4F1, double 0xC031A989374BC6A8], [3 x double] [double 0x3FE8BE07677D67B5, double 0xC04E5D15DF6555C5, double 1.257590e+00], [3 x double] [double 0x3FFC51B9CE9853F4, double 0x40203F251C193B3A, double 8.135000e-02]], align 16
@omega = internal constant [8 x [3 x double]] [[3 x double] [double 0x40482A5AB400A313, double 0xC0B1A3379F01B867, double 0xC03FCC8605681ECD], [3 x double] [double 0x40532B83CFF8FC2B, double 0xC0C38C3DA31A4BDC, double 0xC049A9BEF49CF56F], [3 x double] [double 0x4065DBF10E4FF9E8, double 0xC0C0F3A29A804966, double 0x402EAF0ED3D859C9], [3 x double] [double 0x4048C76F992A88EB, double 0xC0C4BE7350092CCF, double 0xC06CD25F84CAD57C], [3 x double] [double 0x40591DB8D838BBB3, double 0x40B8DA091DBCA969, double 0x4074685935FC3B4F], [3 x double] [double 0x405C6A9797E1B38F, double 0xC0C20C1986983516, double 0xC0508F320D9945B7], [3 x double] [double 0x405280619982C872, double 0x40A4DA4CF80DC337, double 0x40623E1187E7C06E], [3 x double] [double 0x40607916FEBF632D, double 0xC06BBE2EDBB59DDC, double -7.872800e-01]], align 16
@kp = internal constant [8 x [9 x double]] [[9 x double] [double 6.961300e+04, double 7.564500e+04, double 8.830600e+04, double 5.989900e+04, double 1.574600e+04, double 7.108700e+04, double 1.421730e+05, double 3.086000e+03, double 0.000000e+00], [9 x double] [double 2.186300e+04, double 3.279400e+04, double 2.693400e+04, double 1.093100e+04, double 2.625000e+04, double 4.372500e+04, double 5.386700e+04, double 2.893900e+04, double 0.000000e+00], [9 x double] [double 1.600200e+04, double 2.186300e+04, double 3.200400e+04, double 1.093100e+04, double 1.452900e+04, double 1.636800e+04, double 1.531800e+04, double 3.279400e+04, double 0.000000e+00], [9 x double] [double 6.345000e+03, double 7.818000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 1.416300e+04, double 1.107000e+03, double 4.872000e+03, double 0.000000e+00], [9 x double] [double 1.760000e+03, double 1.454000e+03, double 1.167000e+03, double 8.800000e+02, double 2.870000e+02, double 2.640000e+03, double 1.900000e+01, double 2.047000e+03, double 1.454000e+03], [9 x double] [double 5.740000e+02, double 0.000000e+00, double 8.800000e+02, double 2.870000e+02, double 1.900000e+01, double 1.760000e+03, double 1.167000e+03, double 3.060000e+02, double 5.740000e+02], [9 x double] [double 2.040000e+02, double 0.000000e+00, double 1.770000e+02, double 1.265000e+03, double 4.000000e+00, double 3.850000e+02, double 2.000000e+02, double 2.080000e+02, double 2.040000e+02], [9 x double] [double 0.000000e+00, double 1.020000e+02, double 1.060000e+02, double 4.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 0.000000e+00]], align 16
@kq = internal constant [8 x [10 x double]] [[10 x double] [double 3.086000e+03, double 1.574600e+04, double 6.961300e+04, double 5.989900e+04, double 7.564500e+04, double 8.830600e+04, double 1.266100e+04, double 2.658000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.186300e+04, double 3.279400e+04, double 1.093100e+04, double 7.300000e+01, double 4.387000e+03, double 2.693400e+04, double 1.473000e+03, double 2.157000e+03, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 1.600200e+04, double 2.186300e+04, double 1.093100e+04, double 1.473000e+03, double 3.200400e+04, double 4.387000e+03, double 7.300000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 1.000000e+01, double 6.345000e+03, double 7.818000e+03, double 1.107000e+03, double 1.563600e+04, double 7.077000e+03, double 8.184000e+03, double 5.320000e+02, double 1.000000e+01, double 0.000000e+00], [10 x double] [double 1.900000e+01, double 1.760000e+03, double 1.454000e+03, double 2.870000e+02, double 1.167000e+03, double 8.800000e+02, double 5.740000e+02, double 2.640000e+03, double 1.900000e+01, double 1.454000e+03], [10 x double] [double 1.900000e+01, double 5.740000e+02, double 2.870000e+02, double 3.060000e+02, double 1.760000e+03, double 1.200000e+01, double 3.100000e+01, double 3.800000e+01, double 1.900000e+01, double 5.740000e+02], [10 x double] [double 4.000000e+00, double 2.040000e+02, double 1.770000e+02, double 8.000000e+00, double 3.100000e+01, double 2.000000e+02, double 1.265000e+03, double 1.020000e+02, double 4.000000e+00, double 2.040000e+02], [10 x double] [double 4.000000e+00, double 1.020000e+02, double 1.060000e+02, double 8.000000e+00, double 9.800000e+01, double 1.367000e+03, double 4.870000e+02, double 2.040000e+02, double 4.000000e+00, double 1.020000e+02]], align 16
@ca = internal constant [8 x [9 x double]] [[9 x double] [double 4.000000e+00, double -1.300000e+01, double 1.100000e+01, double -9.000000e+00, double -9.000000e+00, double -3.000000e+00, double -1.000000e+00, double 4.000000e+00, double 0.000000e+00], [9 x double] [double -1.560000e+02, double 5.900000e+01, double -4.200000e+01, double 6.000000e+00, double 1.900000e+01, double -2.000000e+01, double -1.000000e+01, double -1.200000e+01, double 0.000000e+00], [9 x double] [double 6.400000e+01, double -1.520000e+02, double 6.200000e+01, double -8.000000e+00, double 3.200000e+01, double -4.100000e+01, double 1.900000e+01, double -1.100000e+01, double 0.000000e+00], [9 x double] [double 1.240000e+02, double 6.210000e+02, double -1.450000e+02, double 2.080000e+02, double 5.400000e+01, double -5.700000e+01, double 3.000000e+01, double 1.500000e+01, double 0.000000e+00], [9 x double] [double -2.343700e+04, double -2.634000e+03, double 6.601000e+03, double 6.259000e+03, double -1.507000e+03, double -1.821000e+03, double 2.620000e+03, double -2.115000e+03, double -1.489000e+03], [9 x double] [double 6.291100e+04, double -1.199190e+05, double 7.933600e+04, double 1.781400e+04, double -2.424100e+04, double 1.206800e+04, double 8.306000e+03, double -4.893000e+03, double 8.902000e+03], [9 x double] [double 3.890610e+05, double -2.621250e+05, double -4.408800e+04, double 8.387000e+03, double -2.297600e+04, double -2.093000e+03, double -6.150000e+02, double -9.720000e+03, double 6.633000e+03], [9 x double] [double -4.122350e+05, double -1.570460e+05, double -3.143000e+04, double 3.781700e+04, double -9.740000e+03, double -1.300000e+01, double -7.449000e+03, double 9.644000e+03, double 0.000000e+00]], align 16
@sa = internal constant [8 x [9 x double]] [[9 x double] [double -2.900000e+01, double -1.000000e+00, double 9.000000e+00, double 6.000000e+00, double -6.000000e+00, double 5.000000e+00, double 4.000000e+00, double 0.000000e+00, double 0.000000e+00], [9 x double] [double -4.800000e+01, double -1.250000e+02, double -2.600000e+01, double -3.700000e+01, double 1.800000e+01, double -1.300000e+01, double -2.000000e+01, double -2.000000e+00, double 0.000000e+00], [9 x double] [double -1.500000e+02, double -4.600000e+01, double 6.800000e+01, double 5.400000e+01, double 1.400000e+01, double 2.400000e+01, double -2.800000e+01, double 2.200000e+01, double 0.000000e+00], [9 x double] [double -6.210000e+02, double 5.320000e+02, double -6.940000e+02, double -2.000000e+01, double 1.920000e+02, double -9.400000e+01, double 7.100000e+01, double -7.300000e+01, double 0.000000e+00], [9 x double] [double -1.461400e+04, double -1.982800e+04, double -5.869000e+03, double 1.881000e+03, double -4.372000e+03, double -2.255000e+03, double 7.820000e+02, double 9.300000e+02, double 9.130000e+02], [9 x double] [double 1.397370e+05, double 0.000000e+00, double 2.466700e+04, double 5.112300e+04, double -5.102000e+03, double 7.429000e+03, double -4.095000e+03, double -1.976000e+03, double -9.566000e+03], [9 x double] [double -1.380810e+05, double 0.000000e+00, double 3.720500e+04, double -4.903900e+04, double -4.190100e+04, double -3.387200e+04, double -2.703700e+04, double -1.247400e+04, double 1.879700e+04], [9 x double] [double 0.000000e+00, double 2.849200e+04, double 1.332360e+05, double 6.965400e+04, double 5.232200e+04, double -4.957700e+04, double -2.643000e+04, double -3.593000e+03, double 0.000000e+00]], align 16
@cl = internal constant [8 x [10 x double]] [[10 x double] [double 2.100000e+01, double -9.500000e+01, double -1.570000e+02, double 4.100000e+01, double -5.000000e+00, double 4.200000e+01, double 2.300000e+01, double 3.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.600000e+02, double -3.130000e+02, double -2.350000e+02, double 6.000000e+01, double -7.400000e+01, double -7.600000e+01, double -2.700000e+01, double 3.400000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -3.250000e+02, double -3.220000e+02, double -7.900000e+01, double 2.320000e+02, double -5.200000e+01, double 9.700000e+01, double 5.500000e+01, double -4.100000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 2.268000e+03, double -9.790000e+02, double 8.020000e+02, double 6.020000e+02, double -6.680000e+02, double -3.300000e+01, double 3.450000e+02, double 2.010000e+02, double -5.500000e+01, double 0.000000e+00], [10 x double] [double 7.610000e+03, double -4.997000e+03, double -7.689000e+03, double -5.841000e+03, double -2.617000e+03, double 1.115000e+03, double -7.480000e+02, double -6.070000e+02, double 6.074000e+03, double 3.540000e+02], [10 x double] [double -1.854900e+04, double 3.012500e+04, double 2.001200e+04, double -7.300000e+02, double 8.240000e+02, double 2.300000e+01, double 1.289000e+03, double -3.520000e+02, double -1.476700e+04, double -2.062000e+03], [10 x double] [double -1.352450e+05, double -1.459400e+04, double 4.197000e+03, double -4.030000e+03, double -5.630000e+03, double -2.898000e+03, double 2.540000e+03, double -3.060000e+02, double 2.939000e+03, double 1.986000e+03], [10 x double] [double 8.994800e+04, double 2.103000e+03, double 8.963000e+03, double 2.695000e+03, double 3.682000e+03, double 1.648000e+03, double 8.660000e+02, double -1.540000e+02, double -1.963000e+03, double -2.830000e+02]], align 16
@sl = internal constant [8 x [10 x double]] [[10 x double] [double -3.420000e+02, double 1.360000e+02, double -2.300000e+01, double 6.200000e+01, double 6.600000e+01, double -5.200000e+01, double -3.300000e+01, double 1.700000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 5.240000e+02, double -1.490000e+02, double -3.500000e+01, double 1.170000e+02, double 1.510000e+02, double 1.220000e+02, double -7.100000e+01, double -6.200000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double -1.050000e+02, double -1.370000e+02, double 2.580000e+02, double 3.500000e+01, double -1.160000e+02, double -8.800000e+01, double -1.120000e+02, double -8.000000e+01, double 0.000000e+00, double 0.000000e+00], [10 x double] [double 8.540000e+02, double -2.050000e+02, double -9.360000e+02, double -2.400000e+02, double 1.400000e+02, double -3.410000e+02, double -9.700000e+01, double -2.320000e+02, double 5.360000e+02, double 0.000000e+00], [10 x double] [double -5.698000e+04, double 8.016000e+03, double 1.012000e+03, double 1.448000e+03, double -3.024000e+03, double -3.710000e+03, double 3.180000e+02, double 5.030000e+02, double 3.767000e+03, double 5.770000e+02], [10 x double] [double 1.386060e+05, double -1.347800e+04, double -4.964000e+03, double 1.441000e+03, double -1.319000e+03, double -1.482000e+03, double 4.270000e+02, double 1.236000e+03, double -9.167000e+03, double -1.918000e+03], [10 x double] [double 7.123400e+04, double -4.111600e+04, double 5.334000e+03, double -4.935000e+03, double -1.848000e+03, double 6.600000e+01, double 4.340000e+02, double -1.748000e+03, double 3.780000e+03, double -7.010000e+02], [10 x double] [double -4.764500e+04, double 1.164700e+04, double 2.166000e+03, double 3.194000e+03, double 6.790000e+02, double 0.000000e+00, double -2.440000e+02, double -4.190000e+02, double -2.531000e+03, double 4.800000e+01]], align 16
@amas = internal constant [8 x double] [double 6.023600e+06, double 0x4118EF2E00000000, double 0x4114131200000000, double 3.098710e+06, double 0x40905D6B851EB852, double 3.498500e+03, double 2.286900e+04, double 1.931400e+04], align 16
@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%f %f %f\0A\00", align 1
@stdout = external global ptr, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local double @anpm(double noundef %a) #0 {
entry:
  %call = call double @fmod(double noundef %a, double noundef 0x401921FB54442D18) #5
  %0 = call double @llvm.fabs.f64(double %call)
  %cmp = fcmp oge double %0, 0x400921FB54442D18
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %cmp1 = fcmp olt double %a, 0.000000e+00
  %1 = zext i1 %cmp1 to i64
  %cond = select i1 %cmp1, double 0xC01921FB54442D18, double 0x401921FB54442D18
  %sub = fsub double %call, %cond
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %w.0 = phi double [ %sub, %if.then ], [ %call, %entry ]
  ret double %w.0
}

; Function Attrs: nounwind
declare double @fmod(double noundef, double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @planetpv(ptr noundef %epoch, i32 noundef %np, ptr noundef %pv) #0 {
entry:
  %arrayidx = getelementptr inbounds double, ptr %epoch, i64 0
  %0 = load double, ptr %arrayidx, align 8
  %sub = fsub double %0, 0x4142B42C80000000
  %arrayidx1 = getelementptr inbounds double, ptr %epoch, i64 1
  %1 = load double, ptr %arrayidx1, align 8
  %add = fadd double %sub, %1
  %div = fdiv double %add, 3.652500e+05
  %idxprom = sext i32 %np to i64
  %arrayidx2 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %idxprom
  %arrayidx3 = getelementptr inbounds [3 x double], ptr %arrayidx2, i64 0, i64 0
  %2 = load double, ptr %arrayidx3, align 8
  %idxprom4 = sext i32 %np to i64
  %arrayidx5 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %idxprom4
  %arrayidx6 = getelementptr inbounds [3 x double], ptr %arrayidx5, i64 0, i64 1
  %3 = load double, ptr %arrayidx6, align 8
  %idxprom7 = sext i32 %np to i64
  %arrayidx8 = getelementptr inbounds [8 x [3 x double]], ptr @a, i64 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [3 x double], ptr %arrayidx8, i64 0, i64 2
  %4 = load double, ptr %arrayidx9, align 8
  %5 = call double @llvm.fmuladd.f64(double %4, double %div, double %3)
  %6 = call double @llvm.fmuladd.f64(double %5, double %div, double %2)
  %idxprom10 = sext i32 %np to i64
  %arrayidx11 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %idxprom10
  %arrayidx12 = getelementptr inbounds [3 x double], ptr %arrayidx11, i64 0, i64 0
  %7 = load double, ptr %arrayidx12, align 8
  %idxprom13 = sext i32 %np to i64
  %arrayidx14 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %idxprom13
  %arrayidx15 = getelementptr inbounds [3 x double], ptr %arrayidx14, i64 0, i64 1
  %8 = load double, ptr %arrayidx15, align 8
  %idxprom16 = sext i32 %np to i64
  %arrayidx17 = getelementptr inbounds [8 x [3 x double]], ptr @dlm, i64 0, i64 %idxprom16
  %arrayidx18 = getelementptr inbounds [3 x double], ptr %arrayidx17, i64 0, i64 2
  %9 = load double, ptr %arrayidx18, align 8
  %10 = call double @llvm.fmuladd.f64(double %9, double %div, double %8)
  %mul20 = fmul double %10, %div
  %11 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %7, double %mul20)
  %mul = fmul double %11, 0x3ED455A5B2FF8F9D
  %idxprom21 = sext i32 %np to i64
  %arrayidx22 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %idxprom21
  %arrayidx23 = getelementptr inbounds [3 x double], ptr %arrayidx22, i64 0, i64 0
  %12 = load double, ptr %arrayidx23, align 8
  %idxprom24 = sext i32 %np to i64
  %arrayidx25 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %idxprom24
  %arrayidx26 = getelementptr inbounds [3 x double], ptr %arrayidx25, i64 0, i64 1
  %13 = load double, ptr %arrayidx26, align 8
  %idxprom27 = sext i32 %np to i64
  %arrayidx28 = getelementptr inbounds [8 x [3 x double]], ptr @e, i64 0, i64 %idxprom27
  %arrayidx29 = getelementptr inbounds [3 x double], ptr %arrayidx28, i64 0, i64 2
  %14 = load double, ptr %arrayidx29, align 8
  %15 = call double @llvm.fmuladd.f64(double %14, double %div, double %13)
  %16 = call double @llvm.fmuladd.f64(double %15, double %div, double %12)
  %idxprom32 = sext i32 %np to i64
  %arrayidx33 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [3 x double], ptr %arrayidx33, i64 0, i64 0
  %17 = load double, ptr %arrayidx34, align 8
  %idxprom36 = sext i32 %np to i64
  %arrayidx37 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %idxprom36
  %arrayidx38 = getelementptr inbounds [3 x double], ptr %arrayidx37, i64 0, i64 1
  %18 = load double, ptr %arrayidx38, align 8
  %idxprom39 = sext i32 %np to i64
  %arrayidx40 = getelementptr inbounds [8 x [3 x double]], ptr @pi, i64 0, i64 %idxprom39
  %arrayidx41 = getelementptr inbounds [3 x double], ptr %arrayidx40, i64 0, i64 2
  %19 = load double, ptr %arrayidx41, align 8
  %20 = call double @llvm.fmuladd.f64(double %19, double %div, double %18)
  %mul43 = fmul double %20, %div
  %21 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %17, double %mul43)
  %mul44 = fmul double %21, 0x3ED455A5B2FF8F9D
  %call = call double @anpm(double noundef %mul44)
  %idxprom45 = sext i32 %np to i64
  %arrayidx46 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [3 x double], ptr %arrayidx46, i64 0, i64 0
  %22 = load double, ptr %arrayidx47, align 8
  %idxprom49 = sext i32 %np to i64
  %arrayidx50 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %idxprom49
  %arrayidx51 = getelementptr inbounds [3 x double], ptr %arrayidx50, i64 0, i64 1
  %23 = load double, ptr %arrayidx51, align 8
  %idxprom52 = sext i32 %np to i64
  %arrayidx53 = getelementptr inbounds [8 x [3 x double]], ptr @dinc, i64 0, i64 %idxprom52
  %arrayidx54 = getelementptr inbounds [3 x double], ptr %arrayidx53, i64 0, i64 2
  %24 = load double, ptr %arrayidx54, align 8
  %25 = call double @llvm.fmuladd.f64(double %24, double %div, double %23)
  %mul56 = fmul double %25, %div
  %26 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %22, double %mul56)
  %mul57 = fmul double %26, 0x3ED455A5B2FF8F9D
  %idxprom58 = sext i32 %np to i64
  %arrayidx59 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %idxprom58
  %arrayidx60 = getelementptr inbounds [3 x double], ptr %arrayidx59, i64 0, i64 0
  %27 = load double, ptr %arrayidx60, align 8
  %idxprom62 = sext i32 %np to i64
  %arrayidx63 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %idxprom62
  %arrayidx64 = getelementptr inbounds [3 x double], ptr %arrayidx63, i64 0, i64 1
  %28 = load double, ptr %arrayidx64, align 8
  %idxprom65 = sext i32 %np to i64
  %arrayidx66 = getelementptr inbounds [8 x [3 x double]], ptr @omega, i64 0, i64 %idxprom65
  %arrayidx67 = getelementptr inbounds [3 x double], ptr %arrayidx66, i64 0, i64 2
  %29 = load double, ptr %arrayidx67, align 8
  %30 = call double @llvm.fmuladd.f64(double %29, double %div, double %28)
  %mul69 = fmul double %30, %div
  %31 = call double @llvm.fmuladd.f64(double 3.600000e+03, double %27, double %mul69)
  %mul70 = fmul double %31, 0x3ED455A5B2FF8F9D
  %call71 = call double @anpm(double noundef %mul70)
  %mul72 = fmul double 0x3FD702A41F2E9970, %div
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %da.0 = phi double [ %6, %entry ], [ %37, %for.inc ]
  %dl.0 = phi double [ %mul, %entry ], [ %41, %for.inc ]
  %cmp = icmp slt i32 %k.0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom73 = sext i32 %np to i64
  %arrayidx74 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %idxprom73
  %idxprom75 = sext i32 %k.0 to i64
  %arrayidx76 = getelementptr inbounds [9 x double], ptr %arrayidx74, i64 0, i64 %idxprom75
  %32 = load double, ptr %arrayidx76, align 8
  %mul77 = fmul double %32, %mul72
  %idxprom78 = sext i32 %np to i64
  %arrayidx79 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %idxprom78
  %idxprom80 = sext i32 %k.0 to i64
  %arrayidx81 = getelementptr inbounds [10 x double], ptr %arrayidx79, i64 0, i64 %idxprom80
  %33 = load double, ptr %arrayidx81, align 8
  %mul82 = fmul double %33, %mul72
  %idxprom83 = sext i32 %np to i64
  %arrayidx84 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %idxprom83
  %idxprom85 = sext i32 %k.0 to i64
  %arrayidx86 = getelementptr inbounds [9 x double], ptr %arrayidx84, i64 0, i64 %idxprom85
  %34 = load double, ptr %arrayidx86, align 8
  %call87 = call double @cos(double noundef %mul77) #5
  %idxprom89 = sext i32 %np to i64
  %arrayidx90 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %idxprom89
  %idxprom91 = sext i32 %k.0 to i64
  %arrayidx92 = getelementptr inbounds [9 x double], ptr %arrayidx90, i64 0, i64 %idxprom91
  %35 = load double, ptr %arrayidx92, align 8
  %call93 = call double @sin(double noundef %mul77) #5
  %mul94 = fmul double %35, %call93
  %36 = call double @llvm.fmuladd.f64(double %34, double %call87, double %mul94)
  %37 = call double @llvm.fmuladd.f64(double %36, double 0x3E7AD7F29ABCAF48, double %da.0)
  %idxprom96 = sext i32 %np to i64
  %arrayidx97 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %idxprom96
  %idxprom98 = sext i32 %k.0 to i64
  %arrayidx99 = getelementptr inbounds [10 x double], ptr %arrayidx97, i64 0, i64 %idxprom98
  %38 = load double, ptr %arrayidx99, align 8
  %call100 = call double @cos(double noundef %mul82) #5
  %idxprom102 = sext i32 %np to i64
  %arrayidx103 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %idxprom102
  %idxprom104 = sext i32 %k.0 to i64
  %arrayidx105 = getelementptr inbounds [10 x double], ptr %arrayidx103, i64 0, i64 %idxprom104
  %39 = load double, ptr %arrayidx105, align 8
  %call106 = call double @sin(double noundef %mul82) #5
  %mul107 = fmul double %39, %call106
  %40 = call double @llvm.fmuladd.f64(double %38, double %call100, double %mul107)
  %41 = call double @llvm.fmuladd.f64(double %40, double 0x3E7AD7F29ABCAF48, double %dl.0)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %k.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %idxprom109 = sext i32 %np to i64
  %arrayidx110 = getelementptr inbounds [8 x [9 x double]], ptr @kp, i64 0, i64 %idxprom109
  %arrayidx111 = getelementptr inbounds [9 x double], ptr %arrayidx110, i64 0, i64 8
  %42 = load double, ptr %arrayidx111, align 8
  %mul112 = fmul double %42, %mul72
  %idxprom113 = sext i32 %np to i64
  %arrayidx114 = getelementptr inbounds [8 x [9 x double]], ptr @ca, i64 0, i64 %idxprom113
  %arrayidx115 = getelementptr inbounds [9 x double], ptr %arrayidx114, i64 0, i64 8
  %43 = load double, ptr %arrayidx115, align 8
  %call116 = call double @cos(double noundef %mul112) #5
  %idxprom118 = sext i32 %np to i64
  %arrayidx119 = getelementptr inbounds [8 x [9 x double]], ptr @sa, i64 0, i64 %idxprom118
  %arrayidx120 = getelementptr inbounds [9 x double], ptr %arrayidx119, i64 0, i64 8
  %44 = load double, ptr %arrayidx120, align 8
  %call121 = call double @sin(double noundef %mul112) #5
  %mul122 = fmul double %44, %call121
  %45 = call double @llvm.fmuladd.f64(double %43, double %call116, double %mul122)
  %mul123 = fmul double %div, %45
  %46 = call double @llvm.fmuladd.f64(double %mul123, double 0x3E7AD7F29ABCAF48, double %da.0)
  br label %for.cond125

for.cond125:                                      ; preds = %for.inc147, %for.end
  %k.1 = phi i32 [ 8, %for.end ], [ %inc148, %for.inc147 ]
  %dl.1 = phi double [ %dl.0, %for.end ], [ %51, %for.inc147 ]
  %cmp126 = icmp sle i32 %k.1, 9
  br i1 %cmp126, label %for.body127, label %for.end149

for.body127:                                      ; preds = %for.cond125
  %idxprom128 = sext i32 %np to i64
  %arrayidx129 = getelementptr inbounds [8 x [10 x double]], ptr @kq, i64 0, i64 %idxprom128
  %idxprom130 = sext i32 %k.1 to i64
  %arrayidx131 = getelementptr inbounds [10 x double], ptr %arrayidx129, i64 0, i64 %idxprom130
  %47 = load double, ptr %arrayidx131, align 8
  %mul132 = fmul double %47, %mul72
  %idxprom133 = sext i32 %np to i64
  %arrayidx134 = getelementptr inbounds [8 x [10 x double]], ptr @cl, i64 0, i64 %idxprom133
  %idxprom135 = sext i32 %k.1 to i64
  %arrayidx136 = getelementptr inbounds [10 x double], ptr %arrayidx134, i64 0, i64 %idxprom135
  %48 = load double, ptr %arrayidx136, align 8
  %call137 = call double @cos(double noundef %mul132) #5
  %idxprom139 = sext i32 %np to i64
  %arrayidx140 = getelementptr inbounds [8 x [10 x double]], ptr @sl, i64 0, i64 %idxprom139
  %idxprom141 = sext i32 %k.1 to i64
  %arrayidx142 = getelementptr inbounds [10 x double], ptr %arrayidx140, i64 0, i64 %idxprom141
  %49 = load double, ptr %arrayidx142, align 8
  %call143 = call double @sin(double noundef %mul132) #5
  %mul144 = fmul double %49, %call143
  %50 = call double @llvm.fmuladd.f64(double %48, double %call137, double %mul144)
  %mul145 = fmul double %div, %50
  %51 = call double @llvm.fmuladd.f64(double %mul145, double 0x3E7AD7F29ABCAF48, double %dl.1)
  br label %for.inc147

for.inc147:                                       ; preds = %for.body127
  %inc148 = add nsw i32 %k.1, 1
  br label %for.cond125, !llvm.loop !8

for.end149:                                       ; preds = %for.cond125
  %call150 = call double @fmod(double noundef %dl.1, double noundef 0x401921FB54442D18) #5
  %sub151 = fsub double %call150, %call
  %call152 = call double @sin(double noundef %sub151) #5
  %52 = call double @llvm.fmuladd.f64(double %16, double %call152, double %sub151)
  br label %while.body

while.body:                                       ; preds = %if.end, %for.end149
  %k.2 = phi i32 [ 0, %for.end149 ], [ %add161, %if.end ]
  %ae.0 = phi double [ %52, %for.end149 ], [ %add160, %if.end ]
  %sub154 = fsub double %sub151, %ae.0
  %call155 = call double @sin(double noundef %ae.0) #5
  %53 = call double @llvm.fmuladd.f64(double %16, double %call155, double %sub154)
  %call157 = call double @cos(double noundef %ae.0) #5
  %neg = fneg double %16
  %54 = call double @llvm.fmuladd.f64(double %neg, double %call157, double 1.000000e+00)
  %div159 = fdiv double %53, %54
  %add160 = fadd double %ae.0, %div159
  %add161 = add nsw i32 %k.2, 1
  %cmp162 = icmp sge i32 %add161, 10
  br i1 %cmp162, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %55 = call double @llvm.fabs.f64(double %div159)
  %cmp163 = fcmp olt double %55, 0x3D719799812DEA11
  br i1 %cmp163, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.body
  br label %while.end

if.end:                                           ; preds = %lor.lhs.false
  br label %while.body

while.end:                                        ; preds = %if.then
  %div164 = fdiv double %add160, 2.000000e+00
  %add165 = fadd double 1.000000e+00, %16
  %sub166 = fsub double 1.000000e+00, %16
  %div167 = fdiv double %add165, %sub166
  %call168 = call double @sqrt(double noundef %div167) #5
  %call169 = call double @sin(double noundef %div164) #5
  %mul170 = fmul double %call168, %call169
  %call171 = call double @cos(double noundef %div164) #5
  %call172 = call double @atan2(double noundef %mul170, double noundef %call171) #5
  %mul173 = fmul double 2.000000e+00, %call172
  %call174 = call double @cos(double noundef %add160) #5
  %neg176 = fneg double %16
  %56 = call double @llvm.fmuladd.f64(double %neg176, double %call174, double 1.000000e+00)
  %mul177 = fmul double %46, %56
  %idxprom178 = sext i32 %np to i64
  %arrayidx179 = getelementptr inbounds [8 x double], ptr @amas, i64 0, i64 %idxprom178
  %57 = load double, ptr %arrayidx179, align 8
  %div180 = fdiv double 1.000000e+00, %57
  %add181 = fadd double 1.000000e+00, %div180
  %mul182 = fmul double %46, %46
  %mul183 = fmul double %mul182, %46
  %div184 = fdiv double %add181, %mul183
  %call185 = call double @sqrt(double noundef %div184) #5
  %mul186 = fmul double 0x3F919D6D51A6B69A, %call185
  %div187 = fdiv double %mul57, 2.000000e+00
  %call188 = call double @sin(double noundef %div187) #5
  %call189 = call double @cos(double noundef %call71) #5
  %mul190 = fmul double %call188, %call189
  %call191 = call double @sin(double noundef %call71) #5
  %mul192 = fmul double %call188, %call191
  %add193 = fadd double %mul173, %call
  %call194 = call double @sin(double noundef %add193) #5
  %call195 = call double @cos(double noundef %add193) #5
  %mul197 = fmul double %mul190, %call194
  %neg198 = fneg double %mul197
  %58 = call double @llvm.fmuladd.f64(double %mul192, double %call195, double %neg198)
  %mul199 = fmul double 2.000000e+00, %58
  %neg201 = fneg double %16
  %59 = call double @llvm.fmuladd.f64(double %neg201, double %16, double 1.000000e+00)
  %call202 = call double @sqrt(double noundef %59) #5
  %div203 = fdiv double %46, %call202
  %div204 = fdiv double %mul57, 2.000000e+00
  %call205 = call double @cos(double noundef %div204) #5
  %call206 = call double @sin(double noundef %call) #5
  %60 = call double @llvm.fmuladd.f64(double %16, double %call206, double %call194)
  %mul208 = fmul double %60, %div203
  %call209 = call double @cos(double noundef %call) #5
  %61 = call double @llvm.fmuladd.f64(double %16, double %call209, double %call195)
  %mul211 = fmul double %61, %div203
  %mul212 = fmul double 2.000000e+00, %mul192
  %mul213 = fmul double %mul212, %mul190
  %neg215 = fneg double %mul199
  %62 = call double @llvm.fmuladd.f64(double %neg215, double %mul192, double %call195)
  %mul216 = fmul double %mul177, %62
  %63 = call double @llvm.fmuladd.f64(double %mul199, double %mul190, double %call194)
  %mul218 = fmul double %mul177, %63
  %fneg = fneg double %mul199
  %mul219 = fmul double %fneg, %call205
  %mul220 = fmul double %mul177, %mul219
  %arrayidx221 = getelementptr inbounds [3 x double], ptr %pv, i64 0
  %arrayidx222 = getelementptr inbounds [3 x double], ptr %arrayidx221, i64 0, i64 0
  store double %mul216, ptr %arrayidx222, align 8
  %mul224 = fmul double %mul220, 0x3FD9752E50F4B399
  %neg225 = fneg double %mul224
  %64 = call double @llvm.fmuladd.f64(double %mul218, double 0x3FED5C0357681EF3, double %neg225)
  %arrayidx226 = getelementptr inbounds [3 x double], ptr %pv, i64 0
  %arrayidx227 = getelementptr inbounds [3 x double], ptr %arrayidx226, i64 0, i64 1
  store double %64, ptr %arrayidx227, align 8
  %mul229 = fmul double %mul220, 0x3FED5C0357681EF3
  %65 = call double @llvm.fmuladd.f64(double %mul218, double 0x3FD9752E50F4B399, double %mul229)
  %arrayidx230 = getelementptr inbounds [3 x double], ptr %pv, i64 0
  %arrayidx231 = getelementptr inbounds [3 x double], ptr %arrayidx230, i64 0, i64 2
  store double %65, ptr %arrayidx231, align 8
  %mul232 = fmul double 2.000000e+00, %mul192
  %66 = call double @llvm.fmuladd.f64(double %mul232, double %mul192, double -1.000000e+00)
  %mul235 = fmul double %mul213, %mul211
  %67 = call double @llvm.fmuladd.f64(double %66, double %mul208, double %mul235)
  %mul236 = fmul double %mul186, %67
  %mul237 = fmul double 2.000000e+00, %mul190
  %neg239 = fneg double %mul237
  %68 = call double @llvm.fmuladd.f64(double %neg239, double %mul190, double 1.000000e+00)
  %mul241 = fmul double %mul213, %mul208
  %neg242 = fneg double %mul241
  %69 = call double @llvm.fmuladd.f64(double %68, double %mul211, double %neg242)
  %mul243 = fmul double %mul186, %69
  %mul244 = fmul double 2.000000e+00, %call205
  %mul246 = fmul double %mul190, %mul211
  %70 = call double @llvm.fmuladd.f64(double %mul192, double %mul208, double %mul246)
  %mul247 = fmul double %mul244, %70
  %mul248 = fmul double %mul186, %mul247
  %arrayidx249 = getelementptr inbounds [3 x double], ptr %pv, i64 1
  %arrayidx250 = getelementptr inbounds [3 x double], ptr %arrayidx249, i64 0, i64 0
  store double %mul236, ptr %arrayidx250, align 8
  %mul252 = fmul double %mul248, 0x3FD9752E50F4B399
  %neg253 = fneg double %mul252
  %71 = call double @llvm.fmuladd.f64(double %mul243, double 0x3FED5C0357681EF3, double %neg253)
  %arrayidx254 = getelementptr inbounds [3 x double], ptr %pv, i64 1
  %arrayidx255 = getelementptr inbounds [3 x double], ptr %arrayidx254, i64 0, i64 1
  store double %71, ptr %arrayidx255, align 8
  %mul257 = fmul double %mul248, 0x3FED5C0357681EF3
  %72 = call double @llvm.fmuladd.f64(double %mul243, double 0x3FD9752E50F4B399, double %mul257)
  %arrayidx258 = getelementptr inbounds [3 x double], ptr %pv, i64 1
  %arrayidx259 = getelementptr inbounds [3 x double], ptr %arrayidx258, i64 0, i64 2
  store double %72, ptr %arrayidx259, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nounwind
declare double @atan2(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @radecdist(ptr noundef %state, ptr noundef %rdd) #0 {
entry:
  %arrayidx = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx1 = getelementptr inbounds [3 x double], ptr %arrayidx, i64 0, i64 0
  %0 = load double, ptr %arrayidx1, align 8
  %arrayidx2 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx3 = getelementptr inbounds [3 x double], ptr %arrayidx2, i64 0, i64 0
  %1 = load double, ptr %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx5 = getelementptr inbounds [3 x double], ptr %arrayidx4, i64 0, i64 1
  %2 = load double, ptr %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx7 = getelementptr inbounds [3 x double], ptr %arrayidx6, i64 0, i64 1
  %3 = load double, ptr %arrayidx7, align 8
  %mul8 = fmul double %2, %3
  %4 = call double @llvm.fmuladd.f64(double %0, double %1, double %mul8)
  %arrayidx9 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx10 = getelementptr inbounds [3 x double], ptr %arrayidx9, i64 0, i64 2
  %5 = load double, ptr %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx12 = getelementptr inbounds [3 x double], ptr %arrayidx11, i64 0, i64 2
  %6 = load double, ptr %arrayidx12, align 8
  %7 = call double @llvm.fmuladd.f64(double %5, double %6, double %4)
  %call = call double @sqrt(double noundef %7) #5
  %arrayidx13 = getelementptr inbounds double, ptr %rdd, i64 2
  store double %call, ptr %arrayidx13, align 8
  %arrayidx14 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx15 = getelementptr inbounds [3 x double], ptr %arrayidx14, i64 0, i64 1
  %8 = load double, ptr %arrayidx15, align 8
  %arrayidx16 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx17 = getelementptr inbounds [3 x double], ptr %arrayidx16, i64 0, i64 0
  %9 = load double, ptr %arrayidx17, align 8
  %call18 = call double @atan2(double noundef %8, double noundef %9) #5
  %mul = fmul double %call18, 0x400E8EC8A4AEACC4
  %arrayidx19 = getelementptr inbounds double, ptr %rdd, i64 0
  store double %mul, ptr %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds double, ptr %rdd, i64 0
  %10 = load double, ptr %arrayidx20, align 8
  %cmp = fcmp olt double %10, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %arrayidx21 = getelementptr inbounds double, ptr %rdd, i64 0
  %11 = load double, ptr %arrayidx21, align 8
  %add = fadd double %11, 2.400000e+01
  store double %add, ptr %arrayidx21, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arrayidx22 = getelementptr inbounds [3 x double], ptr %state, i64 0
  %arrayidx23 = getelementptr inbounds [3 x double], ptr %arrayidx22, i64 0, i64 2
  %12 = load double, ptr %arrayidx23, align 8
  %arrayidx24 = getelementptr inbounds double, ptr %rdd, i64 2
  %13 = load double, ptr %arrayidx24, align 8
  %div = fdiv double %12, %13
  %call25 = call double @asin(double noundef %div) #5
  %mul26 = fmul double %call25, 0x404CA5DC1A63C1F8
  %arrayidx27 = getelementptr inbounds double, ptr %rdd, i64 1
  store double %mul26, ptr %arrayidx27, align 8
  ret void
}

; Function Attrs: nounwind
declare double @asin(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %jd = alloca [2 x double], align 16
  %pv = alloca [2 x [3 x double]], align 16
  %position = alloca [8 x [3 x double]], align 16
  %cmp = icmp sgt i32 %argc, 1
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %i.0 = phi i32 [ 1, %if.then ], [ %inc, %for.inc ]
  %cmp1 = icmp slt i32 %i.0, %argc
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds ptr, ptr %argv, i64 1
  %0 = load ptr, ptr %arrayidx, align 8
  %call = call i32 @strcmp(ptr noundef %0, ptr noundef @.str) #6
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %if.then2, %for.cond
  br label %if.end3

if.end3:                                          ; preds = %for.end, %entry
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc26, %if.end3
  %i.1 = phi i32 [ 0, %if.end3 ], [ %inc27, %for.inc26 ]
  %cmp5 = icmp slt i32 %i.1, 20
  br i1 %cmp5, label %for.body6, label %for.end28

for.body6:                                        ; preds = %for.cond4
  %arrayidx7 = getelementptr inbounds [2 x double], ptr %jd, i64 0, i64 0
  store double 0x4142B42C80000000, ptr %arrayidx7, align 16
  %arrayidx8 = getelementptr inbounds [2 x double], ptr %jd, i64 0, i64 1
  store double 0.000000e+00, ptr %arrayidx8, align 8
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc23, %for.body6
  %n.0 = phi i32 [ 0, %for.body6 ], [ %inc24, %for.inc23 ]
  %cmp10 = icmp slt i32 %n.0, 36525
  br i1 %cmp10, label %for.body11, label %for.end25

for.body11:                                       ; preds = %for.cond9
  %arrayidx12 = getelementptr inbounds [2 x double], ptr %jd, i64 0, i64 0
  %1 = load double, ptr %arrayidx12, align 16
  %add = fadd double %1, 1.000000e+00
  store double %add, ptr %arrayidx12, align 16
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc20, %for.body11
  %p.0 = phi i32 [ 0, %for.body11 ], [ %inc21, %for.inc20 ]
  %cmp14 = icmp slt i32 %p.0, 8
  br i1 %cmp14, label %for.body15, label %for.end22

for.body15:                                       ; preds = %for.cond13
  %arraydecay = getelementptr inbounds [2 x double], ptr %jd, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [2 x [3 x double]], ptr %pv, i64 0, i64 0
  call void @planetpv(ptr noundef %arraydecay, i32 noundef %p.0, ptr noundef %arraydecay16)
  %arraydecay17 = getelementptr inbounds [2 x [3 x double]], ptr %pv, i64 0, i64 0
  %idxprom = sext i32 %p.0 to i64
  %arrayidx18 = getelementptr inbounds [8 x [3 x double]], ptr %position, i64 0, i64 %idxprom
  %arraydecay19 = getelementptr inbounds [3 x double], ptr %arrayidx18, i64 0, i64 0
  call void @radecdist(ptr noundef %arraydecay17, ptr noundef %arraydecay19)
  br label %for.inc20

for.inc20:                                        ; preds = %for.body15
  %inc21 = add nsw i32 %p.0, 1
  br label %for.cond13, !llvm.loop !10

for.end22:                                        ; preds = %for.cond13
  br label %for.inc23

for.inc23:                                        ; preds = %for.end22
  %inc24 = add nsw i32 %n.0, 1
  br label %for.cond9, !llvm.loop !11

for.end25:                                        ; preds = %for.cond9
  br label %for.inc26

for.inc26:                                        ; preds = %for.end25
  %inc27 = add nsw i32 %i.1, 1
  br label %for.cond4, !llvm.loop !12

for.end28:                                        ; preds = %for.cond4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc42, %for.end28
  %p.1 = phi i32 [ 0, %for.end28 ], [ %inc43, %for.inc42 ]
  %cmp30 = icmp slt i32 %p.1, 8
  br i1 %cmp30, label %for.body31, label %for.end44

for.body31:                                       ; preds = %for.cond29
  %idxprom32 = sext i32 %p.1 to i64
  %arrayidx33 = getelementptr inbounds [8 x [3 x double]], ptr %position, i64 0, i64 %idxprom32
  %arrayidx34 = getelementptr inbounds [3 x double], ptr %arrayidx33, i64 0, i64 0
  %2 = load double, ptr %arrayidx34, align 8
  %idxprom35 = sext i32 %p.1 to i64
  %arrayidx36 = getelementptr inbounds [8 x [3 x double]], ptr %position, i64 0, i64 %idxprom35
  %arrayidx37 = getelementptr inbounds [3 x double], ptr %arrayidx36, i64 0, i64 1
  %3 = load double, ptr %arrayidx37, align 8
  %idxprom38 = sext i32 %p.1 to i64
  %arrayidx39 = getelementptr inbounds [8 x [3 x double]], ptr %position, i64 0, i64 %idxprom38
  %arrayidx40 = getelementptr inbounds [3 x double], ptr %arrayidx39, i64 0, i64 2
  %4 = load double, ptr %arrayidx40, align 8
  %call41 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %2, double noundef %3, double noundef %4)
  br label %for.inc42

for.inc42:                                        ; preds = %for.body31
  %inc43 = add nsw i32 %p.1, 1
  br label %for.cond29, !llvm.loop !13

for.end44:                                        ; preds = %for.cond29
  %5 = load ptr, ptr @stdout, align 8
  %call45 = call i32 @fflush(ptr noundef %5)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

declare i32 @fflush(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.0 (git@github.com:MooMooHorse/COOL-compiler.git ce919e92afed6522fae11fdf69158b4b9ead2296)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
