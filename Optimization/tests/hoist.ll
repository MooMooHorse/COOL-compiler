define i32 @main() {
entry:
    ; Allocate space for variables
    %x = alloca i32
    %a = alloca i32
    %i = alloca i32

    ; Initialize 'a' to 5
    store i32 5, i32* %a

    ; Initialize 'i' to 0
    store i32 0, i32* %i

    ; Start of the loop
    br label %loop

loop:
    ; Load the current value of 'i'
    %tmp_i = load i32, i32* %i
    ; Check if 'i' is less than 10
    %cmp = icmp slt i32 %tmp_i, 10
    br i1 %cmp, label %loop_body, label %after_loop

loop_body:
    ; Compute 'x = a * 2'
    %tmp_a = load i32, i32* %a
    %mul = mul i32 %tmp_a, 2
    store i32 %mul, i32* %x

    ; Increment 'i' by 1
    %tmp_i2 = load i32, i32* %i
    %inc = add i32 %tmp_i2, 1
    store i32 %inc, i32* %i

    ; Jump back to the loop condition
    br label %loop

after_loop:
    ; Load the final value of 'x'
    %tmp_x = load i32, i32* %x
    ; Check if 'x' equals 10
    %cmp2 = icmp eq i32 %tmp_x, 10
    br i1 %cmp2, label %return_one, label %return_zero

return_one:
    ; Return 1 if 'x' equals 10
    ret i32 1

return_zero:
    ; Return 0 otherwise
    ret i32 0
}
