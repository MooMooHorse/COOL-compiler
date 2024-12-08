@v1 = global [3 x i32] [i32 0, i32 1, i32 2], align 16

define void @main() {
entry:
    ; Initialize variables
    %i = alloca i32, align 4
    %j = alloca i32, align 4
    %k = alloca i32, align 4
    store i32 0, i32* %i, align 4
    store i32 0, i32* %j, align 4
    store i32 0, i32* %k, align 4

    ; Outer loop: i < v1.size()
    br label %for.cond1

for.cond1:                                           ; preds = %entry, %for.body2
    %i_val = load i32, i32* %i, align 4
    %cmp1 = icmp slt i32 %i_val, 3
    br i1 %cmp1, label %for.body1, label %for.end1

for.body1:                                           ; preds = %for.cond1
    ; Inner loop: j < v1.size()
    store i32 0, i32* %j, align 4
    br label %for.cond2

for.cond2:                                           ; preds = %for.body1, %for.body2
    %j_val = load i32, i32* %j, align 4
    %cmp2 = icmp slt i32 %j_val, 3
    br i1 %cmp2, label %for.body2, label %for.end2

for.body2:                                           ; preds = %for.cond2
    ; v1[i] = v1[i] + v1[j]
    %i_idx = load i32, i32* %i, align 4
    %j_idx = load i32, i32* %j, align 4
    %array_idx1 = getelementptr inbounds [3 x i32], [3 x i32]* @v1, i32 0, i32 %i_idx
    %array_idx2 = getelementptr inbounds [3 x i32], [3 x i32]* @v1, i32 0, i32 %j_idx
    %val_i = load i32, i32* %array_idx1, align 4
    %val_j = load i32, i32* %array_idx2, align 4
    %sum = add i32 %val_i, %val_j
    store i32 %sum, i32* %array_idx1, align 4
    ; Increment j
    %next_j = add i32 %j_val, 1
    store i32 %next_j, i32* %j, align 4
    br label %for.cond2

for.end2:                                           ; preds = %for.cond2
    ; Increment i
    %next_i = add i32 %i_val, 1
    store i32 %next_i, i32* %i, align 4
    br label %for.cond1

for.end1:                                           ; preds = %for.cond1
    ; Final loop: v1[k] = v1[k] * 2
    store i32 0, i32* %k, align 4
    br label %for.cond3

for.cond3:                                           ; preds = %for.end1, %for.body3
    %k_val = load i32, i32* %k, align 4
    %cmp3 = icmp slt i32 %k_val, 3
    br i1 %cmp3, label %for.body3, label %for.end3

for.body3:                                           ; preds = %for.cond3
    %k_idx = load i32, i32* %k, align 4
    %array_idx3 = getelementptr inbounds [3 x i32], [3 x i32]* @v1, i32 0, i32 %k_idx
    %val_k = load i32, i32* %array_idx3, align 4
    %mul = mul i32 %val_k, 2
    store i32 %mul, i32* %array_idx3, align 4
    ; Increment k
    %next_k = add i32 %k_val, 1
    store i32 %next_k, i32* %k, align 4
    br label %for.cond3

for.end3:                                           ; preds = %for.cond3
    ret void
}