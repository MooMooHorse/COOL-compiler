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

@str.A = internal constant [2 x i8] c"A\00"
%A = type {
	%_A_vtable*,
	%String*
}

%_A_vtable = type {
	i32,
	i32,
	i8*,
	%A* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *,
	%String* (%A*) *
}

@_A_vtable_prototype = constant %_A_vtable {
	i32 6,
	i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32),
	i8* getelementptr ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0),
	%A* () * @A_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	%String* (%A*) * @A_getGreetings
}

@str.1 = internal constant [8 x i8] c"Hello!\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0)
}

@str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0)
}

@str.0 = internal constant [11 x i8] c"copy_o1.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([11 x i8], [11 x i8]* @str.0, i32 0, i32 0)
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
	%tmp.0 = alloca %A*
	%tmp.1 = alloca %A*
	%vtpm.25 = call %A* @A_new(  )
	store %A* %vtpm.25, %A** %tmp.0
	%vtpm.26 = bitcast i8* null to %A*
	store %A* %vtpm.26, %A** %tmp.1
	%vtpm.27 = load %A*, %A** %tmp.0
	%vtpm.28 = icmp eq %A* %vtpm.27, null
	br i1 %vtpm.28, label %abort, label %ok.0

ok.0:
	%vtpm.29 = getelementptr %A, %A* %vtpm.27, i32 0, i32 0
	%vtpm.30 = load %_A_vtable*, %_A_vtable** %vtpm.29
	%vtpm.31 = bitcast %A* %vtpm.27 to %Object*
	%vtpm.32 = getelementptr %_A_vtable, %_A_vtable* %vtpm.30, i32 0, i32 6
	%tmp.2 = load %Object* (%Object*) *, %Object* (%Object*) ** %vtpm.32
	%vtpm.33 = call %Object*(%Object* ) %tmp.2( %Object* %vtpm.31 )
	%vtpm.34 = bitcast %Object* %vtpm.33 to %A*
	store %A* %vtpm.34, %A** %tmp.1
	%vtpm.35 = load %Main*, %Main** %vtpm.24
	%vtpm.36 = icmp eq %Main* %vtpm.35, null
	br i1 %vtpm.36, label %abort, label %ok.1

ok.1:
	%vtpm.37 = getelementptr %Main, %Main* %vtpm.35, i32 0, i32 0
	%vtpm.38 = load %_Main_vtable*, %_Main_vtable** %vtpm.37
	%vtpm.39 = load %A*, %A** %tmp.1
	%vtpm.40 = icmp eq %A* %vtpm.39, null
	br i1 %vtpm.40, label %abort, label %ok.2

ok.2:
	%vtpm.41 = getelementptr %A, %A* %vtpm.39, i32 0, i32 0
	%vtpm.42 = load %_A_vtable*, %_A_vtable** %vtpm.41
	%vtpm.43 = getelementptr %_A_vtable, %_A_vtable* %vtpm.42, i32 0, i32 7
	%tmp.3 = load %String* (%A*) *, %String* (%A*) ** %vtpm.43
	%vtpm.44 = call %String*(%A* ) %tmp.3( %A* %vtpm.39 )
	%vtpm.45 = bitcast %Main* %vtpm.35 to %IO*
	%vtpm.46 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38, i32 0, i32 7
	%tmp.4 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.46
	%vtpm.47 = call %IO*(%IO*, %String* ) %tmp.4( %IO* %vtpm.45, %String* %vtpm.44 )
	%vtpm.48 = bitcast %IO* %vtpm.47 to %Object*
	ret %Object* %vtpm.48

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.50 = alloca %Main*
	%vtpm.51 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.52 = load i32, i32* %vtpm.51
	%vtpm.53 = call i8* @malloc(i32 %vtpm.52)
	%vtpm.54 = bitcast i8* %vtpm.53 to %Main*
	%vtpm.55 = icmp eq %Main* %vtpm.54, null
	br i1 %vtpm.55, label %abort, label %ok.3

ok.3:
	%vtpm.56 = getelementptr %Main, %Main* %vtpm.54, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.56
	store %Main* %vtpm.54, %Main** %vtpm.50
	ret %Main* %vtpm.54

abort:
	call void @abort(  )
	unreachable
}

define %Object* @A_abort(%A* %self) {
	%vtpm.58 = alloca %A*
	store %A* %self, %A** %vtpm.58
	%vtpm.59 = bitcast i8* null to %Object*
	ret %Object* %vtpm.59

abort:
	call void @abort(  )
	unreachable
}

define %String* @A_type_name(%A* %self) {
	%vtpm.61 = alloca %A*
	store %A* %self, %A** %vtpm.61
	%vtpm.62 = bitcast i8* null to %String*
	ret %String* %vtpm.62

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_copy(%A* %self) {
	%vtpm.64 = alloca %A*
	store %A* %self, %A** %vtpm.64
	%vtpm.65 = bitcast i8* null to %A*
	ret %A* %vtpm.65

abort:
	call void @abort(  )
	unreachable
}

define %String* @A_getGreetings(%A* %self) {
	%vtpm.67 = alloca %A*
	store %A* %self, %A** %vtpm.67
	%vtpm.68 = load %A*, %A** %vtpm.67
	%vtpm.69 = getelementptr %A, %A* %vtpm.68, i32 0, i32 1
	%vtpm.70 = load %String*, %String** %vtpm.69
	ret %String* %vtpm.70

abort:
	call void @abort(  )
	unreachable
}

define %A* @A_new() {

entry:
	%vtpm.72 = alloca %A*
	%vtpm.73 = getelementptr %_A_vtable, %_A_vtable* @_A_vtable_prototype, i32 0, i32 1
	%vtpm.74 = load i32, i32* %vtpm.73
	%vtpm.75 = call i8* @malloc(i32 %vtpm.74)
	%vtpm.76 = bitcast i8* %vtpm.75 to %A*
	%vtpm.77 = icmp eq %A* %vtpm.76, null
	br i1 %vtpm.77, label %abort, label %ok.0

ok.0:
	%vtpm.78 = getelementptr %A, %A* %vtpm.76, i32 0, i32 0
	store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.78
	store %A* %vtpm.76, %A** %vtpm.72
	%vtpm.79 = getelementptr %A, %A* %vtpm.76, i32 0, i32 1
	store %String* @String.1, %String** %vtpm.79
	ret %A* %vtpm.76

abort:
	call void @abort(  )
	unreachable
}

