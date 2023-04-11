; ModuleID = 'test2-m2r.bc'
source_filename = "test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"A[i] is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  br label %7

7:                                                ; preds = %19, %6
  %.01 = phi i32 [ 0, %6 ], [ %20, %19 ]
  %8 = icmp slt i32 %.01, %5
  br i1 %8, label %9, label %21

9:                                                ; preds = %7
  %10 = add nsw i32 %0, %2
  %11 = mul nsw i32 %0, %10
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds i32, ptr %4, i64 %12
  store i32 %11, ptr %13, align 4
  %14 = add nsw i32 %1, %3
  %15 = mul nsw i32 %1, %14
  %16 = add nsw i32 %.01, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %4, i64 %17
  store i32 %15, ptr %18, align 4
  br label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %.01, 2
  br label %7, !llvm.loop !6

21:                                               ; preds = %7
  br label %22

22:                                               ; preds = %29, %21
  %.0 = phi i32 [ 0, %21 ], [ %30, %29 ]
  %23 = icmp slt i32 %.0, %5
  br i1 %23, label %24, label %31

24:                                               ; preds = %22
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds i32, ptr %4, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %27)
  br label %29

29:                                               ; preds = %24
  %30 = add nsw i32 %.0, 1
  br label %22, !llvm.loop !8

31:                                               ; preds = %22
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @malloc(i64 noundef 40) #3
  call void @foo(i32 noundef 2, i32 noundef 3, i32 noundef 1, i32 noundef 7, ptr noundef %1, i32 noundef 10)
  ret i32 0
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) }

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
