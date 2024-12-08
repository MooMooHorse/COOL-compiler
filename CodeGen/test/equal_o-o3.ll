; ModuleID = 'equal_o.ll'
source_filename = "equal_o.ll"

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
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, %IO* (%IO*, %String*)*, %IO* (%IO*, i32)*, %String* (%IO*)*, i32 (%IO*)*, i1 (%Main*)*, %Object* (%Main*)* }
%Main = type { %_Main_vtable* }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int, i1 (%Main*)* @Main_func, %Object* (%Main*)* @Main_main }
@str.3 = internal constant [14 x i8] c"<basic class>\00"
@String.3 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.3, i32 0, i32 0) }
@str.2 = internal constant [7 x i8] c"not ok\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.2, i32 0, i32 0) }
@str.1 = internal constant [3 x i8] c"ok\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.1, i32 0, i32 0) }
@str.0 = internal constant [11 x i8] c"equal_o.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.0, i32 0, i32 0) }

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

declare %Bool* @Bool_new()

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.58.i = tail call i8* @malloc(i32 8)
  %vtpm.60.i = icmp eq i8* %vtpm.58.i, null
  br i1 %vtpm.60.i, label %abort.i, label %Main_main.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %entry
  %vtpm.61.i = bitcast i8* %vtpm.58.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.61.i, align 8
  %vtpm.47.i = bitcast i8* %vtpm.58.i to %IO*
  %vtpm.49.i = tail call %IO* @IO_out_string(%IO* nonnull %vtpm.47.i, %String* nonnull @String.2)
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Main* @Main_out_string(%Main* nocapture readnone %self, %String* nocapture readnone %arg) local_unnamed_addr #0 {
  ret %Main* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Main* @Main_out_int(%Main* nocapture readnone %self, i32 %arg) local_unnamed_addr #0 {
  ret %Main* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %String* @Main_in_string(%Main* nocapture readnone %self) local_unnamed_addr #0 {
  ret %String* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Main_in_int(%Main* nocapture readnone %self) local_unnamed_addr #0 {
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i1 @Main_func(%Main* nocapture readnone %self) #0 {
  ret i1 false
}

define %Object* @Main_main(%Main* %self) {
  %vtpm.29 = icmp eq %Main* %self, null
  br i1 %vtpm.29, label %abort, label %ok.0

ok.0:                                             ; preds = %0
  %vtpm.30 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.31 = load %_Main_vtable*, %_Main_vtable** %vtpm.30, align 8
  %vtpm.32 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.31, i64 0, i32 11
  %tmp.0 = load i1 (%Main*)*, i1 (%Main*)** %vtpm.32, align 8
  %vtpm.33 = tail call i1 %tmp.0(%Main* nonnull %self)
  %vtpm.46 = load %_Main_vtable*, %_Main_vtable** %vtpm.30, align 8
  %vtpm.47 = bitcast %Main* %self to %IO*
  %vtpm.48 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.46, i64 0, i32 7
  %tmp.2 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.48, align 8
  %String.1.String.2 = select i1 %vtpm.33, %String* @String.1, %String* @String.2
  %vtpm.49 = tail call %IO* %tmp.2(%IO* nonnull %vtpm.47, %String* nonnull %String.1.String.2)
  %vtpm.53 = bitcast %Main* %self to %Object*
  ret %Object* %vtpm.53

abort:                                            ; preds = %0
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.58 = tail call i8* @malloc(i32 8)
  %vtpm.60 = icmp eq i8* %vtpm.58, null
  br i1 %vtpm.60, label %abort, label %ok.3

ok.3:                                             ; preds = %entry
  %vtpm.59 = bitcast i8* %vtpm.58 to %Main*
  %vtpm.61 = bitcast i8* %vtpm.58 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.61, align 8
  ret %Main* %vtpm.59

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
