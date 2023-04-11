; ModuleID = 'test2-slp.bc'
source_filename = "test2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"A[i] is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @foo(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = insertelement <2 x i32> poison, i32 %0, i32 0
  %8 = insertelement <2 x i32> %7, i32 %1, i32 1
  %9 = insertelement <2 x i32> poison, i32 %0, i32 0
  %10 = insertelement <2 x i32> %9, i32 %1, i32 1
  %11 = insertelement <2 x i32> poison, i32 %2, i32 0
  %12 = insertelement <2 x i32> %11, i32 %3, i32 1
  %13 = insertelement <2 x i32> poison, i32 %0, i32 0
  %14 = insertelement <2 x i32> %13, i32 %1, i32 1
  %15 = insertelement <2 x i32> poison, i32 %0, i32 0
  %16 = insertelement <2 x i32> %15, i32 %1, i32 1
  %17 = insertelement <2 x i32> poison, i32 %2, i32 0
  %18 = insertelement <2 x i32> %17, i32 %3, i32 1
  %19 = insertelement <2 x i32> poison, i32 %0, i32 0
  %20 = insertelement <2 x i32> %19, i32 %1, i32 1
  %21 = insertelement <2 x i32> poison, i32 %0, i32 0
  %22 = insertelement <2 x i32> %21, i32 %1, i32 1
  %23 = insertelement <2 x i32> poison, i32 %2, i32 0
  %24 = insertelement <2 x i32> %23, i32 %3, i32 1
  %25 = insertelement <2 x i32> poison, i32 %0, i32 0
  %26 = insertelement <2 x i32> %25, i32 %1, i32 1
  %27 = insertelement <2 x i32> poison, i32 %0, i32 0
  %28 = insertelement <2 x i32> %27, i32 %1, i32 1
  %29 = insertelement <2 x i32> poison, i32 %2, i32 0
  %30 = insertelement <2 x i32> %29, i32 %3, i32 1
  br label %31

31:                                               ; preds = %54, %6
  %.01 = phi i32 [ 0, %6 ], [ %59, %54 ]
  %32 = icmp slt i32 %.01, %5
  br i1 %32, label %33, label %60

33:                                               ; preds = %31
  %34 = add nsw <2 x i32> %28, %30
  %35 = sext i32 %.01 to i64
  %36 = getelementptr inbounds i32, ptr %4, i64 %35
  %37 = mul nsw <2 x i32> %26, %34
  store <2 x i32> %37, ptr %36, align 4
  %38 = add nuw nsw i32 %.01, 2
  %39 = icmp slt i32 %38, %5
  br i1 %39, label %40, label %60

40:                                               ; preds = %33
  %41 = add nsw <2 x i32> %22, %24
  %42 = sext i32 %38 to i64
  %43 = getelementptr inbounds i32, ptr %4, i64 %42
  %44 = mul nsw <2 x i32> %20, %41
  store <2 x i32> %44, ptr %43, align 4
  %45 = add nuw nsw i32 %38, 2
  %46 = icmp slt i32 %45, %5
  br i1 %46, label %47, label %60

47:                                               ; preds = %40
  %48 = add nsw <2 x i32> %16, %18
  %49 = sext i32 %45 to i64
  %50 = getelementptr inbounds i32, ptr %4, i64 %49
  %51 = mul nsw <2 x i32> %14, %48
  store <2 x i32> %51, ptr %50, align 4
  %52 = add nuw nsw i32 %45, 2
  %53 = icmp slt i32 %52, %5
  br i1 %53, label %54, label %60

54:                                               ; preds = %47
  %55 = add nsw <2 x i32> %10, %12
  %56 = sext i32 %52 to i64
  %57 = getelementptr inbounds i32, ptr %4, i64 %56
  %58 = mul nsw <2 x i32> %8, %55
  store <2 x i32> %58, ptr %57, align 4
  %59 = add nsw i32 %52, 2
  br label %31, !llvm.loop !6

60:                                               ; preds = %47, %40, %33, %31
  br label %61

61:                                               ; preds = %84, %60
  %.0 = phi i32 [ 0, %60 ], [ %89, %84 ]
  %62 = icmp slt i32 %.0, %5
  br i1 %62, label %63, label %90

63:                                               ; preds = %61
  %64 = sext i32 %.0 to i64
  %65 = getelementptr inbounds i32, ptr %4, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %66)
  %68 = add nuw nsw i32 %.0, 1
  %69 = icmp slt i32 %68, %5
  br i1 %69, label %70, label %90

70:                                               ; preds = %63
  %71 = sext i32 %68 to i64
  %72 = getelementptr inbounds i32, ptr %4, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %73)
  %75 = add nuw nsw i32 %68, 1
  %76 = icmp slt i32 %75, %5
  br i1 %76, label %77, label %90

77:                                               ; preds = %70
  %78 = sext i32 %75 to i64
  %79 = getelementptr inbounds i32, ptr %4, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %80)
  %82 = add nuw nsw i32 %75, 1
  %83 = icmp slt i32 %82, %5
  br i1 %83, label %84, label %90

84:                                               ; preds = %77
  %85 = sext i32 %82 to i64
  %86 = getelementptr inbounds i32, ptr %4, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %87)
  %89 = add nsw i32 %82, 1
  br label %61, !llvm.loop !8

90:                                               ; preds = %77, %70, %63, %61
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
