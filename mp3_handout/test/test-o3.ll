; ModuleID = 'test.ll'
source_filename = "test.ll"

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
%_Toy_vtable = type { i32, i32, i8*, %Toy* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, i32 (%Toy*, i32, i32)* }
%Toy = type { %_Toy_vtable* }
%_Bear_vtable = type { i32, i32, i8*, %Bear* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, i32 (%Toy*, i32, i32)*, i32 (%Bear*, i32, i32)* }
%Bear = type { %_Bear_vtable*, i32, i32, i32 }
%_Main_vtable = type { i32, i32, i8*, %Main* ()*, %Object* (%Object*)*, %String* (%Object*)*, %Object* (%Object*)*, i32 (%Main*)* }
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
@str.Toy = internal constant [4 x i8] c"Toy\00"
@_Toy_vtable_prototype = constant %_Toy_vtable { i32 5, i32 ptrtoint (%Toy* getelementptr (%Toy, %Toy* null, i32 1) to i32), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.Toy, i32 0, i32 0), %Toy* ()* @Toy_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, i32 (%Toy*, i32, i32)* @Toy_play }
@str.Bear = internal constant [5 x i8] c"Bear\00"
@_Bear_vtable_prototype = constant %_Bear_vtable { i32 6, i32 ptrtoint (%Bear* getelementptr (%Bear, %Bear* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bear, i32 0, i32 0), %Bear* ()* @Bear_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, i32 (%Toy*, i32, i32)* @Toy_play, i32 (%Bear*, i32, i32)* @Bear_eat }
@str.Main = internal constant [5 x i8] c"Main\00"
@_Main_vtable_prototype = constant %_Main_vtable { i32 7, i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0), %Main* ()* @Main_new, %Object* (%Object*)* @Object_abort, %String* (%Object*)* @Object_type_name, %Object* (%Object*)* @Object_copy, i32 (%Main*)* @Main_main }
@str.1 = internal constant [14 x i8] c"<basic class>\00"
@String.1 = local_unnamed_addr constant %String { %_String_vtable* @_String_vtable_prototype, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str.1, i32 0, i32 0) }
@str.0 = internal constant [8 x i8] c"test.cl\00"
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

declare %Bool* @Bool_new()

define i32 @main() local_unnamed_addr {
entry:
  %vtpm.85.i = tail call i8* @malloc(i32 8)
  %vtpm.87.i = icmp eq i8* %vtpm.85.i, null
  br i1 %vtpm.87.i, label %abort.i, label %Main_new.exit

abort.i:                                          ; preds = %entry
  tail call void @abort()
  unreachable

Main_new.exit:                                    ; preds = %entry
  %vtpm.88.i = bitcast i8* %vtpm.85.i to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.88.i, align 8
  %vtpm.21.i.i = tail call i8* @malloc(i32 8)
  %vtpm.23.i.i = icmp eq i8* %vtpm.21.i.i, null
  br i1 %vtpm.23.i.i, label %abort.i.i, label %Main_main.exit

abort.i.i:                                        ; preds = %Main_new.exit
  tail call void @abort()
  unreachable

Main_main.exit:                                   ; preds = %Main_new.exit
  %vtpm.24.i.i = bitcast i8* %vtpm.21.i.i to %_Toy_vtable**
  store %_Toy_vtable* @_Toy_vtable_prototype, %_Toy_vtable** %vtpm.24.i.i, align 8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Object* @Toy_abort(%Toy* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Object* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %String* @Toy_type_name(%Toy* nocapture readnone %self) local_unnamed_addr #0 {
  ret %String* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Toy* @Toy_copy(%Toy* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Toy* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Toy_play(%Toy* nocapture readnone %self, i32 %x, i32 %y) #0 {
  %vtpm.16 = add i32 %y, %x
  ret i32 %vtpm.16
}

define %Toy* @Toy_new() {
entry:
  %vtpm.21 = tail call i8* @malloc(i32 8)
  %vtpm.23 = icmp eq i8* %vtpm.21, null
  br i1 %vtpm.23, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.22 = bitcast i8* %vtpm.21 to %Toy*
  %vtpm.24 = bitcast i8* %vtpm.21 to %_Toy_vtable**
  store %_Toy_vtable* @_Toy_vtable_prototype, %_Toy_vtable** %vtpm.24, align 8
  ret %Toy* %vtpm.22

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Object* @Bear_abort(%Bear* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Object* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %String* @Bear_type_name(%Bear* nocapture readnone %self) local_unnamed_addr #0 {
  ret %String* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define noalias %Bear* @Bear_copy(%Bear* nocapture readnone %self) local_unnamed_addr #0 {
  ret %Bear* null
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn
define i32 @Bear_play(%Bear* nocapture readnone %self, i32 %x, i32 %y) local_unnamed_addr #0 {
  %vtpm.40 = add i32 %y, %x
  ret i32 %vtpm.40
}

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn
define i32 @Bear_eat(%Bear* nocapture readonly %self, i32 %x, i32 %y) #1 {
  %vtpm.46 = getelementptr %Bear, %Bear* %self, i64 0, i32 1
  %vtpm.47 = load i32, i32* %vtpm.46, align 4
  %vtpm.49 = add i32 %y, %x
  %vtpm.51 = add i32 %vtpm.49, %vtpm.47
  ret i32 %vtpm.51
}

define %Bear* @Bear_new() {
entry:
  %vtpm.56 = tail call i8* @malloc(i32 24)
  %vtpm.58 = icmp eq i8* %vtpm.56, null
  br i1 %vtpm.58, label %abort, label %ok.0

ok.0:                                             ; preds = %entry
  %vtpm.57 = bitcast i8* %vtpm.56 to %Bear*
  %vtpm.59 = bitcast i8* %vtpm.56 to %_Bear_vtable**
  store %_Bear_vtable* @_Bear_vtable_prototype, %_Bear_vtable** %vtpm.59, align 8
  %vtpm.60 = getelementptr i8, i8* %vtpm.56, i64 8
  %0 = bitcast i8* %vtpm.60 to i32*
  store i32 1, i32* %0, align 4
  %vtpm.61 = getelementptr i8, i8* %vtpm.56, i64 12
  %1 = bitcast i8* %vtpm.61 to i32*
  store i32 2, i32* %1, align 4
  %vtpm.62 = getelementptr i8, i8* %vtpm.56, i64 16
  %2 = bitcast i8* %vtpm.62 to i32*
  store i32 0, i32* %2, align 4
  ret %Bear* %vtpm.57

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
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

define i32 @Main_main(%Main* nocapture readnone %self) {
ok.0:
  %vtpm.21.i = tail call i8* @malloc(i32 8)
  %vtpm.23.i = icmp eq i8* %vtpm.21.i, null
  br i1 %vtpm.23.i, label %abort.i, label %Toy_new.exit

abort.i:                                          ; preds = %ok.0
  tail call void @abort()
  unreachable

Toy_new.exit:                                     ; preds = %ok.0
  %vtpm.24.i = bitcast i8* %vtpm.21.i to %_Toy_vtable**
  store %_Toy_vtable* @_Toy_vtable_prototype, %_Toy_vtable** %vtpm.24.i, align 8
  ret i32 3
}

define %Main* @Main_new() {
entry:
  %vtpm.85 = tail call i8* @malloc(i32 8)
  %vtpm.87 = icmp eq i8* %vtpm.85, null
  br i1 %vtpm.87, label %abort, label %ok.1

ok.1:                                             ; preds = %entry
  %vtpm.86 = bitcast i8* %vtpm.85 to %Main*
  %vtpm.88 = bitcast i8* %vtpm.85 to %_Main_vtable**
  store %_Main_vtable* @_Main_vtable_prototype, %_Main_vtable** %vtpm.88, align 8
  ret %Main* %vtpm.86

abort:                                            ; preds = %entry
  tail call void @abort()
  unreachable
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly willreturn }
