; ModuleID = 'test1-unrolled.bc'
source_filename = "test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"A[i] is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [4 x i32], align 16
  br label %2

2:                                                ; preds = %10, %0
  %.01 = phi i32 [ 0, %0 ], [ %13, %10 ]
  %3 = sext i32 %.01 to i64
  %4 = getelementptr inbounds [4 x i32], ptr %1, i64 0, i64 %3
  store i32 %.01, ptr %4, align 4
  %5 = add nuw nsw i32 %.01, 1
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [4 x i32], ptr %1, i64 0, i64 %6
  store i32 %5, ptr %7, align 4
  %8 = add nuw nsw i32 %5, 1
  %9 = icmp ult i32 %8, 5
  br i1 %9, label %10, label %14

10:                                               ; preds = %2
  %11 = sext i32 %8 to i64
  %12 = getelementptr inbounds [4 x i32], ptr %1, i64 0, i64 %11
  store i32 %8, ptr %12, align 4
  %13 = add nuw nsw i32 %8, 1
  br label %2, !llvm.loop !6

14:                                               ; preds = %2, %26
  %.0 = phi i32 [ %31, %26 ], [ 0, %2 ]
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [4 x i32], ptr %1, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %17)
  %19 = add nuw nsw i32 %.0, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [4 x i32], ptr %1, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %22)
  %24 = add nuw nsw i32 %19, 1
  %25 = icmp ult i32 %24, 5
  br i1 %25, label %26, label %32

26:                                               ; preds = %14
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds [4 x i32], ptr %1, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %29)
  %31 = add nuw nsw i32 %24, 1
  br label %14, !llvm.loop !8

32:                                               ; preds = %14
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
