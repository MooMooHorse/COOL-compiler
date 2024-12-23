; ModuleID = 'checkeq.ll'
source_filename = "checkeq.ll"

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
%Main = type { %_Main_vtable*, %Object* }

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int, %Object* (%Main*)* @Main_main }
@str.9 = internal constant [15 x i8] c"\22abc\22 = \22bbc\22\0A\00"
@String.9 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.9, i32 0, i32 0) }
@str.8 = internal constant [4 x i8] c"bbc\00"
@String.8 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.8, i32 0, i32 0) }
@str.10 = internal constant [16 x i8] c"\22abc\22 != \22bbc\22\0A\00"
@String.10 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.10, i32 0, i32 0) }
@str.7 = internal constant [4 x i8] c"abc\00"
@String.7 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.7, i32 0, i32 0) }
@str.6 = internal constant [15 x i8] c"true != false\0A\00"
@String.6 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.6, i32 0, i32 0) }
@str.5 = internal constant [14 x i8] c"true = false\0A\00"
@String.5 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.5, i32 0, i32 0) }
@str.4 = internal constant [8 x i8] c"1 != 0\0A\00"
@String.4 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.4, i32 0, i32 0) }
@str.3 = internal constant [7 x i8] c"1 = 0\0A\00"
@String.3 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.3, i32 0, i32 0) }
@str.2 = internal constant [13 x i8] c"self != obj\0A\00"
@String.2 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str.2, i32 0, i32 0) }
@str.1 = internal constant [12 x i8] c"self = obj\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.1, i32 0, i32 0) }
@str.11 = internal constant [14 x i8] c"<basic class>\00"
@String.11 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.11, i32 0, i32 0) }
@str.0 = internal constant [11 x i8] c"checkeq.cl\00"
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
  %vtpm.110.i = tail call i8* @malloc(i32 16)
  %vtpm.112.i = icmp eq i8* %vtpm.110.i, null
  br i1 %vtpm.112.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.113.i = bitcast i8* %vtpm.110.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.113.i, align 8
  %vtpm.114.i = getelementptr i8, i8* %vtpm.110.i, i64 8
  %0 = bitcast i8* %vtpm.114.i to %Object**
  store %Object* null, %Object** %0, align 8
  %vtpm.44.i = bitcast i8* %vtpm.110.i to %IO*
  %vtpm.46.i = tail call %IO* @IO_out_string(%IO* nonnull %vtpm.44.i, %String* nonnull @String.2)
  %vtpm.54.i = load %_Main_vtable*, %_Main_vtable** %vtpm.113.i, align 8
  %vtpm.56.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.54.i, i64 0, i32 7
  %tmp.2.i = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.56.i, align 8
  %vtpm.57.i = tail call %IO* %tmp.2.i(%IO* nonnull %vtpm.44.i, %String* nonnull @String.4)
  %vtpm.73.i = load %_Main_vtable*, %_Main_vtable** %vtpm.113.i, align 8
  %vtpm.75.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.73.i, i64 0, i32 7
  %tmp.4.i = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.75.i, align 8
  %vtpm.76.i = tail call %IO* %tmp.4.i(%IO* nonnull %vtpm.44.i, %String* nonnull @String.6)
  %vtpm.92.i = load %_Main_vtable*, %_Main_vtable** %vtpm.113.i, align 8
  %vtpm.94.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.92.i, i64 0, i32 7
  %tmp.6.i = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.94.i, align 8
  %vtpm.95.i = tail call %IO* %tmp.6.i(%IO* nonnull %vtpm.44.i, %String* nonnull @String.10)
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

define %Object* @Main_main(%Main* %self) {
ok.2:
  %vtpm.27 = getelementptr %Main, %Main* %self, i64 0, i32 1
  %vtpm.28 = load %Object*, %Object** %vtpm.27, align 8
  %vtpm.29 = bitcast %Main* %self to %Object*
  %vtpm.30 = icmp eq %Object* %vtpm.28, %vtpm.29
  %vtpm.42 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.43 = load %_Main_vtable*, %_Main_vtable** %vtpm.42, align 8
  %vtpm.44 = bitcast %Main* %self to %IO*
  %vtpm.45 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.43, i64 0, i32 7
  %tmp.1 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.45, align 8
  %String.1.String.2 = select i1 %vtpm.30, %String* @String.1, %String* @String.2
  %vtpm.46 = tail call %IO* %tmp.1(%IO* nonnull %vtpm.44, %String* nonnull %String.1.String.2)
  %vtpm.55.pre-phi = bitcast %Main* %self to %IO*
  %vtpm.53 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.54 = load %_Main_vtable*, %_Main_vtable** %vtpm.53, align 8
  %vtpm.56 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.54, i64 0, i32 7
  %tmp.2 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.56, align 8
  %vtpm.57 = tail call %IO* %tmp.2(%IO* nonnull %vtpm.55.pre-phi, %String* nonnull @String.4)
  %vtpm.73 = load %_Main_vtable*, %_Main_vtable** %vtpm.53, align 8
  %vtpm.75 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.73, i64 0, i32 7
  %tmp.4 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.75, align 8
  %vtpm.76 = tail call %IO* %tmp.4(%IO* nonnull %vtpm.55.pre-phi, %String* nonnull @String.6)
  %vtpm.92 = load %_Main_vtable*, %_Main_vtable** %vtpm.53, align 8
  %vtpm.94 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.92, i64 0, i32 7
  %tmp.6 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.94, align 8
  %vtpm.95 = tail call %IO* %tmp.6(%IO* nonnull %vtpm.55.pre-phi, %String* nonnull @String.10)
  %vtpm.105.cast = bitcast %IO* %vtpm.95 to %Object*
  ret %Object* %vtpm.105.cast
}

define %Main* @Main_new() {
entry:
  %vtpm.110 = tail call i8* @malloc(i32 16)
  %vtpm.112 = icmp eq i8* %vtpm.110, null
  br i1 %vtpm.112, label %abort, label %ok.8

ok.8:                                             ; preds = %entry
  %vtpm.111 = bitcast i8* %vtpm.110 to %Main*
  %vtpm.113 = bitcast i8* %vtpm.110 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.113, align 8
  %vtpm.114 = getelementptr i8, i8* %vtpm.110, i64 8
  %0 = bitcast i8* %vtpm.114 to %Object**
  store %Object* null, %Object** %0, align 8
  ret %Main* %vtpm.111

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
