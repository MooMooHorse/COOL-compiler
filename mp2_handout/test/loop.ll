declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	store i32 8, i32* %tmp.0
	br label %loop0

loop0:
	%vtpm.0 = load i32, i32* %tmp.0
	%vtpm.1 = icmp slt i32 %vtpm.0, 10
	br i1 %vtpm.1, label %loop.body1, label %loop.end2

loop.body1:
	%vtpm.2 = load i32, i32* %tmp.0
	%vtpm.3 = add i32 %vtpm.2, 1
	store i32 %vtpm.3, i32* %tmp.0
	br label %loop0

loop.end2:
	%vtpm.4 = load i32, i32* %tmp.0
	ret i32 %vtpm.4

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.5 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.6 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.5 )
	ret i32 0
}

