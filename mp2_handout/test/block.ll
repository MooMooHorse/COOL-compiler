declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main.main() {

entry:
	%vtpm.0 = xor i1 true, true
	%vtpm.1 = sub i32 0, 1
	%vtpm.2 = icmp sle i32 3, 2
	%vtpm.3 = icmp slt i32 3, 2
	%vtpm.4 = sub i32 3, 2
	%vtpm.5 = icmp eq i32 3, 2
	%vtpm.6 = mul i32 4, 2
	ret i32 %vtpm.6

abort:
	call void @abort(  )
	unreachable
}

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.7 = call i32 @Main.main(  )
	%tpm = getelementptr [25 x i8], [25 x i8]* @main.printout.str, i32 0, i32 0
	%vtpm.8 = call i32(i8*, ... ) @printf( i8* %tpm, i32 %vtpm.7 )
	ret i32 0
}

