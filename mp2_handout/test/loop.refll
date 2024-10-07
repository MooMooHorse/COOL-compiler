declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	store i32 8, i32* %tmp.0
	br label %loop.0

loop.0:
	%tmp.1 = load i32, i32* %tmp.0
	%tmp.2 = icmp slt i32 %tmp.1, 10
	br i1 %tmp.2, label %true.0, label %false.0

true.0:
	%tmp.3 = load i32, i32* %tmp.0
	%tmp.4 = add i32 %tmp.3, 1
	store i32 %tmp.4, i32* %tmp.0
	br label %loop.0

false.0:
	%tmp.5 = load i32, i32* %tmp.0
	ret i32 %tmp.5

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.0 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.1 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.0 )
	ret i32 0
}

