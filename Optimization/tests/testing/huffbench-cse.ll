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
define dso_local ptr @generate_test_data(i64 noundef %n) #0 {
entry:
  %call = call noalias ptr @malloc(i64 noundef %n) #7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %ptr.0 = phi ptr [ %call, %entry ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %conv = sext i32 %i.0 to i64
  %cmp = icmp ult i64 %conv, %n
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call2 = call i64 @random4()
  %arrayidx = getelementptr inbounds i8, ptr @.str, i64 %call2
  %0 = load i8, ptr %arrayidx, align 1
  store i8 %0, ptr %ptr.0, align 1
  %incdec.ptr = getelementptr inbounds i8, ptr %ptr.0, i32 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  ret ptr %call
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @compdecomp(ptr noundef %data, i64 noundef %data_len) #0 {
entry:
  %freq = alloca [512 x i64], align 16
  %heap = alloca [256 x i64], align 16
  %link = alloca [512 x i32], align 16
  %code = alloca [256 x i64], align 16
  %clen = alloca [256 x i8], align 16
  %heap2 = alloca [256 x i64], align 16
  %outc = alloca [256 x i8], align 16
  %add = add i64 %data_len, 1
  %call = call noalias ptr @malloc(i64 noundef %add) #7
  %mul = mul i64 1, %add
  call void @llvm.memset.p0.i64(ptr align 1 %call, i8 0, i64 %mul, i1 false)
  %arraydecay = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay, i8 0, i64 4096, i1 false)
  %arraydecay2 = getelementptr inbounds [256 x i64], ptr %heap, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay2, i8 0, i64 2048, i1 false)
  %arraydecay3 = getelementptr inbounds [512 x i32], ptr %link, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay3, i8 0, i64 2048, i1 false)
  %arraydecay4 = getelementptr inbounds [256 x i64], ptr %code, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay4, i8 0, i64 2048, i1 false)
  %arraydecay5 = getelementptr inbounds [256 x i8], ptr %clen, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay5, i8 0, i64 256, i1 false)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %dptr.0 = phi ptr [ %data, %entry ], [ %incdec.ptr, %for.inc ]
  %i.0 = phi i64 [ 0, %entry ], [ %inc6, %for.inc ]
  %cmp = icmp ult i64 %i.0, %data_len
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %dptr.0, align 1
  %conv = zext i8 %0 to i64
  %arrayidx = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 %conv
  %1 = load i64, ptr %arrayidx, align 8
  %inc = add i64 %1, 1
  store i64 %inc, ptr %arrayidx, align 8
  %incdec.ptr = getelementptr inbounds i8, ptr %dptr.0, i32 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc6 = add i64 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc14, %for.end
  %n.0 = phi i64 [ 0, %for.end ], [ %n.1, %for.inc14 ]
  %i.1 = phi i64 [ 0, %for.end ], [ %inc15, %for.inc14 ]
  %cmp8 = icmp ult i64 %i.1, 256
  br i1 %cmp8, label %for.body10, label %for.end16

for.body10:                                       ; preds = %for.cond7
  %arrayidx11 = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 %i.1
  %2 = load i64, ptr %arrayidx11, align 8
  %tobool = icmp ne i64 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body10
  %arrayidx12 = getelementptr inbounds [256 x i64], ptr %heap, i64 0, i64 %n.0
  store i64 %i.1, ptr %arrayidx12, align 8
  %inc13 = add i64 %n.0, 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body10
  %n.1 = phi i64 [ %inc13, %if.then ], [ %n.0, %for.body10 ]
  br label %for.inc14

for.inc14:                                        ; preds = %if.end
  %inc15 = add i64 %i.1, 1
  br label %for.cond7, !llvm.loop !9

for.end16:                                        ; preds = %for.cond7
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc25, %for.end16
  %i.2 = phi i64 [ %n.0, %for.end16 ], [ %dec, %for.inc25 ]
  %cmp18 = icmp ugt i64 %i.2, 0
  br i1 %cmp18, label %for.body20, label %for.end26

for.body20:                                       ; preds = %for.cond17
  %conv23 = trunc i64 %n.0 to i32
  %conv24 = trunc i64 %i.2 to i32
  call void @heap_adjust(ptr noundef %arraydecay, ptr noundef %arraydecay2, i32 noundef %conv23, i32 noundef %conv24)
  br label %for.inc25

for.inc25:                                        ; preds = %for.body20
  %dec = add i64 %i.2, -1
  br label %for.cond17, !llvm.loop !10

for.end26:                                        ; preds = %for.cond17
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end26
  %n.2 = phi i64 [ %n.0, %for.end26 ], [ %dec29, %while.body ]
  %cmp27 = icmp ugt i64 %n.2, 1
  br i1 %cmp27, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %dec29 = add i64 %n.2, -1
  %3 = load i64, ptr %arraydecay2, align 16
  %arrayidx31 = getelementptr inbounds [256 x i64], ptr %heap, i64 0, i64 %dec29
  %4 = load i64, ptr %arrayidx31, align 8
  store i64 %4, ptr %arraydecay2, align 16
  %conv35 = trunc i64 %dec29 to i32
  call void @heap_adjust(ptr noundef %arraydecay, ptr noundef %arraydecay2, i32 noundef %conv35, i32 noundef 1)
  %5 = load i64, ptr %arraydecay2, align 16
  %arrayidx37 = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 %5
  %6 = load i64, ptr %arrayidx37, align 8
  %arrayidx38 = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 %3
  %7 = load i64, ptr %arrayidx38, align 8
  %add39 = add i64 %6, %7
  %add40 = add i64 256, %dec29
  %arrayidx41 = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 %add40
  store i64 %add39, ptr %arrayidx41, align 8
  %conv43 = trunc i64 %add40 to i32
  %arrayidx44 = getelementptr inbounds [512 x i32], ptr %link, i64 0, i64 %3
  store i32 %conv43, ptr %arrayidx44, align 4
  %sub = sub i64 -256, %dec29
  %conv45 = trunc i64 %sub to i32
  %8 = load i64, ptr %arraydecay2, align 16
  %arrayidx47 = getelementptr inbounds [512 x i32], ptr %link, i64 0, i64 %8
  store i32 %conv45, ptr %arrayidx47, align 4
  store i64 %add40, ptr %arraydecay2, align 16
  %conv52 = trunc i64 %dec29 to i32
  call void @heap_adjust(ptr noundef %arraydecay, ptr noundef %arraydecay2, i32 noundef %conv52, i32 noundef 1)
  br label %while.cond, !llvm.loop !11

while.end:                                        ; preds = %while.cond
  %add53 = add i64 256, %n.2
  %arrayidx54 = getelementptr inbounds [512 x i32], ptr %link, i64 0, i64 %add53
  store i32 0, ptr %arrayidx54, align 4
  br label %for.cond55

for.cond55:                                       ; preds = %for.inc89, %while.end
  %maxx.0 = phi i64 [ 0, %while.end ], [ %maxx.2, %for.inc89 ]
  %m.0 = phi i64 [ 0, %while.end ], [ %inc90, %for.inc89 ]
  %maxi.0 = phi i64 [ 0, %while.end ], [ %maxi.2, %for.inc89 ]
  %cmp56 = icmp ult i64 %m.0, 256
  br i1 %cmp56, label %for.body58, label %for.end91

for.body58:                                       ; preds = %for.cond55
  %arrayidx59 = getelementptr inbounds [512 x i64], ptr %freq, i64 0, i64 %m.0
  %9 = load i64, ptr %arrayidx59, align 8
  %tobool60 = icmp ne i64 %9, 0
  br i1 %tobool60, label %if.else, label %if.then61

if.then61:                                        ; preds = %for.body58
  %arrayidx62 = getelementptr inbounds [256 x i64], ptr %code, i64 0, i64 %m.0
  store i64 0, ptr %arrayidx62, align 8
  %arrayidx63 = getelementptr inbounds [256 x i8], ptr %clen, i64 0, i64 %m.0
  store i8 0, ptr %arrayidx63, align 1
  br label %if.end88

if.else:                                          ; preds = %for.body58
  %arrayidx64 = getelementptr inbounds [512 x i32], ptr %link, i64 0, i64 %m.0
  %10 = load i32, ptr %arrayidx64, align 4
  br label %while.cond65

while.cond65:                                     ; preds = %if.end73, %if.else
  %x.0 = phi i64 [ 0, %if.else ], [ %x.1, %if.end73 ]
  %l.0 = phi i32 [ %10, %if.else ], [ %11, %if.end73 ]
  %j.0 = phi i64 [ 1, %if.else ], [ %shl, %if.end73 ]
  %i.3 = phi i64 [ 0, %if.else ], [ %inc75, %if.end73 ]
  %tobool66 = icmp ne i32 %l.0, 0
  br i1 %tobool66, label %while.body67, label %while.end76

while.body67:                                     ; preds = %while.cond65
  br i1 %tobool66, label %if.then70, label %if.end73

if.then70:                                        ; preds = %while.body67
  %add71 = add i64 %x.0, %j.0
  %sub72 = sub nsw i32 0, %l.0
  br label %if.end73

if.end73:                                         ; preds = %if.then70, %while.body67
  %x.1 = phi i64 [ %add71, %if.then70 ], [ %x.0, %while.body67 ]
  %l.1 = phi i32 [ %sub72, %if.then70 ], [ %l.0, %while.body67 ]
  %idxprom = sext i32 %l.1 to i64
  %arrayidx74 = getelementptr inbounds [512 x i32], ptr %link, i64 0, i64 %idxprom
  %11 = load i32, ptr %arrayidx74, align 4
  %shl = shl i64 %j.0, 1
  %inc75 = add i64 %i.3, 1
  br label %while.cond65, !llvm.loop !12

while.end76:                                      ; preds = %while.cond65
  %arrayidx77 = getelementptr inbounds [256 x i64], ptr %code, i64 0, i64 %m.0
  store i64 %x.0, ptr %arrayidx77, align 8
  %conv78 = trunc i64 %i.3 to i8
  %arrayidx79 = getelementptr inbounds [256 x i8], ptr %clen, i64 0, i64 %m.0
  store i8 %conv78, ptr %arrayidx79, align 1
  %cmp80 = icmp ugt i64 %x.0, %maxx.0
  br i1 %cmp80, label %if.then82, label %if.end83

if.then82:                                        ; preds = %while.end76
  br label %if.end83

if.end83:                                         ; preds = %if.then82, %while.end76
  %maxx.1 = phi i64 [ %x.0, %if.then82 ], [ %maxx.0, %while.end76 ]
  %cmp84 = icmp ugt i64 %i.3, %maxi.0
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %if.end83
  br label %if.end87

if.end87:                                         ; preds = %if.then86, %if.end83
  %maxi.1 = phi i64 [ %i.3, %if.then86 ], [ %maxi.0, %if.end83 ]
  br label %if.end88

if.end88:                                         ; preds = %if.end87, %if.then61
  %maxx.2 = phi i64 [ %maxx.1, %if.end87 ], [ %maxx.0, %if.then61 ]
  %maxi.2 = phi i64 [ %maxi.1, %if.end87 ], [ %maxi.0, %if.then61 ]
  br label %for.inc89

for.inc89:                                        ; preds = %if.end88
  %inc90 = add i64 %m.0, 1
  br label %for.cond55, !llvm.loop !13

for.end91:                                        ; preds = %for.cond55
  %cmp92 = icmp ugt i64 %maxi.0, 64
  br i1 %cmp92, label %if.then94, label %if.end96

if.then94:                                        ; preds = %for.end91
  %12 = load ptr, ptr @stderr, align 8
  %call95 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

if.end96:                                         ; preds = %for.end91
  %cmp97 = icmp eq i64 %maxx.0, 0
  br i1 %cmp97, label %if.then99, label %if.end101

if.then99:                                        ; preds = %if.end96
  %13 = load ptr, ptr @stderr, align 8
  %call100 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

if.end101:                                        ; preds = %if.end96
  br label %for.cond102

for.cond102:                                      ; preds = %for.inc146, %if.end101
  %dptr.1 = phi ptr [ %data, %if.end101 ], [ %incdec.ptr145, %for.inc146 ]
  %comp_len.0 = phi i64 [ 0, %if.end101 ], [ %comp_len.1, %for.inc146 ]
  %bout.0 = phi i8 [ 0, %if.end101 ], [ %bout.1, %for.inc146 ]
  %j.1 = phi i64 [ 0, %if.end101 ], [ %inc147, %for.inc146 ]
  %bit.0 = phi i32 [ -1, %if.end101 ], [ %bit.1, %for.inc146 ]
  %cmp103 = icmp ult i64 %j.1, %data_len
  br i1 %cmp103, label %for.body105, label %for.end148

for.body105:                                      ; preds = %for.cond102
  %14 = load i8, ptr %dptr.1, align 1
  %idxprom106 = zext i8 %14 to i64
  %arrayidx107 = getelementptr inbounds [256 x i8], ptr %clen, i64 0, i64 %idxprom106
  %15 = load i8, ptr %arrayidx107, align 1
  %conv108 = zext i8 %15 to i32
  %sub109 = sub nsw i32 %conv108, 1
  %shl110 = shl i32 1, %sub109
  %conv111 = sext i32 %shl110 to i64
  br label %for.cond112

for.cond112:                                      ; preds = %for.inc142, %for.body105
  %comp_len.1 = phi i64 [ %comp_len.0, %for.body105 ], [ %comp_len.2, %for.inc142 ]
  %bout.1 = phi i8 [ %bout.0, %for.body105 ], [ %bout.3, %for.inc142 ]
  %mask.0 = phi i64 [ %conv111, %for.body105 ], [ %shr, %for.inc142 ]
  %i.4 = phi i64 [ 0, %for.body105 ], [ %inc143, %for.inc142 ]
  %bit.1 = phi i32 [ %bit.0, %for.body105 ], [ %bit.2, %for.inc142 ]
  %16 = load i8, ptr %dptr.1, align 1
  %idxprom113 = zext i8 %16 to i64
  %arrayidx114 = getelementptr inbounds [256 x i8], ptr %clen, i64 0, i64 %idxprom113
  %17 = load i8, ptr %arrayidx114, align 1
  %conv115 = zext i8 %17 to i64
  %cmp116 = icmp ult i64 %i.4, %conv115
  br i1 %cmp116, label %for.body118, label %for.end144

for.body118:                                      ; preds = %for.cond112
  %cmp119 = icmp eq i32 %bit.1, 7
  br i1 %cmp119, label %if.then121, label %if.else129

if.then121:                                       ; preds = %for.body118
  %arrayidx122 = getelementptr inbounds i8, ptr %call, i64 %comp_len.1
  store i8 %bout.1, ptr %arrayidx122, align 1
  %inc123 = add i64 %comp_len.1, 1
  %cmp124 = icmp eq i64 %inc123, %data_len
  br i1 %cmp124, label %if.then126, label %if.end128

if.then126:                                       ; preds = %if.then121
  %18 = load ptr, ptr @stderr, align 8
  %call127 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

if.end128:                                        ; preds = %if.then121
  br label %if.end134

if.else129:                                       ; preds = %for.body118
  %inc130 = add nsw i32 %bit.1, 1
  %conv131 = sext i8 %bout.1 to i32
  %shl132 = shl i32 %conv131, 1
  %conv133 = trunc i32 %shl132 to i8
  br label %if.end134

if.end134:                                        ; preds = %if.else129, %if.end128
  %comp_len.2 = phi i64 [ %inc123, %if.end128 ], [ %comp_len.1, %if.else129 ]
  %bout.2 = phi i8 [ 0, %if.end128 ], [ %conv133, %if.else129 ]
  %bit.2 = phi i32 [ 0, %if.end128 ], [ %inc130, %if.else129 ]
  %19 = load i8, ptr %dptr.1, align 1
  %idxprom135 = zext i8 %19 to i64
  %arrayidx136 = getelementptr inbounds [256 x i64], ptr %code, i64 0, i64 %idxprom135
  %20 = load i64, ptr %arrayidx136, align 8
  %and = and i64 %20, %mask.0
  %tobool137 = icmp ne i64 %and, 0
  br i1 %tobool137, label %if.then138, label %if.end141

if.then138:                                       ; preds = %if.end134
  %conv139 = sext i8 %bout.2 to i32
  %or = or i32 %conv139, 1
  %conv140 = trunc i32 %or to i8
  br label %if.end141

if.end141:                                        ; preds = %if.then138, %if.end134
  %bout.3 = phi i8 [ %conv140, %if.then138 ], [ %bout.2, %if.end134 ]
  %shr = lshr i64 %mask.0, 1
  br label %for.inc142

for.inc142:                                       ; preds = %if.end141
  %inc143 = add i64 %i.4, 1
  br label %for.cond112, !llvm.loop !14

for.end144:                                       ; preds = %for.cond112
  %incdec.ptr145 = getelementptr inbounds i8, ptr %dptr.1, i32 1
  br label %for.inc146

for.inc146:                                       ; preds = %for.end144
  %inc147 = add i64 %j.1, 1
  br label %for.cond102, !llvm.loop !15

for.end148:                                       ; preds = %for.cond102
  %sub149 = sub nsw i32 7, %bit.0
  %conv150 = sext i8 %bout.0 to i32
  %shl151 = shl i32 %conv150, %sub149
  %conv152 = trunc i32 %shl151 to i8
  %arrayidx153 = getelementptr inbounds i8, ptr %call, i64 %comp_len.0
  store i8 %conv152, ptr %arrayidx153, align 1
  %inc154 = add i64 %comp_len.0, 1
  %arraydecay155 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %arraydecay155, i8 0, i64 2048, i1 false)
  %arraydecay156 = getelementptr inbounds [256 x i8], ptr %outc, i64 0, i64 0
  br label %for.cond157

for.cond157:                                      ; preds = %for.inc194, %for.end148
  %j.2 = phi i64 [ 0, %for.end148 ], [ %inc195, %for.inc194 ]
  %optr.0 = phi ptr [ %arraydecay156, %for.end148 ], [ %incdec.ptr162, %for.inc194 ]
  %cmp158 = icmp ult i64 %j.2, 256
  br i1 %cmp158, label %for.body160, label %for.end196

for.body160:                                      ; preds = %for.cond157
  %conv161 = trunc i64 %j.2 to i8
  store i8 %conv161, ptr %optr.0, align 1
  %incdec.ptr162 = getelementptr inbounds i8, ptr %optr.0, i32 1
  %arrayidx163 = getelementptr inbounds [256 x i64], ptr %code, i64 0, i64 %j.2
  %21 = load i64, ptr %arrayidx163, align 8
  %arrayidx164 = getelementptr inbounds [256 x i8], ptr %clen, i64 0, i64 %j.2
  %22 = load i8, ptr %arrayidx164, align 1
  %conv165 = zext i8 %22 to i64
  %or166 = or i64 %21, %conv165
  %tobool167 = icmp ne i64 %or166, 0
  br i1 %tobool167, label %if.then168, label %if.end193

if.then168:                                       ; preds = %for.body160
  %23 = load i8, ptr %arrayidx164, align 1
  %conv170 = zext i8 %23 to i32
  %sub171 = sub nsw i32 %conv170, 1
  %shl172 = shl i32 1, %sub171
  %conv173 = sext i32 %shl172 to i64
  br label %for.cond174

for.cond174:                                      ; preds = %for.inc189, %if.then168
  %k.0 = phi i64 [ 0, %if.then168 ], [ %k.1, %for.inc189 ]
  %mask.1 = phi i64 [ %conv173, %if.then168 ], [ %shr188, %for.inc189 ]
  %i.5 = phi i64 [ 0, %if.then168 ], [ %inc190, %for.inc189 ]
  %24 = load i8, ptr %arrayidx164, align 1
  %conv176 = zext i8 %24 to i64
  %cmp177 = icmp ult i64 %i.5, %conv176
  br i1 %cmp177, label %for.body179, label %for.end191

for.body179:                                      ; preds = %for.cond174
  %mul180 = mul i64 %k.0, 2
  %add181 = add i64 %mul180, 1
  %25 = load i64, ptr %arrayidx163, align 8
  %and183 = and i64 %25, %mask.1
  %tobool184 = icmp ne i64 %and183, 0
  br i1 %tobool184, label %if.then185, label %if.end187

if.then185:                                       ; preds = %for.body179
  %inc186 = add i64 %add181, 1
  br label %if.end187

if.end187:                                        ; preds = %if.then185, %for.body179
  %k.1 = phi i64 [ %inc186, %if.then185 ], [ %add181, %for.body179 ]
  %shr188 = lshr i64 %mask.1, 1
  br label %for.inc189

for.inc189:                                       ; preds = %if.end187
  %inc190 = add i64 %i.5, 1
  br label %for.cond174, !llvm.loop !16

for.end191:                                       ; preds = %for.cond174
  %arrayidx192 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %j.2
  store i64 %k.0, ptr %arrayidx192, align 8
  br label %if.end193

if.end193:                                        ; preds = %for.end191, %for.body160
  br label %for.inc194

for.inc194:                                       ; preds = %if.end193
  %inc195 = add i64 %j.2, 1
  br label %for.cond157, !llvm.loop !17

for.end196:                                       ; preds = %for.cond157
  br label %for.cond197

for.cond197:                                      ; preds = %for.inc220, %for.end196
  %i.6 = phi i64 [ 1, %for.end196 ], [ %inc221, %for.inc220 ]
  %cmp198 = icmp ult i64 %i.6, 256
  br i1 %cmp198, label %for.body200, label %for.end222

for.body200:                                      ; preds = %for.cond197
  %arrayidx201 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %i.6
  %26 = load i64, ptr %arrayidx201, align 8
  %arrayidx202 = getelementptr inbounds [256 x i8], ptr %outc, i64 0, i64 %i.6
  %27 = load i8, ptr %arrayidx202, align 1
  br label %while.cond203

while.cond203:                                    ; preds = %while.body209, %for.body200
  %j.3 = phi i64 [ %i.6, %for.body200 ], [ %dec216, %while.body209 ]
  %tobool204 = icmp ne i64 %j.3, 0
  br i1 %tobool204, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond203
  %sub205 = sub i64 %j.3, 1
  %arrayidx206 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %sub205
  %28 = load i64, ptr %arrayidx206, align 8
  %cmp207 = icmp ugt i64 %28, %26
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond203
  %29 = phi i1 [ false, %while.cond203 ], [ %cmp207, %land.rhs ]
  br i1 %29, label %while.body209, label %while.end217

while.body209:                                    ; preds = %land.end
  %sub210 = sub i64 %j.3, 1
  %arrayidx211 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %sub210
  %30 = load i64, ptr %arrayidx211, align 8
  %arrayidx212 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %j.3
  store i64 %30, ptr %arrayidx212, align 8
  %arrayidx214 = getelementptr inbounds [256 x i8], ptr %outc, i64 0, i64 %sub210
  %31 = load i8, ptr %arrayidx214, align 1
  %arrayidx215 = getelementptr inbounds [256 x i8], ptr %outc, i64 0, i64 %j.3
  store i8 %31, ptr %arrayidx215, align 1
  %dec216 = add i64 %j.3, -1
  br label %while.cond203, !llvm.loop !18

while.end217:                                     ; preds = %land.end
  %arrayidx218 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %j.3
  store i64 %26, ptr %arrayidx218, align 8
  %arrayidx219 = getelementptr inbounds [256 x i8], ptr %outc, i64 0, i64 %j.3
  store i8 %27, ptr %arrayidx219, align 1
  br label %for.inc220

for.inc220:                                       ; preds = %while.end217
  %inc221 = add i64 %i.6, 1
  br label %for.cond197, !llvm.loop !19

for.end222:                                       ; preds = %for.cond197
  br label %for.cond223

for.cond223:                                      ; preds = %for.inc228, %for.end222
  %j.4 = phi i64 [ 0, %for.end222 ], [ %inc229, %for.inc228 ]
  %arrayidx224 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %j.4
  %32 = load i64, ptr %arrayidx224, align 8
  %cmp225 = icmp eq i64 %32, 0
  br i1 %cmp225, label %for.body227, label %for.end230

for.body227:                                      ; preds = %for.cond223
  br label %for.inc228

for.inc228:                                       ; preds = %for.body227
  %inc229 = add i64 %j.4, 1
  br label %for.cond223, !llvm.loop !20

for.end230:                                       ; preds = %for.cond223
  br label %while.cond231

while.cond231:                                    ; preds = %if.end264, %for.end230
  %dptr.2 = phi ptr [ %data, %for.end230 ], [ %dptr.3, %if.end264 ]
  %cptr.0 = phi ptr [ %call, %for.end230 ], [ %cptr.1, %if.end264 ]
  %k.2 = phi i64 [ 0, %for.end230 ], [ %k.4, %if.end264 ]
  %mask.2 = phi i64 [ 128, %for.end230 ], [ %mask.3, %if.end264 ]
  %n.3 = phi i64 [ 0, %for.end230 ], [ %n.4, %if.end264 ]
  %i.7 = phi i64 [ %j.4, %for.end230 ], [ %i.9, %if.end264 ]
  %cmp232 = icmp ult i64 %n.3, %data_len
  br i1 %cmp232, label %while.body234, label %while.end265

while.body234:                                    ; preds = %while.cond231
  %mul235 = mul i64 %k.2, 2
  %add236 = add i64 %mul235, 1
  %33 = load i8, ptr %cptr.0, align 1
  %conv237 = zext i8 %33 to i64
  %and238 = and i64 %conv237, %mask.2
  %tobool239 = icmp ne i64 %and238, 0
  br i1 %tobool239, label %if.then240, label %if.end242

if.then240:                                       ; preds = %while.body234
  %inc241 = add i64 %add236, 1
  br label %if.end242

if.end242:                                        ; preds = %if.then240, %while.body234
  %k.3 = phi i64 [ %inc241, %if.then240 ], [ %add236, %while.body234 ]
  br label %while.cond243

while.cond243:                                    ; preds = %while.body247, %if.end242
  %i.8 = phi i64 [ %i.7, %if.end242 ], [ %inc248, %while.body247 ]
  %arrayidx244 = getelementptr inbounds [256 x i64], ptr %heap2, i64 0, i64 %i.8
  %34 = load i64, ptr %arrayidx244, align 8
  %cmp245 = icmp ult i64 %34, %k.3
  br i1 %cmp245, label %while.body247, label %while.end249

while.body247:                                    ; preds = %while.cond243
  %inc248 = add i64 %i.8, 1
  br label %while.cond243, !llvm.loop !21

while.end249:                                     ; preds = %while.cond243
  %35 = load i64, ptr %arrayidx244, align 8
  %cmp251 = icmp eq i64 %k.3, %35
  br i1 %cmp251, label %if.then253, label %if.end257

if.then253:                                       ; preds = %while.end249
  %arrayidx254 = getelementptr inbounds [256 x i8], ptr %outc, i64 0, i64 %i.8
  %36 = load i8, ptr %arrayidx254, align 1
  store i8 %36, ptr %dptr.2, align 1
  %incdec.ptr255 = getelementptr inbounds i8, ptr %dptr.2, i32 1
  %inc256 = add i64 %n.3, 1
  br label %if.end257

if.end257:                                        ; preds = %if.then253, %while.end249
  %dptr.3 = phi ptr [ %incdec.ptr255, %if.then253 ], [ %dptr.2, %while.end249 ]
  %k.4 = phi i64 [ 0, %if.then253 ], [ %k.3, %while.end249 ]
  %n.4 = phi i64 [ %inc256, %if.then253 ], [ %n.3, %while.end249 ]
  %i.9 = phi i64 [ %j.4, %if.then253 ], [ %i.8, %while.end249 ]
  %cmp258 = icmp ugt i64 %mask.2, 1
  br i1 %cmp258, label %if.then260, label %if.else262

if.then260:                                       ; preds = %if.end257
  %shr261 = lshr i64 %mask.2, 1
  br label %if.end264

if.else262:                                       ; preds = %if.end257
  %incdec.ptr263 = getelementptr inbounds i8, ptr %cptr.0, i32 1
  br label %if.end264

if.end264:                                        ; preds = %if.else262, %if.then260
  %cptr.1 = phi ptr [ %cptr.0, %if.then260 ], [ %incdec.ptr263, %if.else262 ]
  %mask.3 = phi i64 [ %shr261, %if.then260 ], [ 128, %if.else262 ]
  br label %while.cond231, !llvm.loop !22

while.end265:                                     ; preds = %while.cond231
  call void @free(ptr noundef %call) #9
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal void @heap_adjust(ptr noundef %freq, ptr noundef %heap, i32 noundef %n, i32 noundef %k) #0 {
entry:
  %incdec.ptr = getelementptr inbounds i64, ptr %heap, i32 -1
  %idxprom = sext i32 %k to i64
  %arrayidx = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom
  %0 = load i64, ptr %arrayidx, align 8
  %conv = trunc i64 %0 to i32
  br label %while.cond

while.cond:                                       ; preds = %if.end21, %entry
  %k.addr.0 = phi i32 [ %k, %entry ], [ %j.0, %if.end21 ]
  %div = sdiv i32 %n, 2
  %cmp = icmp sle i32 %k.addr.0, %div
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %add = add nsw i32 %k.addr.0, %k.addr.0
  %cmp2 = icmp slt i32 %add, %n
  br i1 %cmp2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom4
  %1 = load i64, ptr %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds i64, ptr %freq, i64 %1
  %2 = load i64, ptr %arrayidx6, align 8
  %add7 = add nsw i32 %add, 1
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom8
  %3 = load i64, ptr %arrayidx9, align 8
  %arrayidx10 = getelementptr inbounds i64, ptr %freq, i64 %3
  %4 = load i64, ptr %arrayidx10, align 8
  %cmp11 = icmp ugt i64 %2, %4
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %j.0 = phi i32 [ %add7, %if.then ], [ %add, %land.lhs.true ], [ %add, %while.body ]
  %idxprom13 = sext i32 %conv to i64
  %arrayidx14 = getelementptr inbounds i64, ptr %freq, i64 %idxprom13
  %5 = load i64, ptr %arrayidx14, align 8
  %idxprom15 = sext i32 %j.0 to i64
  %arrayidx16 = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom15
  %6 = load i64, ptr %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds i64, ptr %freq, i64 %6
  %7 = load i64, ptr %arrayidx17, align 8
  %cmp18 = icmp ult i64 %5, %7
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end
  br label %while.end

if.end21:                                         ; preds = %if.end
  %idxprom22 = sext i32 %j.0 to i64
  %arrayidx23 = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom22
  %8 = load i64, ptr %arrayidx23, align 8
  %idxprom24 = sext i32 %k.addr.0 to i64
  %arrayidx25 = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom24
  store i64 %8, ptr %arrayidx25, align 8
  br label %while.cond, !llvm.loop !23

while.end:                                        ; preds = %if.then20, %while.cond
  %conv26 = sext i32 %conv to i64
  %idxprom27 = sext i32 %k.addr.0 to i64
  %arrayidx28 = getelementptr inbounds i64, ptr %incdec.ptr, i64 %idxprom27
  store i64 %conv26, ptr %arrayidx28, align 8
  ret void
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
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
  %call = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.4) #10
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then2

if.then2:                                         ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !24

for.end:                                          ; preds = %if.then2, %for.cond
  %ga_testing.0 = phi i8 [ 1, %if.then2 ], [ 0, %for.cond ]
  br label %if.end3

if.end3:                                          ; preds = %for.end, %entry
  %ga_testing.1 = phi i8 [ %ga_testing.0, %for.end ], [ 0, %entry ]
  %call4 = call ptr @generate_test_data(i64 noundef 10000000)
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc8, %if.end3
  %i.1 = phi i32 [ 0, %if.end3 ], [ %inc9, %for.inc8 ]
  %cmp6 = icmp slt i32 %i.1, 30
  br i1 %cmp6, label %for.body7, label %for.end10

for.body7:                                        ; preds = %for.cond5
  call void @compdecomp(ptr noundef %call4, i64 noundef 10000000)
  br label %for.inc8

for.inc8:                                         ; preds = %for.body7
  %inc9 = add nsw i32 %i.1, 1
  br label %for.cond5, !llvm.loop !25

for.end10:                                        ; preds = %for.cond5
  call void @free(ptr noundef %call4) #9
  %tobool11 = trunc i8 %ga_testing.1 to i1
  br i1 %tobool11, label %if.then12, label %if.else

if.then12:                                        ; preds = %for.end10
  %1 = load ptr, ptr @stdout, align 8
  %call13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.5, double noundef 0.000000e+00)
  br label %if.end15

if.else:                                          ; preds = %for.end10
  %2 = load ptr, ptr @stdout, align 8
  %call14 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.6, double noundef 0.000000e+00)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then12
  %3 = load ptr, ptr @stdout, align 8
  %call16 = call i32 @fflush(ptr noundef %3)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #6

declare i32 @fflush(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define internal i64 @random4() #0 {
entry:
  %0 = load i64, ptr @seed, align 8
  %xor = xor i64 %0, 123459876
  store i64 %xor, ptr @seed, align 8
  %1 = load i64, ptr @seed, align 8
  %div = sdiv i64 %1, 127773
  %2 = load i64, ptr @seed, align 8
  %mul = mul nsw i64 %div, 127773
  %sub = sub nsw i64 %2, %mul
  %mul1 = mul nsw i64 16807, %sub
  %mul2 = mul nsw i64 2836, %div
  %sub3 = sub nsw i64 %mul1, %mul2
  store i64 %sub3, ptr @seed, align 8
  %3 = load i64, ptr @seed, align 8
  %cmp = icmp slt i64 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64, ptr @seed, align 8
  %add = add nsw i64 %4, 2147483647
  store i64 %add, ptr @seed, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i64, ptr @seed, align 8
  %rem = srem i64 %5, 32
  %6 = load i64, ptr @seed, align 8
  %xor4 = xor i64 %6, 123459876
  store i64 %xor4, ptr @seed, align 8
  ret i64 %rem
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
