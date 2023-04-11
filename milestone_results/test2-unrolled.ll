; ModuleID = 'test2-unrolled.bc'
source_filename = "test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"A[i] is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  br label %7

7:                                                ; preds = %45, %6
  %.01 = phi i32 [ 0, %6 ], [ %55, %45 ]
  %8 = icmp slt i32 %.01, %5
  br i1 %8, label %9, label %56

9:                                                ; preds = %7
  %10 = add nsw i32 %0, %2
  %11 = mul nsw i32 %0, %10
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds i32, ptr %4, i64 %12
  store i32 %11, ptr %13, align 4
  %14 = add nsw i32 %1, %3
  %15 = mul nsw i32 %1, %14
  %16 = add nuw nsw i32 %.01, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %4, i64 %17
  store i32 %15, ptr %18, align 4
  %19 = add nuw nsw i32 %.01, 2
  %20 = icmp slt i32 %19, %5
  br i1 %20, label %21, label %56

21:                                               ; preds = %9
  %22 = add nsw i32 %0, %2
  %23 = mul nsw i32 %0, %22
  %24 = sext i32 %19 to i64
  %25 = getelementptr inbounds i32, ptr %4, i64 %24
  store i32 %23, ptr %25, align 4
  %26 = add nsw i32 %1, %3
  %27 = mul nsw i32 %1, %26
  %28 = add nuw nsw i32 %19, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %4, i64 %29
  store i32 %27, ptr %30, align 4
  %31 = add nuw nsw i32 %19, 2
  %32 = icmp slt i32 %31, %5
  br i1 %32, label %33, label %56

33:                                               ; preds = %21
  %34 = add nsw i32 %0, %2
  %35 = mul nsw i32 %0, %34
  %36 = sext i32 %31 to i64
  %37 = getelementptr inbounds i32, ptr %4, i64 %36
  store i32 %35, ptr %37, align 4
  %38 = add nsw i32 %1, %3
  %39 = mul nsw i32 %1, %38
  %40 = add nuw nsw i32 %31, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %4, i64 %41
  store i32 %39, ptr %42, align 4
  %43 = add nuw nsw i32 %31, 2
  %44 = icmp slt i32 %43, %5
  br i1 %44, label %45, label %56

45:                                               ; preds = %33
  %46 = add nsw i32 %0, %2
  %47 = mul nsw i32 %0, %46
  %48 = sext i32 %43 to i64
  %49 = getelementptr inbounds i32, ptr %4, i64 %48
  store i32 %47, ptr %49, align 4
  %50 = add nsw i32 %1, %3
  %51 = mul nsw i32 %1, %50
  %52 = add nuw nsw i32 %43, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %4, i64 %53
  store i32 %51, ptr %54, align 4
  %55 = add nsw i32 %43, 2
  br label %7, !llvm.loop !6

56:                                               ; preds = %33, %21, %9, %7
  br label %57

57:                                               ; preds = %80, %56
  %.0 = phi i32 [ 0, %56 ], [ %85, %80 ]
  %58 = icmp slt i32 %.0, %5
  br i1 %58, label %59, label %86

59:                                               ; preds = %57
  %60 = sext i32 %.0 to i64
  %61 = getelementptr inbounds i32, ptr %4, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %62)
  %64 = add nuw nsw i32 %.0, 1
  %65 = icmp slt i32 %64, %5
  br i1 %65, label %66, label %86

66:                                               ; preds = %59
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds i32, ptr %4, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %69)
  %71 = add nuw nsw i32 %64, 1
  %72 = icmp slt i32 %71, %5
  br i1 %72, label %73, label %86

73:                                               ; preds = %66
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds i32, ptr %4, i64 %74
  %76 = load i32, ptr %75, align 4
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %76)
  %78 = add nuw nsw i32 %71, 1
  %79 = icmp slt i32 %78, %5
  br i1 %79, label %80, label %86

80:                                               ; preds = %73
  %81 = sext i32 %78 to i64
  %82 = getelementptr inbounds i32, ptr %4, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %83)
  %85 = add nsw i32 %78, 1
  br label %57, !llvm.loop !8

86:                                               ; preds = %73, %66, %59, %57
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
