; ModuleID = 'hard.ll'
source_filename = "hard.ll"

@main.printout.str = internal constant [25 x i8] c"Main.main() returned %d\0A\00"

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #0

; Function Attrs: nofree norecurse nosync nounwind readnone
define i32 @Main.main() local_unnamed_addr #1 {
entry:
  ret i32 -1009
}

; Function Attrs: nofree nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %vtpm.9 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([25 x i8], [25 x i8]* @main.printout.str, i64 0, i64 0), i32 -1009)
  ret i32 0
}

attributes #0 = { nofree nounwind }
attributes #1 = { nofree norecurse nosync nounwind readnone }
