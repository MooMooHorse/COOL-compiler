declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i32
	%tmp.2 = alloca i32
	%tmp.3 = alloca i32
	store i32 1, i32* %tmp.0
	store i32 999, i32* %tmp.1
	store i32 1, i32* %tmp.2
	store i32 1, i32* %tmp.3
	br label %loop0

loop0:
	%vtpm.0 = load i32, i32* %tmp.2
	%vtpm.1 = icmp sle i32 %vtpm.0, 10
	br i1 %vtpm.1, label %loop.body1, label %loop.end2

loop.body1:
	%vtpm.2 = load i32, i32* %tmp.1
	%vtpm.3 = add i32 %vtpm.2, 1
	store i32 %vtpm.3, i32* %tmp.1
	%vtpm.4 = load i32, i32* %tmp.2
	%vtpm.5 = add i32 %vtpm.4, 1
	store i32 %vtpm.5, i32* %tmp.2
	br label %loop0

loop.end2:
	%vtpm.6 = load i32, i32* %tmp.1
	%vtpm.7 = sub i32 0, %vtpm.6
	ret i32 %vtpm.7

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.8 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.9 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.8 )
	ret i32 0
}

