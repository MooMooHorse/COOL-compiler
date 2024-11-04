; ModuleID = 'basic_funcs.ll'
source_filename = "basic_funcs.ll"

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
@_Main_vtable_prototype = constant %_Main_vtable { i32 5, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %IO* (%IO*, %String*)* @IO_out_string, %IO* (%IO*, i32)* @IO_out_int, %String* (%IO*)* @IO_in_string, i32 (%IO*)* @IO_in_int, %Object* (%Main*)* @Main_main }
@str.1 = internal constant [7 x i8] c"Frugel\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.1, i32 0, i32 0) }
@str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0) }
@str.0 = internal constant [15 x i8] c"basic_funcs.cl\00"
@String.0 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.0, i32 0, i32 0) }

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
  %vtpm.109.i = tail call i8* @malloc(i32 8)
  %vtpm.111.i = icmp eq i8* %vtpm.109.i, null
  br i1 %vtpm.111.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.110.i = bitcast i8* %vtpm.109.i to %Main*
  %vtpm.112.i = bitcast i8* %vtpm.109.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.112.i, align 8
  %vtpm.1 = tail call %Object* @Main_main(%Main* nonnull %vtpm.110.i)
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
  %vtpm.26 = icmp eq %Main* %self, null
  br i1 %vtpm.26, label %abort, label %ok.0

ok.0:                                             ; preds = %0
  %vtpm.27 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.28 = load %_Main_vtable*, %_Main_vtable** %vtpm.27, align 8
  %vtpm.33 = bitcast %Main* %self to %Object*
  %vtpm.34 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.28, i64 0, i32 5
  %tmp.0 = load %String* (%Object*)*, %String* (%Object*)** %vtpm.34, align 8
  %vtpm.35 = tail call %String* %tmp.0(%Object* nonnull %vtpm.33)
  %vtpm.36 = bitcast %Main* %self to %IO*
  %vtpm.37 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.28, i64 0, i32 7
  %tmp.1 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.37, align 8
  %vtpm.38 = tail call %IO* %tmp.1(%IO* nonnull %vtpm.36, %String* %vtpm.35)
  %vtpm.42 = load %_Main_vtable*, %_Main_vtable** %vtpm.27, align 8
  %vtpm.44 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.42, i64 0, i32 8
  %tmp.2 = load %IO* (%IO*, i32)*, %IO* (%IO*, i32)** %vtpm.44, align 8
  %vtpm.45 = tail call %IO* %tmp.2(%IO* nonnull %vtpm.36, i32 879)
  %vtpm.49 = load %_Main_vtable*, %_Main_vtable** %vtpm.27, align 8
  %vtpm.55 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.49, i64 0, i32 5
  %tmp.3 = load %String* (%Object*)*, %String* (%Object*)** %vtpm.55, align 8
  %vtpm.56 = tail call %String* %tmp.3(%Object* nonnull %vtpm.33)
  %vtpm.57 = icmp eq %String* %vtpm.56, null
  br i1 %vtpm.57, label %abort, label %ok.5

ok.5:                                             ; preds = %ok.0
  %vtpm.58 = getelementptr %String, %String* %vtpm.56, i64 0, i32 0
  %vtpm.59 = load %_String_vtable*, %_String_vtable** %vtpm.58, align 8
  %vtpm.60 = getelementptr %_String_vtable, %_String_vtable* %vtpm.59, i64 0, i32 8
  %tmp.4 = load %String* (%String*, %String*)*, %String* (%String*, %String*)** %vtpm.60, align 8
  %vtpm.61 = tail call %String* %tmp.4(%String* nonnull %vtpm.56, %String* nonnull @String.1)
  %vtpm.63 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.49, i64 0, i32 7
  %tmp.5 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.63, align 8
  %vtpm.64 = tail call %IO* %tmp.5(%IO* nonnull %vtpm.36, %String* %vtpm.61)
  %vtpm.68 = load %_Main_vtable*, %_Main_vtable** %vtpm.27, align 8
  %vtpm.74 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.68, i64 0, i32 5
  %tmp.6 = load %String* (%Object*)*, %String* (%Object*)** %vtpm.74, align 8
  %vtpm.75 = tail call %String* %tmp.6(%Object* nonnull %vtpm.33)
  %vtpm.76 = icmp eq %String* %vtpm.75, null
  br i1 %vtpm.76, label %abort, label %ok.8

ok.8:                                             ; preds = %ok.5
  %vtpm.77 = getelementptr %String, %String* %vtpm.75, i64 0, i32 0
  %vtpm.78 = load %_String_vtable*, %_String_vtable** %vtpm.77, align 8
  %vtpm.79 = getelementptr %_String_vtable, %_String_vtable* %vtpm.78, i64 0, i32 7
  %tmp.7 = load i32 (%String*)*, i32 (%String*)** %vtpm.79, align 8
  %vtpm.80 = tail call i32 %tmp.7(%String* nonnull %vtpm.75)
  %vtpm.82 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.68, i64 0, i32 8
  %tmp.8 = load %IO* (%IO*, i32)*, %IO* (%IO*, i32)** %vtpm.82, align 8
  %vtpm.83 = tail call %IO* %tmp.8(%IO* nonnull %vtpm.36, i32 %vtpm.80)
  %vtpm.87 = load %_Main_vtable*, %_Main_vtable** %vtpm.27, align 8
  %vtpm.93 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.87, i64 0, i32 5
  %tmp.9 = load %String* (%Object*)*, %String* (%Object*)** %vtpm.93, align 8
  %vtpm.94 = tail call %String* %tmp.9(%Object* nonnull %vtpm.33)
  %vtpm.95 = icmp eq %String* %vtpm.94, null
  br i1 %vtpm.95, label %abort, label %ok.11

ok.11:                                            ; preds = %ok.8
  %vtpm.96 = getelementptr %String, %String* %vtpm.94, i64 0, i32 0
  %vtpm.97 = load %_String_vtable*, %_String_vtable** %vtpm.96, align 8
  %vtpm.98 = getelementptr %_String_vtable, %_String_vtable* %vtpm.97, i64 0, i32 9
  %tmp.10 = load %String* (%String*, i32, i32)*, %String* (%String*, i32, i32)** %vtpm.98, align 8
  %vtpm.99 = tail call %String* %tmp.10(%String* nonnull %vtpm.94, i32 2, i32 2)
  %vtpm.101 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.87, i64 0, i32 7
  %tmp.11 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.101, align 8
  %vtpm.102 = tail call %IO* %tmp.11(%IO* nonnull %vtpm.36, %String* %vtpm.99)
  ret %Object* %vtpm.33

abort:                                            ; preds = %ok.8, %ok.5, %ok.0, %0
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.109 = tail call i8* @malloc(i32 8)
  %vtpm.111 = icmp eq i8* %vtpm.109, null
  br i1 %vtpm.111, label %abort, label %ok.12

ok.12:                                            ; preds = %entry
  %vtpm.110 = bitcast i8* %vtpm.109 to %Main*
  %vtpm.112 = bitcast i8* %vtpm.109 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.112, align 8
  ret %Main* %vtpm.110

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
