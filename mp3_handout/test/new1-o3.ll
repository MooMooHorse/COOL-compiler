; ModuleID = 'new1.ll'
source_filename = "new1.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable*, i32 }

@str.Object = internal constant [7 x i8] c"Object\00"
@_Object_vtable_prototype = local_unnamed_addr constant %_Object_vtable { i32 0, i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0), %Object* ()* @Object_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Int = internal constant [4 x i8] c"Int\00"
@_Int_vtable_prototype = local_unnamed_addr constant %_Int_vtable { i32 1, i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0), %Int* ()* @Int_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.Bool = internal constant [5 x i8] c"Bool\00"
@_Bool_vtable_prototype = local_unnamed_addr constant %_Bool_vtable { i32 2, i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0), %Bool* ()* @Bool_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy }
@str.String = internal constant [7 x i8] c"String\00"
@_String_vtable_prototype = constant %_String_vtable { i32 3, i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0), %String* ()* @String_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, i32 (%String*)* @String_length, %String* (%String*, %String*)* @String_concat, %String* (%String*, i32, i32)* @String_substr }
@str.IO = internal constant [3 x i8] c"IO\00"
@_IO_vtable_prototype = local_unnamed_addr constant %_IO_vtable { i32 4, i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0), %IO* ()* @IO_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %Object* (%Main*)* @Main_main }
@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0) }
@str.0 = internal constant [8 x i8] c"new1.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.0, i32 0, i32 0) }

declare void @abort() local_unnamed_addr

declare i8* @malloc(i32) local_unnamed_addr

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

declare void @Int_init(%Int*, i32) local_unnamed_addr

declare %Bool* @Bool_new()

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.22.i = tail call i8* @malloc(i32 16)
  %vtpm.24.i = icmp eq i8* %vtpm.22.i, null
  br i1 %vtpm.24.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.25.i = bitcast i8* %vtpm.22.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.25.i, align 8
  %vtpm.26.i = tail call %Int* @Int_new()
  %vtpm.27.i = getelementptr i8, i8* %vtpm.22.i, i64 8
  %0 = bitcast i8* %vtpm.27.i to i32*
  %vtpm.28.i = getelementptr %Int, %Int* %vtpm.26.i, i64 0, i32 1
  %vtpm.29.i = load i32, i32* %vtpm.28.i, align 4
  store i32 %vtpm.29.i, i32* %0, align 4
  %vtpm.15.i = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.15.i, i32 %vtpm.29.i)
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Object* @Main_abort(%Main* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Object* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %String* @Main_type_name(%Main* nocapture readnone %self) local_unnamed_addr #0 {
  ret %String* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Main* @Main_copy(%Main* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Main* null
}

define %Object* @Main_main(%Main* nocapture readonly %self) {
  %vtpm.13 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %vtpm.14 = load i32, i32* %vtpm.13, align 4
  %vtpm.15 = tail call %Int* @Int_new()
  tail call void @Int_init(%Int* %vtpm.15, i32 %vtpm.14)
  %vtpm.17 = bitcast %Int* %vtpm.15 to %Object*
  ret %Object* %vtpm.17
}

define %Main* @Main_new() {
entry:
  %vtpm.22 = tail call i8* @malloc(i32 16)
  %vtpm.24 = icmp eq i8* %vtpm.22, null
  br i1 %vtpm.24, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.23 = bitcast i8* %vtpm.22 to %Main*
  %vtpm.25 = bitcast i8* %vtpm.22 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.25, align 8
  %vtpm.26 = tail call %Int* @Int_new()
  %vtpm.27 = getelementptr i8, i8* %vtpm.22, i64 8
  %0 = bitcast i8* %vtpm.27 to i32*
  %vtpm.28 = getelementptr %Int, %Int* %vtpm.26, i64 0, i32 1
  %vtpm.29 = load i32, i32* %vtpm.28, align 4
  store i32 %vtpm.29, i32* %0, align 4
  ret %Main* %vtpm.23

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
