declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%tmp.0 = alloca i32
	%tmp.1 = alloca i32
	store i32 0, i32* %tmp.0
	%vtpm.0 = mul i32 3, 3
	%vtpm.1 = add i32 %vtpm.0, 1
	store i32 %vtpm.1, i32* %tmp.0
	store i32 0, i32* %tmp.1
	%vtpm.2 = load i32, i32* %tmp.0
	%vtpm.3 = load i32, i32* %tmp.0
	%vtpm.4 = mul i32 %vtpm.2, %vtpm.3
	%vtpm.5 = load i32, i32* %tmp.0
	%vtpm.6 = add i32 %vtpm.4, %vtpm.5
	store i32 %vtpm.6, i32* %tmp.1
	%vtpm.7 = load i32, i32* %tmp.1
	%vtpm.8 = load i32, i32* %tmp.0
	%vtpm.9 = sdiv i32 %vtpm.7, %vtpm.8
	ret i32 %vtpm.9

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.10 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.11 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.10 )
	ret i32 0
}
