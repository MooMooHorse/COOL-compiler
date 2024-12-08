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
	%_Main_vtable*,
	%Object*
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

@str.9 = internal constant [15 x i8] c"\22abc\22 = \22bbc\22\0A\00"
@String.9 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @str.9, i32 0, i32 0)
}

@str.8 = internal constant [4 x i8] c"bbc\00"
@String.8 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @str.8, i32 0, i32 0)
}

@str.10 = internal constant [16 x i8] c"\22abc\22 != \22bbc\22\0A\00"
@String.10 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([16 x i8], [16 x i8]* @str.10, i32 0, i32 0)
}

@str.7 = internal constant [4 x i8] c"abc\00"
@String.7 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([4 x i8], [4 x i8]* @str.7, i32 0, i32 0)
}

@str.6 = internal constant [15 x i8] c"true != false\0A\00"
@String.6 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([15 x i8], [15 x i8]* @str.6, i32 0, i32 0)
}

@str.5 = internal constant [14 x i8] c"true = false\0A\00"
@String.5 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.5, i32 0, i32 0)
}

@str.4 = internal constant [8 x i8] c"1 != 0\0A\00"
@String.4 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.4, i32 0, i32 0)
}

@str.3 = internal constant [7 x i8] c"1 = 0\0A\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([7 x i8], [7 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [13 x i8] c"self != obj\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [12 x i8] c"self = obj\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([12 x i8], [12 x i8]* @str.1, i32 0, i32 0)
}

@str.11 = internal constant [14 x i8] c"<basic class>\00"
@String.11 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.11, i32 0, i32 0)
}

@str.0 = internal constant [11 x i8] c"checkeq.cl\00"
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
	%vtpm.25 = load %Main*, %Main** %vtpm.24
	%vtpm.26 = load %Main*, %Main** %vtpm.24
	%vtpm.27 = getelementptr %Main, %Main* %vtpm.26, i32 0, i32 1
	%vtpm.28 = load %Object*, %Object** %vtpm.27
	%vtpm.29 = bitcast %Main* %vtpm.25 to %Object*
	%vtpm.30 = icmp eq %Object* %vtpm.29, %vtpm.28
	%vtpm.31 = alloca %Object*
	br i1 %vtpm.30, label %then0, label %else1

else1:
	%vtpm.32 = load %Main*, %Main** %vtpm.24
	%vtpm.33 = icmp eq %Main* %vtpm.32, null
	br i1 %vtpm.33, label %abort, label %ok.0

ok.0:
	%vtpm.34 = getelementptr %Main, %Main* %vtpm.32, i32 0, i32 0
	%vtpm.35 = load %_Main_vtable*, %_Main_vtable** %vtpm.34
	%vtpm.36 = bitcast %Main* %vtpm.32 to %IO*
	%vtpm.37 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.35, i32 0, i32 7
	%tmp.0 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.37
	%vtpm.38 = call %IO*(%IO*, %String* ) %tmp.0( %IO* %vtpm.36, %String* @String.2 )
	%vtpm.39 = bitcast %IO* %vtpm.38 to %Object*
	store %Object* %vtpm.39, %Object** %vtpm.31
	br label %ifcont2

then0:
	%vtpm.40 = load %Main*, %Main** %vtpm.24
	%vtpm.41 = icmp eq %Main* %vtpm.40, null
	br i1 %vtpm.41, label %abort, label %ok.1

ok.1:
	%vtpm.42 = getelementptr %Main, %Main* %vtpm.40, i32 0, i32 0
	%vtpm.43 = load %_Main_vtable*, %_Main_vtable** %vtpm.42
	%vtpm.44 = bitcast %Main* %vtpm.40 to %IO*
	%vtpm.45 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.43, i32 0, i32 7
	%tmp.1 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.45
	%vtpm.46 = call %IO*(%IO*, %String* ) %tmp.1( %IO* %vtpm.44, %String* @String.1 )
	%vtpm.47 = bitcast %IO* %vtpm.46 to %Object*
	store %Object* %vtpm.47, %Object** %vtpm.31
	br label %ifcont2

ifcont2:
	%vtpm.48 = load %Object*, %Object** %vtpm.31
	%vtpm.49 = icmp eq i32 1, 0
	%vtpm.50 = alloca %Object*
	br i1 %vtpm.49, label %then3, label %else4

else4:
	%vtpm.51 = load %Main*, %Main** %vtpm.24
	%vtpm.52 = icmp eq %Main* %vtpm.51, null
	br i1 %vtpm.52, label %abort, label %ok.2

ok.2:
	%vtpm.53 = getelementptr %Main, %Main* %vtpm.51, i32 0, i32 0
	%vtpm.54 = load %_Main_vtable*, %_Main_vtable** %vtpm.53
	%vtpm.55 = bitcast %Main* %vtpm.51 to %IO*
	%vtpm.56 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.54, i32 0, i32 7
	%tmp.2 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.56
	%vtpm.57 = call %IO*(%IO*, %String* ) %tmp.2( %IO* %vtpm.55, %String* @String.4 )
	%vtpm.58 = bitcast %IO* %vtpm.57 to %Object*
	store %Object* %vtpm.58, %Object** %vtpm.50
	br label %ifcont5

then3:
	%vtpm.59 = load %Main*, %Main** %vtpm.24
	%vtpm.60 = icmp eq %Main* %vtpm.59, null
	br i1 %vtpm.60, label %abort, label %ok.3

ok.3:
	%vtpm.61 = getelementptr %Main, %Main* %vtpm.59, i32 0, i32 0
	%vtpm.62 = load %_Main_vtable*, %_Main_vtable** %vtpm.61
	%vtpm.63 = bitcast %Main* %vtpm.59 to %IO*
	%vtpm.64 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.62, i32 0, i32 7
	%tmp.3 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.64
	%vtpm.65 = call %IO*(%IO*, %String* ) %tmp.3( %IO* %vtpm.63, %String* @String.3 )
	%vtpm.66 = bitcast %IO* %vtpm.65 to %Object*
	store %Object* %vtpm.66, %Object** %vtpm.50
	br label %ifcont5

ifcont5:
	%vtpm.67 = load %Object*, %Object** %vtpm.50
	%vtpm.68 = icmp eq i1 true, false
	%vtpm.69 = alloca %Object*
	br i1 %vtpm.68, label %then6, label %else7

else7:
	%vtpm.70 = load %Main*, %Main** %vtpm.24
	%vtpm.71 = icmp eq %Main* %vtpm.70, null
	br i1 %vtpm.71, label %abort, label %ok.4

ok.4:
	%vtpm.72 = getelementptr %Main, %Main* %vtpm.70, i32 0, i32 0
	%vtpm.73 = load %_Main_vtable*, %_Main_vtable** %vtpm.72
	%vtpm.74 = bitcast %Main* %vtpm.70 to %IO*
	%vtpm.75 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.73, i32 0, i32 7
	%tmp.4 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.75
	%vtpm.76 = call %IO*(%IO*, %String* ) %tmp.4( %IO* %vtpm.74, %String* @String.6 )
	%vtpm.77 = bitcast %IO* %vtpm.76 to %Object*
	store %Object* %vtpm.77, %Object** %vtpm.69
	br label %ifcont8

then6:
	%vtpm.78 = load %Main*, %Main** %vtpm.24
	%vtpm.79 = icmp eq %Main* %vtpm.78, null
	br i1 %vtpm.79, label %abort, label %ok.5

ok.5:
	%vtpm.80 = getelementptr %Main, %Main* %vtpm.78, i32 0, i32 0
	%vtpm.81 = load %_Main_vtable*, %_Main_vtable** %vtpm.80
	%vtpm.82 = bitcast %Main* %vtpm.78 to %IO*
	%vtpm.83 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.81, i32 0, i32 7
	%tmp.5 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.83
	%vtpm.84 = call %IO*(%IO*, %String* ) %tmp.5( %IO* %vtpm.82, %String* @String.5 )
	%vtpm.85 = bitcast %IO* %vtpm.84 to %Object*
	store %Object* %vtpm.85, %Object** %vtpm.69
	br label %ifcont8

ifcont8:
	%vtpm.86 = load %Object*, %Object** %vtpm.69
	%vtpm.87 = icmp eq %String* @String.7, @String.8
	%vtpm.88 = alloca %Object*
	br i1 %vtpm.87, label %then9, label %else10

else10:
	%vtpm.89 = load %Main*, %Main** %vtpm.24
	%vtpm.90 = icmp eq %Main* %vtpm.89, null
	br i1 %vtpm.90, label %abort, label %ok.6

ok.6:
	%vtpm.91 = getelementptr %Main, %Main* %vtpm.89, i32 0, i32 0
	%vtpm.92 = load %_Main_vtable*, %_Main_vtable** %vtpm.91
	%vtpm.93 = bitcast %Main* %vtpm.89 to %IO*
	%vtpm.94 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.92, i32 0, i32 7
	%tmp.6 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.94
	%vtpm.95 = call %IO*(%IO*, %String* ) %tmp.6( %IO* %vtpm.93, %String* @String.10 )
	%vtpm.96 = bitcast %IO* %vtpm.95 to %Object*
	store %Object* %vtpm.96, %Object** %vtpm.88
	br label %ifcont11

then9:
	%vtpm.97 = load %Main*, %Main** %vtpm.24
	%vtpm.98 = icmp eq %Main* %vtpm.97, null
	br i1 %vtpm.98, label %abort, label %ok.7

ok.7:
	%vtpm.99 = getelementptr %Main, %Main* %vtpm.97, i32 0, i32 0
	%vtpm.100 = load %_Main_vtable*, %_Main_vtable** %vtpm.99
	%vtpm.101 = bitcast %Main* %vtpm.97 to %IO*
	%vtpm.102 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.100, i32 0, i32 7
	%tmp.7 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.102
	%vtpm.103 = call %IO*(%IO*, %String* ) %tmp.7( %IO* %vtpm.101, %String* @String.9 )
	%vtpm.104 = bitcast %IO* %vtpm.103 to %Object*
	store %Object* %vtpm.104, %Object** %vtpm.88
	br label %ifcont11

ifcont11:
	%vtpm.105 = load %Object*, %Object** %vtpm.88
	ret %Object* %vtpm.105

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.107 = alloca %Main*
	%vtpm.108 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.109 = load i32, i32* %vtpm.108
	%vtpm.110 = call i8* @malloc(i32 %vtpm.109)
	%vtpm.111 = bitcast i8* %vtpm.110 to %Main*
	%vtpm.112 = icmp eq %Main* %vtpm.111, null
	br i1 %vtpm.112, label %abort, label %ok.8

ok.8:
	%vtpm.113 = getelementptr %Main, %Main* %vtpm.111, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.113
	store %Main* %vtpm.111, %Main** %vtpm.107
	%vtpm.114 = getelementptr %Main, %Main* %vtpm.111, i32 0, i32 1
	%vtpm.115 = bitcast i8* null to %Object*
	store %Object* %vtpm.115, %Object** %vtpm.114
	ret %Main* %vtpm.111

abort:
	call void @abort(  )
	unreachable
}

