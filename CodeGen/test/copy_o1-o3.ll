; ModuleID = 'copy_o1.ll'
source_filename = "copy_o1.ll"

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
%_A_vtable = type { i32, i32, i8*, %A* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, %String* (%A*)* }
%A = type { %_A_vtable*, %String* }

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
@str.A = internal constant [2 x i8] c"A\00"
@_A_vtable_prototype = constant %_A_vtable { i32 6, i32 ptrtoint (%A* getelementptr (%A, %A* null, i32 1) to i32), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str.A, i32 0, i32 0), %A* ()* @A_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, %String* (%A*)* @A_getGreetings }
@str.1 = internal constant [8 x i8] c"Hello!\0A\00"
@String.1 = constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.1, i32 0, i32 0) }
@str.2 = internal constant [14 x i8] c"<basic class>\00"
@String.2 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.2, i32 0, i32 0) }
@str.0 = internal constant [11 x i8] c"copy_o1.cl\00"
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
  %vtpm.53.i = tail call i8* @malloc(i32 8)
  %vtpm.55.i = icmp eq i8* %vtpm.53.i, null
  br i1 %vtpm.55.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.56.i = bitcast i8* %vtpm.53.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.56.i, align 8
  %vtpm.75.i.i = tail call i8* @malloc(i32 16)
  %vtpm.77.i.i = icmp eq i8* %vtpm.75.i.i, null
  br i1 %vtpm.77.i.i, label %abort.i.i, label %A_new.exit.i

abort.i.i:                                        ; preds = %Main_new.exit
  tail call void @abort()
  unreachable

A_new.exit.i:                                     ; preds = %Main_new.exit
  %vtpm.78.i.i = bitcast i8* %vtpm.75.i.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.78.i.i, align 8
  %vtpm.79.i.i = getelementptr i8, i8* %vtpm.75.i.i, i64 8
  %0 = bitcast i8* %vtpm.79.i.i to %String**
  store %String* @String.1, %String** %0, align 8
  %vtpm.31.i = bitcast i8* %vtpm.75.i.i to %Object*
  %vtpm.33.i = tail call %Object* @Object_copy(%Object* nonnull %vtpm.31.i)
  %vtpm.40.i = icmp eq %Object* %vtpm.33.i, null
  br i1 %vtpm.40.i, label %abort.i1, label %Main_main.exit

abort.i1:                                         ; preds = %A_new.exit.i
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %A_new.exit.i
  %vtpm.34.i = bitcast %Object* %vtpm.33.i to %A*
  %vtpm.38.i = load %_Main_vtable*, %_Main_vtable** %vtpm.56.i, align 8
  %vtpm.41.i = bitcast %Object* %vtpm.33.i to %_A_vtable**
  %vtpm.42.i = load %_A_vtable*, %_A_vtable** %vtpm.41.i, align 8
  %vtpm.43.i = getelementptr %_A_vtable, %_A_vtable* %vtpm.42.i, i64 0, i32 7
  %tmp.3.i = load %String* (%A*)*, %String* (%A*)** %vtpm.43.i, align 8
  %vtpm.44.i = tail call %String* %tmp.3.i(%A* nonnull %vtpm.34.i)
  %vtpm.45.i = bitcast i8* %vtpm.53.i to %IO*
  %vtpm.46.i = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38.i, i64 0, i32 7
  %tmp.4.i = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.46.i, align 8
  %vtpm.47.i = tail call %IO* %tmp.4.i(%IO* nonnull %vtpm.45.i, %String* %vtpm.44.i)
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
ok.0:
  %vtpm.75.i = tail call i8* @malloc(i32 16)
  %vtpm.77.i = icmp eq i8* %vtpm.75.i, null
  br i1 %vtpm.77.i, label %abort.i, label %A_new.exit

abort.i:                                          ; preds = %ok.0
  tail call void @abort()
  unreachable

A_new.exit:                                       ; preds = %ok.0
  %vtpm.78.i = bitcast i8* %vtpm.75.i to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.78.i, align 8
  %vtpm.79.i = getelementptr i8, i8* %vtpm.75.i, i64 8
  %0 = bitcast i8* %vtpm.79.i to %String**
  store %String* @String.1, %String** %0, align 8
  %vtpm.31 = bitcast i8* %vtpm.75.i to %Object*
  %vtpm.33 = tail call %Object* @Object_copy(%Object* nonnull %vtpm.31)
  %vtpm.36 = icmp eq %Main* %self, null
  %vtpm.40 = icmp eq %Object* %vtpm.33, null
  %or.cond = select i1 %vtpm.36, i1 true, i1 %vtpm.40
  br i1 %or.cond, label %abort, label %ok.2

ok.2:                                             ; preds = %A_new.exit
  %vtpm.34 = bitcast %Object* %vtpm.33 to %A*
  %vtpm.37 = getelementptr %Main, %Main* %self, i64 0, i32 0
  %vtpm.38 = load %_Main_vtable*, %_Main_vtable** %vtpm.37, align 8
  %vtpm.41 = bitcast %Object* %vtpm.33 to %_A_vtable**
  %vtpm.42 = load %_A_vtable*, %_A_vtable** %vtpm.41, align 8
  %vtpm.43 = getelementptr %_A_vtable, %_A_vtable* %vtpm.42, i64 0, i32 7
  %tmp.3 = load %String* (%A*)*, %String* (%A*)** %vtpm.43, align 8
  %vtpm.44 = tail call %String* %tmp.3(%A* nonnull %vtpm.34)
  %vtpm.45 = bitcast %Main* %self to %IO*
  %vtpm.46 = getelementptr %_Main_vtable, %_Main_vtable* %vtpm.38, i64 0, i32 7
  %tmp.4 = load %IO* (%IO*, %String*)*, %IO* (%IO*, %String*)** %vtpm.46, align 8
  %vtpm.47 = tail call %IO* %tmp.4(%IO* nonnull %vtpm.45, %String* %vtpm.44)
  %vtpm.48 = bitcast %IO* %vtpm.47 to %Object*
  ret %Object* %vtpm.48

abort:                                            ; preds = %A_new.exit
  tail call void @abort()
  unreachable
}

define %Main* @Main_new() {
entry:
  %vtpm.53 = tail call i8* @malloc(i32 8)
  %vtpm.55 = icmp eq i8* %vtpm.53, null
  br i1 %vtpm.55, label %abort, label %ok.3

ok.3:                                             ; preds = %entry
  %vtpm.54 = bitcast i8* %vtpm.53 to %Main*
  %vtpm.56 = bitcast i8* %vtpm.53 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.56, align 8
  ret %Main* %vtpm.54

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Object* @A_abort(%A* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Object* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %String* @A_type_name(%A* nocapture readnone %self) local_unnamed_addr #0 {
  ret %String* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %A* @A_copy(%A* nocapture readnone %self) local_unnamed_addr #0 {
  ret %A* null
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define %String* @A_getGreetings(%A* nocapture readonly %self) #1 {
  %vtpm.69 = getelementptr %A, %A* %self, i64 0, i32 1
  %vtpm.70 = load %String*, %String** %vtpm.69, align 8
  ret %String* %vtpm.70
}

define %A* @A_new() {
entry:
  %vtpm.75 = tail call i8* @malloc(i32 16)
  %vtpm.77 = icmp eq i8* %vtpm.75, null
  br i1 %vtpm.77, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.76 = bitcast i8* %vtpm.75 to %A*
  %vtpm.78 = bitcast i8* %vtpm.75 to %_A_vtable**
  store %_A_vtable* @_A_vtable_prototype, %_A_vtable** %vtpm.78, align 8
  %vtpm.79 = getelementptr i8, i8* %vtpm.75, i64 8
  %0 = bitcast i8* %vtpm.79 to %String**
  store %String* @String.1, %String** %0, align 8
  ret %A* %vtpm.76

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn }
