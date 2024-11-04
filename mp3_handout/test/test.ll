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

@str.Toy = internal constant [4 x i8] c"Toy\00"
%Toy = type {
	%_Toy_vtable*
}

%_Toy_vtable = type {
	i32,
	i32,
	i8*,
	%Toy* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *,
	i32 (%Toy*,i32,i32) *
}

@_Toy_vtable_prototype = constant %_Toy_vtable {
	i32 5,
	i32 ptrtoint (%Toy* getelementptr (%Toy, %Toy* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Toy, i32 0, i32 0),
	%Toy* () * @Toy_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	i32 (%Toy*,i32,i32) * @Toy_play
}

@str.Bear = internal constant [5 x i8] c"Bear\00"
%Bear = type {
	%_Bear_vtable*,
	i32,
	i32,
	i32
}

%_Bear_vtable = type {
	i32,
	i32,
	i8*,
	%Bear* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *,
	i32 (%Toy*,i32,i32) *,
	i32 (%Bear*,i32,i32) *
}

@_Bear_vtable_prototype = constant %_Bear_vtable {
	i32 6,
	i32 ptrtoint (%Bear* getelementptr (%Bear, %Bear* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bear, i32 0, i32 0),
	%Bear* () * @Bear_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	i32 (%Toy*,i32,i32) * @Toy_play,
	i32 (%Bear*,i32,i32) * @Bear_eat
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
	i32 (%Main*) *
}

@_Main_vtable_prototype = constant %_Main_vtable {
	i32 7,
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy,
	i32 (%Main*) * @Main_main
}

@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [8 x i8] c"test.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%vtpm.0 = call %Main* @Main_new(  )
	%vtpm.1 = call i32(%Main* ) @Main_main( %Main* %vtpm.0 )
	ret i32 0
}

define %Object* @Toy_abort(%Toy* %self) {
	%vtpm.2 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.2
	%vtpm.3 = bitcast i8* null to %Object*
	ret %Object* %vtpm.3

abort:
	call void @abort(  )
	unreachable
}

define %String* @Toy_type_name(%Toy* %self) {
	%vtpm.5 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.5
	%vtpm.6 = bitcast i8* null to %String*
	ret %String* %vtpm.6

abort:
	call void @abort(  )
	unreachable
}

define %Toy* @Toy_copy(%Toy* %self) {
	%vtpm.8 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.8
	%vtpm.9 = bitcast i8* null to %Toy*
	ret %Toy* %vtpm.9

abort:
	call void @abort(  )
	unreachable
}

define i32 @Toy_play(%Toy* %self, i32 %x, i32 %y) {
	%vtpm.11 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.11
	%vtpm.12 = alloca i32
	store i32 %x, i32* %vtpm.12
	%vtpm.13 = alloca i32
	store i32 %y, i32* %vtpm.13
	%vtpm.14 = load i32, i32* %vtpm.12
	%vtpm.15 = load i32, i32* %vtpm.13
	%vtpm.16 = add i32 %vtpm.14, %vtpm.15
	ret i32 %vtpm.16

abort:
	call void @abort(  )
	unreachable
}

define %Toy* @Toy_new() {

entry:
	%vtpm.18 = alloca %Toy*
	%vtpm.19 = getelementptr %_Toy_vtable, %_Toy_vtable* @_Toy_vtable_prototype, i32 0, i32 1
	%vtpm.20 = load i32, i32* %vtpm.19
	%vtpm.21 = call i8* @malloc(i32 %vtpm.20)
	%vtpm.22 = bitcast i8* %vtpm.21 to %Toy*
	%vtpm.23 = icmp eq %Toy* %vtpm.22, null
	br i1 %vtpm.23, label %abort, label %ok.0

ok.0:
	%vtpm.24 = getelementptr %Toy, %Toy* %vtpm.22, i32 0, i32 0
	store %_Toy_vtable* @_Toy_vtable_prototype, %_Toy_vtable** %vtpm.24
	store %Toy* %vtpm.22, %Toy** %vtpm.18
	ret %Toy* %vtpm.22

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Bear_abort(%Bear* %self) {
	%vtpm.26 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.26
	%vtpm.27 = bitcast i8* null to %Object*
	ret %Object* %vtpm.27

abort:
	call void @abort(  )
	unreachable
}

define %String* @Bear_type_name(%Bear* %self) {
	%vtpm.29 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.29
	%vtpm.30 = bitcast i8* null to %String*
	ret %String* %vtpm.30

abort:
	call void @abort(  )
	unreachable
}

define %Bear* @Bear_copy(%Bear* %self) {
	%vtpm.32 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.32
	%vtpm.33 = bitcast i8* null to %Bear*
	ret %Bear* %vtpm.33

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bear_play(%Bear* %self, i32 %x, i32 %y) {
	%vtpm.35 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.35
	%vtpm.36 = alloca i32
	store i32 %x, i32* %vtpm.36
	%vtpm.37 = alloca i32
	store i32 %y, i32* %vtpm.37
	%vtpm.38 = load i32, i32* %vtpm.36
	%vtpm.39 = load i32, i32* %vtpm.37
	%vtpm.40 = add i32 %vtpm.38, %vtpm.39
	ret i32 %vtpm.40

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bear_eat(%Bear* %self, i32 %x, i32 %y) {
	%vtpm.42 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.42
	%vtpm.43 = alloca i32
	store i32 %x, i32* %vtpm.43
	%vtpm.44 = alloca i32
	store i32 %y, i32* %vtpm.44
	%vtpm.45 = load i32, i32* %vtpm.43
	%vtpm.46 = load i32, i32* %vtpm.44
	%vtpm.47 = add i32 %vtpm.45, %vtpm.46
	ret i32 %vtpm.47

abort:
	call void @abort(  )
	unreachable
}

define %Bear* @Bear_new() {

entry:
	%vtpm.49 = alloca %Bear*
	%vtpm.50 = getelementptr %_Bear_vtable, %_Bear_vtable* @_Bear_vtable_prototype, i32 0, i32 1
	%vtpm.51 = load i32, i32* %vtpm.50
	%vtpm.52 = call i8* @malloc(i32 %vtpm.51)
	%vtpm.53 = bitcast i8* %vtpm.52 to %Bear*
	%vtpm.54 = icmp eq %Bear* %vtpm.53, null
	br i1 %vtpm.54, label %abort, label %ok.0

ok.0:
	%vtpm.55 = getelementptr %Bear, %Bear* %vtpm.53, i32 0, i32 0
	store %_Bear_vtable* @_Bear_vtable_prototype, %_Bear_vtable** %vtpm.55
	store %Bear* %vtpm.53, %Bear** %vtpm.49
	%vtpm.56 = getelementptr %Bear, %Bear* %vtpm.53, i32 0, i32 1
	store i32 1, i32* %vtpm.56
	%vtpm.57 = getelementptr %Bear, %Bear* %vtpm.53, i32 0, i32 2
	store i32 2, i32* %vtpm.57
	%vtpm.58 = getelementptr %Bear, %Bear* %vtpm.53, i32 0, i32 3
	store i32 0, i32* %vtpm.58
	ret %Bear* %vtpm.53

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_abort(%Main* %self) {
	%vtpm.60 = alloca %Main*
	store %Main* %self, %Main** %vtpm.60
	%vtpm.61 = bitcast i8* null to %Object*
	ret %Object* %vtpm.61

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_type_name(%Main* %self) {
	%vtpm.63 = alloca %Main*
	store %Main* %self, %Main** %vtpm.63
	%vtpm.64 = bitcast i8* null to %String*
	ret %String* %vtpm.64

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_copy(%Main* %self) {
	%vtpm.66 = alloca %Main*
	store %Main* %self, %Main** %vtpm.66
	%vtpm.67 = bitcast i8* null to %Main*
	ret %Main* %vtpm.67

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_main(%Main* %self) {
	%vtpm.69 = alloca %Main*
	store %Main* %self, %Main** %vtpm.69
	%tmp.0 = alloca %Toy*
	%vtpm.70 = call %Toy* @Toy_new(  )
	store %Toy* %vtpm.70, %Toy** %tmp.0
	%vtpm.71 = load %Toy*, %Toy** %tmp.0
	%vtpm.72 = icmp eq %Toy* %vtpm.71, null
	br i1 %vtpm.72, label %abort, label %ok.0

ok.0:
	%vtpm.73 = getelementptr %Toy, %Toy* %vtpm.71, i32 0, i32 0
	%vtpm.74 = load %_Toy_vtable*, %_Toy_vtable** %vtpm.73
	%vtpm.75 = getelementptr %_Toy_vtable, %_Toy_vtable* %vtpm.74, i32 0, i32 7
	%tmp.1 = load i32 (%Toy*,i32,i32) *, i32 (%Toy*,i32,i32) ** %vtpm.75
	%vtpm.76 = call i32(%Toy*, i32, i32 ) %tmp.1( %Toy* %vtpm.71, i32 5, i32 4 )
	ret i32 3

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.78 = alloca %Main*
	%vtpm.79 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.80 = load i32, i32* %vtpm.79
	%vtpm.81 = call i8* @malloc(i32 %vtpm.80)
	%vtpm.82 = bitcast i8* %vtpm.81 to %Main*
	%vtpm.83 = icmp eq %Main* %vtpm.82, null
	br i1 %vtpm.83, label %abort, label %ok.1

ok.1:
	%vtpm.84 = getelementptr %Main, %Main* %vtpm.82, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.84
	store %Main* %vtpm.82, %Main** %vtpm.78
	ret %Main* %vtpm.82

abort:
	call void @abort(  )
	unreachable
}

