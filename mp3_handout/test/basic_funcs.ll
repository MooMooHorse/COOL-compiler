declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
@str.Object = internal constant [7 x i8] c"Object\00"
%Object = type {
	%_Object_vtable*
}

%_Object_vtable = type {
	i32,
	i32,
	i8*,
	%Object* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@_Object_vtable_prototype = constant %_Object_vtable {
	i32 0,
	i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00"
%Int = type {
	%_Int_vtable*,
	i32
}

%_Int_vtable = type {
	i32,
	i32,
	i8*,
	%Int* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@_Int_vtable_prototype = constant %_Int_vtable {
	i32 1,
	i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Bool = internal constant [5 x i8] c"Bool\00"
%Bool = type {
	%_Bool_vtable*,
	i1
}

%_Bool_vtable = type {
	i32,
	i32,
	i8*,
	%Bool* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@_Bool_vtable_prototype = constant %_Bool_vtable {
	i32 2,
	i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.String = internal constant [7 x i8] c"String\00"
%String = type {
	%_String_vtable*,
	i8*
}

%_String_vtable = type {
	i32,
	i32,
	i8*,
	%String* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *,
	i32 (%String*) *,
	%String* (%String*,%String*) *,
	%String* (%String*,i32,i32) *
}

@_String_vtable_prototype = constant %_String_vtable {
	i32 3,
	i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00"
%IO = type {
	%_IO_vtable*
}

%_IO_vtable = type {
	i32,
	i32,
	i8*,
	%IO* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *
}

@_IO_vtable_prototype = constant %_IO_vtable {
	i32 4,
	i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%_Main_vtable*
}

%_Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *,
	%Object* (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 5,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int,
	%Object* (%Main*) * @Main_main
}

@str.1 = internal constant [7 x i8] c"Frugel\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0)
}

@str.0 = internal constant [15 x i8] c"basic_funcs.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%vtpm.0 = call %Main* @Main_new(  )
	%vtpm.1 = call %Object*(%Main* ) @Main_main( %Main* %vtpm.0 )
	ret i32 0
}

define %Object* @Main_abort(%Main* %self) {
	%vtpm.2 = alloca %Main*
	store %Main* %self, %Main** %vtpm.2
	%vtpm.3 = bitcast i8* null to %Object*
	ret %Object* %vtpm.3

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_type_name(%Main* %self) {
	%vtpm.5 = alloca %Main*
	store %Main* %self, %Main** %vtpm.5
	%vtpm.6 = bitcast i8* null to %String*
	ret %String* %vtpm.6

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_copy(%Main* %self) {
	%vtpm.8 = alloca %Main*
	store %Main* %self, %Main** %vtpm.8
	%vtpm.9 = bitcast i8* null to %Main*
	ret %Main* %vtpm.9

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_out_string(%Main* %self, %String* %arg) {
	%vtpm.11 = alloca %Main*
	store %Main* %self, %Main** %vtpm.11
	%vtpm.12 = alloca %String*
	store %String* %arg, %String** %vtpm.12
	%vtpm.13 = bitcast i8* null to %Main*
	ret %Main* %vtpm.13

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_out_int(%Main* %self, i32 %arg) {
	%vtpm.15 = alloca %Main*
	store %Main* %self, %Main** %vtpm.15
	%vtpm.16 = alloca i32
	store i32 %arg, i32* %vtpm.16
	%vtpm.17 = bitcast i8* null to %Main*
	ret %Main* %vtpm.17

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_in_string(%Main* %self) {
	%vtpm.19 = alloca %Main*
	store %Main* %self, %Main** %vtpm.19
	%vtpm.20 = bitcast i8* null to %String*
	ret %String* %vtpm.20

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_in_int(%Main* %self) {
	%vtpm.22 = alloca %Main*
	store %Main* %self, %Main** %vtpm.22
	ret i32 0

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_main(%Main* %self) {
	%vtpm.24 = alloca %Main*
	store %Main* %self, %Main** %vtpm.24
	%vtpm.25 = load %Main*, %Main** %vtpm.24
	%vtpm.26 = icmp eq %Main* %vtpm.25, null
	br i1 %vtpm.26, label %abort, label %ok.0

ok.0:
	%vtpm.27 = getelementptr %Main, %Main* %vtpm.25, i32 0, i32 0
	%vtpm.28 = load %_Main_vtable*, %_Main_vtable** %vtpm.27
	%vtpm.29 = load %Main*, %Main** %vtpm.24
	%vtpm.30 = icmp eq %Main* %vtpm.29, null
	br i1 %vtpm.30, label %abort, label %ok.1

ok.1:
	%vtpm.31 = getelementptr %Main, %Main* %vtpm.29, i32 0, i32 0
	%vtpm.32 = load %_Main_vtable*, %_Main_vtable** %vtpm.31
	%vtpm.33 = bitcast %Main* %vtpm.29 to %Object*
	%vtpm.34 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.32, i32 0, i32 5
	%tmp.0 = load %String* (%Object*) *, %String* (%Object*) ** %vtpm.34
	%vtpm.35 = call %String*(%Object* ) %tmp.0( %Object* %vtpm.33 )
	%vtpm.36 = bitcast %Main* %vtpm.25 to %IO*
	%vtpm.37 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.28, i32 0, i32 7
	%tmp.1 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.37
	%vtpm.38 = call %IO*(%IO*, %String* ) %tmp.1( %IO* %vtpm.36, %String* %vtpm.35 )
	%vtpm.39 = load %Main*, %Main** %vtpm.24
	%vtpm.40 = icmp eq %Main* %vtpm.39, null
	br i1 %vtpm.40, label %abort, label %ok.2

ok.2:
	%vtpm.41 = getelementptr %Main, %Main* %vtpm.39, i32 0, i32 0
	%vtpm.42 = load %_Main_vtable*, %_Main_vtable** %vtpm.41
	%vtpm.43 = bitcast %Main* %vtpm.39 to %IO*
	%vtpm.44 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.42, i32 0, i32 8
	%tmp.2 = load %IO* (%IO*,i32) *, %IO* (%IO*,i32) ** %vtpm.44
	%vtpm.45 = call %IO*(%IO*, i32 ) %tmp.2( %IO* %vtpm.43, i32 879 )
	%vtpm.46 = load %Main*, %Main** %vtpm.24
	%vtpm.47 = icmp eq %Main* %vtpm.46, null
	br i1 %vtpm.47, label %abort, label %ok.3

ok.3:
	%vtpm.48 = getelementptr %Main, %Main* %vtpm.46, i32 0, i32 0
	%vtpm.49 = load %_Main_vtable*, %_Main_vtable** %vtpm.48
	%vtpm.50 = load %Main*, %Main** %vtpm.24
	%vtpm.51 = icmp eq %Main* %vtpm.50, null
	br i1 %vtpm.51, label %abort, label %ok.4

ok.4:
	%vtpm.52 = getelementptr %Main, %Main* %vtpm.50, i32 0, i32 0
	%vtpm.53 = load %_Main_vtable*, %_Main_vtable** %vtpm.52
	%vtpm.54 = bitcast %Main* %vtpm.50 to %Object*
	%vtpm.55 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.53, i32 0, i32 5
	%tmp.3 = load %String* (%Object*) *, %String* (%Object*) ** %vtpm.55
	%vtpm.56 = call %String*(%Object* ) %tmp.3( %Object* %vtpm.54 )
	%vtpm.57 = icmp eq %String* %vtpm.56, null
	br i1 %vtpm.57, label %abort, label %ok.5

ok.5:
	%vtpm.58 = getelementptr %String, %String* %vtpm.56, i32 0, i32 0
	%vtpm.59 = load %_String_vtable*, %_String_vtable** %vtpm.58
	%vtpm.60 = getelementptr %_String_vtable, %_String_vtable* %vtpm.59, i32 0, i32 8
	%tmp.4 = load %String* (%String*,%String*) *, %String* (%String*,%String*) ** %vtpm.60
	%vtpm.61 = call %String*(%String*, %String* ) %tmp.4( %String* %vtpm.56, %String* @String.1 )
	%vtpm.62 = bitcast %Main* %vtpm.46 to %IO*
	%vtpm.63 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.49, i32 0, i32 7
	%tmp.5 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.63
	%vtpm.64 = call %IO*(%IO*, %String* ) %tmp.5( %IO* %vtpm.62, %String* %vtpm.61 )
	%vtpm.65 = load %Main*, %Main** %vtpm.24
	%vtpm.66 = icmp eq %Main* %vtpm.65, null
	br i1 %vtpm.66, label %abort, label %ok.6

ok.6:
	%vtpm.67 = getelementptr %Main, %Main* %vtpm.65, i32 0, i32 0
	%vtpm.68 = load %_Main_vtable*, %_Main_vtable** %vtpm.67
	%vtpm.69 = load %Main*, %Main** %vtpm.24
	%vtpm.70 = icmp eq %Main* %vtpm.69, null
	br i1 %vtpm.70, label %abort, label %ok.7

ok.7:
	%vtpm.71 = getelementptr %Main, %Main* %vtpm.69, i32 0, i32 0
	%vtpm.72 = load %_Main_vtable*, %_Main_vtable** %vtpm.71
	%vtpm.73 = bitcast %Main* %vtpm.69 to %Object*
	%vtpm.74 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.72, i32 0, i32 5
	%tmp.6 = load %String* (%Object*) *, %String* (%Object*) ** %vtpm.74
	%vtpm.75 = call %String*(%Object* ) %tmp.6( %Object* %vtpm.73 )
	%vtpm.76 = icmp eq %String* %vtpm.75, null
	br i1 %vtpm.76, label %abort, label %ok.8

ok.8:
	%vtpm.77 = getelementptr %String, %String* %vtpm.75, i32 0, i32 0
	%vtpm.78 = load %_String_vtable*, %_String_vtable** %vtpm.77
	%vtpm.79 = getelementptr %_String_vtable, %_String_vtable* %vtpm.78, i32 0, i32 7
	%tmp.7 = load i32 (%String*) *, i32 (%String*) ** %vtpm.79
	%vtpm.80 = call i32(%String* ) %tmp.7( %String* %vtpm.75 )
	%vtpm.81 = bitcast %Main* %vtpm.65 to %IO*
	%vtpm.82 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.68, i32 0, i32 8
	%tmp.8 = load %IO* (%IO*,i32) *, %IO* (%IO*,i32) ** %vtpm.82
	%vtpm.83 = call %IO*(%IO*, i32 ) %tmp.8( %IO* %vtpm.81, i32 %vtpm.80 )
	%vtpm.84 = load %Main*, %Main** %vtpm.24
	%vtpm.85 = icmp eq %Main* %vtpm.84, null
	br i1 %vtpm.85, label %abort, label %ok.9

ok.9:
	%vtpm.86 = getelementptr %Main, %Main* %vtpm.84, i32 0, i32 0
	%vtpm.87 = load %_Main_vtable*, %_Main_vtable** %vtpm.86
	%vtpm.88 = load %Main*, %Main** %vtpm.24
	%vtpm.89 = icmp eq %Main* %vtpm.88, null
	br i1 %vtpm.89, label %abort, label %ok.10

ok.10:
	%vtpm.90 = getelementptr %Main, %Main* %vtpm.88, i32 0, i32 0
	%vtpm.91 = load %_Main_vtable*, %_Main_vtable** %vtpm.90
	%vtpm.92 = bitcast %Main* %vtpm.88 to %Object*
	%vtpm.93 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.91, i32 0, i32 5
	%tmp.9 = load %String* (%Object*) *, %String* (%Object*) ** %vtpm.93
	%vtpm.94 = call %String*(%Object* ) %tmp.9( %Object* %vtpm.92 )
	%vtpm.95 = icmp eq %String* %vtpm.94, null
	br i1 %vtpm.95, label %abort, label %ok.11

ok.11:
	%vtpm.96 = getelementptr %String, %String* %vtpm.94, i32 0, i32 0
	%vtpm.97 = load %_String_vtable*, %_String_vtable** %vtpm.96
	%vtpm.98 = getelementptr %_String_vtable, %_String_vtable* %vtpm.97, i32 0, i32 9
	%tmp.10 = load %String* (%String*,i32,i32) *, %String* (%String*,i32,i32) ** %vtpm.98
	%vtpm.99 = call %String*(%String*, i32, i32 ) %tmp.10( %String* %vtpm.94, i32 2, i32 2 )
	%vtpm.100 = bitcast %Main* %vtpm.84 to %IO*
	%vtpm.101 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.87, i32 0, i32 7
	%tmp.11 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.101
	%vtpm.102 = call %IO*(%IO*, %String* ) %tmp.11( %IO* %vtpm.100, %String* %vtpm.99 )
	%vtpm.103 = load %Main*, %Main** %vtpm.24
	%vtpm.104 = bitcast %Main* %vtpm.103 to %Object*
	ret %Object* %vtpm.104

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.106 = alloca %Main*
	%vtpm.107 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.108 = load i32, i32* %vtpm.107
	%vtpm.109 = call i8* @malloc(i32 %vtpm.108)
	%vtpm.110 = bitcast i8* %vtpm.109 to %Main*
	%vtpm.111 = icmp eq %Main* %vtpm.110, null
	br i1 %vtpm.111, label %abort, label %ok.12

ok.12:
	%vtpm.112 = getelementptr %Main, %Main* %vtpm.110, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.112
	store %Main* %vtpm.110, %Main** %vtpm.106
	ret %Main* %vtpm.110

abort:
	call void @abort(  )
	unreachable
}

