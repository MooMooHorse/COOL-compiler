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
	store i32 3, i32* %tmp.0
	store i32 2, i32* %tmp.1
	store i32 2, i32* %tmp.2
	%vtpm.0 = load i32, i32* %tmp.2
	%vtpm.1 = load i32, i32* %tmp.1
	%vtpm.2 = add i32 %vtpm.0, %vtpm.1
	store i32 2, i32* %tmp.3
	%vtpm.3 = load i32, i32* %tmp.0
	%vtpm.4 = load i32, i32* %tmp.3
	%vtpm.5 = add i32 %vtpm.3, %vtpm.4
	ret i32 %vtpm.5

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.6 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.7 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.6 )
	ret i32 0
}

