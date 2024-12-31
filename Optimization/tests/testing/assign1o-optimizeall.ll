; ModuleID = 'tests/testing/assign1o.ll'
source_filename = "tests/testing/assign1o.ll"

%_Object_vtable = type { i32, i32, i8*, %Object* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)* }
%Object = type { %_Object_vtable* }
%String = type { %_String_vtable*, i8* }
%_String_vtable = type { i32, i32, i8*, %String* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, i32 (%String*)*, %String* (%String*, %String*)*, %String* (%String*, i32, i32)* }
%_Int_vtable = type { i32, i32, i8*, %Int* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)* }
%Int = type { %_Int_vtable*, i32 }
%_Bool_vtable = type { i32, i32, i8*, %Bool* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)* }
%Bool = type { %_Bool_vtable*, i1 }
%_IO_vtable = type { i32, i32, i8*, %IO* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, %IO* (%IO*, %String*)*, %IO* (%IO*, i32)*, %String* (%IO*)*, i32 (%IO*)* }
%IO = type { %_IO_vtable* }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, %IO* (%IO*, %String*)*, %IO* (%IO*, i32)*, %String* (%IO*)*, i32 (%IO*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable*, i32 }

@str.Object = internal constant [7 x i8] c"Object\00"
@_Object_vtable_prototype = constant %_Object_vtable { i32 0, i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0), %Object* ()* @Object_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Int = internal constant [4 x i8] c"Int\00"
@_Int_vtable_prototype = constant %_Int_vtable { i32 1, i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0), %Int* ()* @Int_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Bool = internal constant [5 x i8] c"Bool\00"
@_Bool_vtable_prototype = constant %_Bool_vtable { i32 2, i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0), %Bool* ()* @Bool_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.String = internal constant [7 x i8] c"String\00"
@_String_vtable_prototype = constant %_String_vtable { i32 3, i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0), %String* ()* @String_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, i32 (%String*)* @String_length, %String* (%String*, %String*)* @String_concat, %String* (%String*, i32, i32)* @String_substr }
@str.IO = internal constant [3 x i8] c"IO\00"
@_IO_vtable_prototype = constant %_IO_vtable { i32 4, i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0), %IO* ()* @IO_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int, %Object* (%Main*)* @Main_main }
@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0) }
@str.0 = internal constant [17 x i8] c"test/assign1o.cl\00"
@String.0 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str.0, i32 0, i32 0) }

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

declare %Bool* @Bool_new()

define i32 @main() {
entry:
  %vtpm.43.i = call i8* @malloc(i32 16)
  %vtpm.45.i = icmp eq i8* %vtpm.43.i, null
  br i1 %vtpm.45.i, label %abort.i, label %Main_main.exit

abort.i:                                          ; preds = %entry
  call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %entry
  %vtpm.46.i = bitcast i8* %vtpm.43.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.46.i, align 8
  %vtpm.47.i = getelementptr i8, i8* %vtpm.43.i, i64 8
  %0 = bitcast i8* %vtpm.47.i to i32*
  store i32 5, i32* %0, align 4
  %vtpm.26.i = getelementptr i8, i8* %vtpm.43.i, i64 8
  %1 = bitcast i8* %vtpm.26.i to i32*
  store i32 7656, i32* %1, align 4
  %vtpm.29.i = bitcast i8* %vtpm.43.i to %_Main_vtable**
  %vtpm.30.i = load %_Main_vtable*, %_Main_vtable** %vtpm.29.i, align 8
  %vtpm.34.i = bitcast i8* %vtpm.43.i to %IO*
  %vtpm.35.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.30.i, i64 0, i32 8
  %tmp.0.i = load %IO* (%IO*, i32)*, %IO* (%IO*, i32)** %vtpm.35.i, align 8
  %vtpm.36.i = call %IO* %tmp.0.i(%IO* nonnull %vtpm.34.i, i32 7656)
  ret i32 0
}

define %Object* @Main_abort(%Main* %self) {
  ret %Object* null
}

define %String* @Main_type_name(%Main* %self) {
  ret %String* null
}

define %Main* @Main_copy(%Main* %self) {
  ret %Main* null
}

define %Main* @Main_out_string(%Main* %self, %String* %arg) {
  ret %Main* null
}

define %Main* @Main_out_int(%Main* %self, i32 %arg) {
  ret %Main* null
}

define %String* @Main_in_string(%Main* %self) {
  ret %String* null
}

define i32 @Main_in_int(%Main* %self) {
  ret i32 0
}

define %Object* @Main_main(%Main* %self) {
ok.0:
  %vtpm.26 = getelementptr %Main, %Main* %self, i64 0, i32 1
  store i32 7656, i32* %vtpm.26, align 4
  %vtpm.29 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.30 = load %_Main_vtable*, %_Main_vtable** %vtpm.29, align 8
  %vtpm.34 = bitcast %Main* %self to %IO*
  %vtpm.35 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.30, i64 0, i32 8
  %tmp.0 = load %IO* (%IO*, i32)*, %IO* (%IO*, i32)** %vtpm.35, align 8
  %vtpm.36 = call %IO* %tmp.0(%IO* nonnull %vtpm.34, i32 7656)
  %vtpm.38 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.38
}

define %Main* @Main_new() {
entry:
  %vtpm.43 = call i8* @malloc(i32 16)
  %vtpm.45 = icmp eq i8* %vtpm.43, null
  br i1 %vtpm.45, label %abort, label %ok.1

ok.1:                                             ; preds = %entry
  %vtpm.44 = bitcast i8* %vtpm.43 to %Main*
  %vtpm.46 = bitcast i8* %vtpm.43 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.46, align 8
  %vtpm.47 = getelementptr i8, i8* %vtpm.43, i64 8
  %0 = bitcast i8* %vtpm.47 to i32*
  store i32 5, i32* %0, align 4
  ret %Main* %vtpm.44

abort:                                            ; preds = %entry
  call void @abort()
  unreachable
}
