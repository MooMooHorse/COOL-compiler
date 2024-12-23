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

@str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [6 x i8] c"main\0A\00"
@String.2 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([6 x i8], [6 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [8 x i8] c"object\0A\00"
@String.1 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [14 x i8] c"case-order.cl\00"
@String.0 = constant %String {
	%_String_vtable* @_String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.0, i32 0, i32 0)
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
	%tmp.0 = alloca %Object*
	%tmp.1 = alloca %Main*
	%tmp.2 = alloca %Object*
	%tmp.3 = alloca %Main*
	%vtpm.25 = load %Main*, %Main** %vtpm.24
	%vtpm.26 = bitcast %Main* %vtpm.25 to %Object*
	store %Object* %vtpm.26, %Object** %tmp.0
	%vtpm.27 = load %Object*, %Object** %tmp.0
	%tmp.4 = icmp eq %Object* %vtpm.27, null
	br i1 %tmp.4, label %abort, label %ok.0

ok.0:
	%vtpm.28 = getelementptr %Object, %Object* %vtpm.27, i32 0, i32 0
	%vtpm.29 = load %_Object_vtable*, %_Object_vtable** %vtpm.28
	%vtpm.30 = getelementptr %_Object_vtable, %_Object_vtable* %vtpm.29, i32 0, i32 0
	%vtpm.31 = load i32, i32* %vtpm.30
	br label %case.hdr.0

case.hdr.0:
	br label %case.5.0

case.5.0:
	%vtpm.32 = icmp slt i32 %vtpm.31, 5
	br i1 %vtpm.32, label %br_exit.5.0, label %src_gte_br.5.0

src_gte_br.5.0:
	%vtpm.33 = icmp sgt i32 %vtpm.31, 5
	br i1 %vtpm.33, label %br_exit.5.0, label %src_lte_mc.5.0

src_lte_mc.5.0:
	store %Object* %vtpm.27, %Object** %tmp.2
	%vtpm.34 = load %Main*, %Main** %vtpm.24
	%vtpm.35 = icmp eq %Main* %vtpm.34, null
	br i1 %vtpm.35, label %abort, label %ok.1

ok.1:
	%vtpm.36 = getelementptr %Main, %Main* %vtpm.34, i32 0, i32 0
	%vtpm.37 = load %_Main_vtable*, %_Main_vtable** %vtpm.36
	%vtpm.38 = bitcast %Main* %vtpm.34 to %IO*
	%vtpm.39 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.37, i32 0, i32 7
	%tmp.5 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.39
	%vtpm.40 = call %IO*(%IO*, %String* ) %tmp.5( %IO* %vtpm.38, %String* @String.2 )
	%vtpm.41 = bitcast %IO* %vtpm.40 to %Main*
	store %Main* %vtpm.41, %Main** %tmp.1
	br label %case.exit.0

br_exit.5.0:
	br label %case.0.0

case.0.0:
	%vtpm.42 = icmp slt i32 %vtpm.31, 0
	br i1 %vtpm.42, label %br_exit.0.0, label %src_gte_br.0.0

src_gte_br.0.0:
	%vtpm.43 = icmp sgt i32 %vtpm.31, 5
	br i1 %vtpm.43, label %br_exit.0.0, label %src_lte_mc.0.0

src_lte_mc.0.0:
	%vtpm.44 = bitcast %Object* %vtpm.27 to %Main*
	store %Main* %vtpm.44, %Main** %tmp.3
	%vtpm.45 = load %Main*, %Main** %vtpm.24
	%vtpm.46 = icmp eq %Main* %vtpm.45, null
	br i1 %vtpm.46, label %abort, label %ok.2

ok.2:
	%vtpm.47 = getelementptr %Main, %Main* %vtpm.45, i32 0, i32 0
	%vtpm.48 = load %_Main_vtable*, %_Main_vtable** %vtpm.47
	%vtpm.49 = bitcast %Main* %vtpm.45 to %IO*
	%vtpm.50 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.48, i32 0, i32 7
	%tmp.6 = load %IO* (%IO*,%String*) *, %IO* (%IO*,%String*) ** %vtpm.50
	%vtpm.51 = call %IO*(%IO*, %String* ) %tmp.6( %IO* %vtpm.49, %String* @String.1 )
	%vtpm.52 = bitcast %IO* %vtpm.51 to %Main*
	store %Main* %vtpm.52, %Main** %tmp.1
	br label %case.exit.0

br_exit.0.0:
	br label %abort

case.exit.0:
	%tmp.7 = load %Main*, %Main** %tmp.1
	%vtpm.53 = bitcast i8* null to %Object*
	ret %Object* %vtpm.53

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%vtpm.55 = alloca %Main*
	%vtpm.56 = getelementptr %_Main_vtable, %_Main_vtable* @_Main_vtable_prototype, i32 0, i32 1
	%vtpm.57 = load i32, i32* %vtpm.56
	%vtpm.58 = call i8* @malloc(i32 %vtpm.57)
	%vtpm.59 = bitcast i8* %vtpm.58 to %Main*
	%vtpm.60 = icmp eq %Main* %vtpm.59, null
	br i1 %vtpm.60, label %abort, label %ok.3

ok.3:
	%vtpm.61 = getelementptr %Main, %Main* %vtpm.59, i32 0, i32 0
	store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.61
	store %Main* %vtpm.59, %Main** %vtpm.55
	ret %Main* %vtpm.59

abort:
	call void @abort(  )
	unreachable
}
