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

define %Object* @Toy_abort(%Toy* %self) {
	%vtpm.0 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.0

abort:
	call void @abort(  )
	unreachable
}

define %String* @Toy_type_name(%Toy* %self) {
	%vtpm.2 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.2

abort:
	call void @abort(  )
	unreachable
}

define %Toy* @Toy_copy(%Toy* %self) {
	%vtpm.4 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.4

abort:
	call void @abort(  )
	unreachable
}

define i32 @Toy_play(%Toy* %self, i32 %x, i32 %y) {
	%vtpm.6 = alloca %Toy*
	store %Toy* %self, %Toy** %vtpm.6
	%vtpm.7 = alloca i32
	store i32 %x, i32* %vtpm.7
	%vtpm.8 = alloca i32
	store i32 %y, i32* %vtpm.8

abort:
	call void @abort(  )
	unreachable
}

define %Toy* @Toy_new() {

entry:
	%vtpm.10 = alloca %Toy*
	%vtpm.11 = getelementptr %_Toy_vtable, %_Toy_vtable* @_Toy_vtable_prototype, i32 0, i32 1
	%vtpm.12 = load i32, i32* %vtpm.11
	%vtpm.13 = call i8* @malloc(i32 %vtpm.12)
	%vtpm.14 = bitcast i8* %vtpm.13 to %Toy*
	%vtpm.15 = icmp eq %Toy* %vtpm.14, null
	br i1 %vtpm.15, label %abort, label %ok.0

ok.0:
	%vtpm.16 = getelementptr %Toy, %Toy* %vtpm.14, i32 0, i32 0
	store %_Toy_vtable* @_Toy_vtable_prototype, %_Toy_vtable* %vtpm.16
	store %Toy* %vtpm.14, %Toy** %vtpm.10
	ret %Toy* %vtpm.14

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Bear_abort(%Bear* %self) {
	%vtpm.18 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.18

abort:
	call void @abort(  )
	unreachable
}

define %String* @Bear_type_name(%Bear* %self) {
	%vtpm.20 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.20

abort:
	call void @abort(  )
	unreachable
}

define %Bear* @Bear_copy(%Bear* %self) {
	%vtpm.22 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.22

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bear_play(%Bear* %self, i32 %x, i32 %y) {
	%vtpm.24 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.24
	%vtpm.25 = alloca i32
	store i32 %x, i32* %vtpm.25
	%vtpm.26 = alloca i32
	store i32 %y, i32* %vtpm.26

abort:
	call void @abort(  )
	unreachable
}

define i32 @Bear_eat(%Bear* %self, i32 %x, i32 %y) {
	%vtpm.28 = alloca %Bear*
	store %Bear* %self, %Bear** %vtpm.28
	%vtpm.29 = alloca i32
	store i32 %x, i32* %vtpm.29
	%vtpm.30 = alloca i32
	store i32 %y, i32* %vtpm.30

abort:
	call void @abort(  )
	unreachable
}

define %Bear* @Bear_new() {

entry:
	%vtpm.32 = alloca %Bear*
	%vtpm.33 = getelementptr %_Bear_vtable, %_Bear_vtable* @_Bear_vtable_prototype, i32 0, i32 1
	%vtpm.34 = load i32, i32* %vtpm.33
	%vtpm.35 = call i8* @malloc(i32 %vtpm.34)
	%vtpm.36 = bitcast i8* %vtpm.35 to %Bear*
	%vtpm.37 = icmp eq %Bear* %vtpm.36, null
	br i1 %vtpm.37, label %abort, label %ok.0

ok.0:
	%vtpm.38 = getelementptr %Bear, %Bear* %vtpm.36, i32 0, i32 0
	store %_Bear_vtable* @_Bear_vtable_prototype, %_Bear_vtable* %vtpm.38
	store %Bear* %vtpm.36, %Bear** %vtpm.32
	%vtpm.39 = getelementptr %Bear, %Bear* %vtpm.36, i32 0, i32 1
	store  , i32* %vtpm.39
	%vtpm.40 = getelementptr %Bear, %Bear* %vtpm.36, i32 0, i32 2
	store  , i32* %vtpm.40
	%vtpm.41 = getelementptr %Bear, %Bear* %vtpm.36, i32 0, i32 3
	store i32 0, i32* %vtpm.41
	ret %Bear* %vtpm.36

abort:
	call void @abort(  )
	unreachable
}

define %Object* @Main_abort(%Main* %self) {
	%vtpm.43 = alloca %Main*
	store %Main* %self, %Main** %vtpm.43

abort:
	call void @abort(  )
	unreachable
}

define %String* @Main_type_name(%Main* %self) {
	%vtpm.45 = alloca %Main*
	store %Main* %self, %Main** %vtpm.45

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_copy(%Main* %self) {
	%vtpm.47 = alloca %Main*
	store %Main* %self, %Main** %vtpm.47

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_main(%Main* %self) {
	%vtpm.49 = alloca %Main*
	store %Main* %self, %Main** %vtpm.49
	%tmp.0 = alloca %Toy*

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.51 = alloca %Main*
	%vtpm.52 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.53 = load i32, i32* %vtpm.52
	%vtpm.54 = call i8* @malloc(i32 %vtpm.53)
	%vtpm.55 = bitcast i8* %vtpm.54 to %Main*
	%vtpm.56 = icmp eq %Main* %vtpm.55, null
	br i1 %vtpm.56, label %abort, label %ok.0

ok.0:
	%vtpm.57 = getelementptr %Main, %Main* %vtpm.55, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable* %vtpm.57
	store %Main* %vtpm.55, %Main** %vtpm.51
	ret %Main* %vtpm.55

abort:
	call void @abort(  )
	unreachable
}

