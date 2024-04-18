; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@val = global i64 3203383023, align 4096
@val2 = global i64 19088743, align 4096
@array = internal global [131072 x i8] zeroinitializer, align 2048
@array2 = internal global [131072 x i8] zeroinitializer, align 2048
@array_ctx = global ptr null, align 8
@array2_ctx = global [131072 x ptr] zeroinitializer, align 8
@arr_context = global ptr null, align 2048
@val_context = global ptr null, align 2048
@val2_context = global ptr null, align 2048
@leakValue.cache_hits = internal global [131072 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@time1 = global i64 0, align 8
@time2 = global i64 0, align 8
@secret_context = global ptr null, align 2048
@is_public_context = global ptr null, align 2048
@training_offset = global i64 0, align 8
@timestamp = external global i64, align 8
@llvm.used = appending global [1 x ptr] [ptr @victim_function], section "llvm.metadata"

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @victim_function(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i8, ptr getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 1024), align 1024
  %8 = zext i8 %7 to i32
  %9 = icmp slt i32 %6, %8
  br i1 %9, label %10, label %18

10:                                               ; preds = %2
  %11 = load i8, ptr getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 3072), align 1024
  %12 = zext i8 %11 to i32
  store i32 %12, ptr %5, align 4
  %13 = load i32, ptr %5, align 4
  %14 = trunc i32 %13 to i8
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [131072 x i8], ptr @array2, i64 0, i64 %16
  store i8 %14, ptr %17, align 1
  br label %18

18:                                               ; preds = %10, %2
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @setup() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %11, %0
  %4 = load i32, ptr %1, align 4
  %5 = sext i32 %4 to i64
  %6 = icmp ult i64 %5, 131072
  br i1 %6, label %7, label %14

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [131072 x i8], ptr @array, i64 0, i64 %9
  store i8 0, ptr %10, align 1
  br label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %1, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %1, align 4
  br label %3, !llvm.loop !6

14:                                               ; preds = %3
  store i8 10, ptr getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 1024), align 1024
  store i32 0, ptr %2, align 4
  br label %15

15:                                               ; preds = %26, %14
  %16 = load i32, ptr %2, align 4
  %17 = icmp slt i32 %16, 131072
  br i1 %17, label %18, label %29

18:                                               ; preds = %15
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [131072 x i8], ptr @array2, i64 0, i64 %20
  %22 = call ptr @cache_remove_prepare(ptr noundef %21)
  %23 = load i32, ptr %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [131072 x ptr], ptr @array2_ctx, i64 0, i64 %24
  store ptr %22, ptr %25, align 8
  br label %26

26:                                               ; preds = %18
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %2, align 4
  br label %15, !llvm.loop !8

29:                                               ; preds = %15
  %30 = call ptr @cache_remove_prepare(ptr noundef getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 1024))
  store ptr %30, ptr @arr_context, align 2048
  %31 = call ptr @cache_remove_prepare(ptr noundef @val)
  store ptr %31, ptr @val_context, align 2048
  %32 = call ptr @cache_remove_prepare(ptr noundef @val2)
  store ptr %32, ptr @val2_context, align 2048
  ret void
}

declare ptr @cache_remove_prepare(ptr noundef) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @leakValue(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %13

13:                                               ; preds = %20, %1
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 131072
  br i1 %15, label %16, label %23

16:                                               ; preds = %13
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [131072 x i32], ptr @leakValue.cache_hits, i64 0, i64 %18
  store i32 0, ptr %19, align 4
  br label %20

20:                                               ; preds = %16
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %6, align 4
  br label %13, !llvm.loop !9

23:                                               ; preds = %13
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !10
  store i32 40, ptr %7, align 4
  br label %24

24:                                               ; preds = %49, %23
  %25 = load i32, ptr %7, align 4
  %26 = icmp sge i32 %25, 0
  br i1 %26, label %27, label %52

27:                                               ; preds = %24
  %28 = load i32, ptr %7, align 4
  %29 = icmp eq i32 %28, 0
  %30 = zext i1 %29 to i32
  %31 = mul nsw i32 %30, 10
  store i32 %31, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %32

32:                                               ; preds = %40, %27
  %33 = load i32, ptr %9, align 4
  %34 = icmp slt i32 %33, 131072
  br i1 %34, label %35, label %43

35:                                               ; preds = %32
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [131072 x ptr], ptr @array2_ctx, i64 0, i64 %37
  %39 = load ptr, ptr %38, align 8
  call void @cache_remove(ptr noundef %39)
  br label %40

40:                                               ; preds = %35
  %41 = load i32, ptr %9, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %9, align 4
  br label %32, !llvm.loop !11

43:                                               ; preds = %32
  %44 = load ptr, ptr @arr_context, align 2048
  call void @cache_remove(ptr noundef %44)
  %45 = load ptr, ptr @val_context, align 2048
  call void @cache_remove(ptr noundef %45)
  %46 = load ptr, ptr @val2_context, align 2048
  call void @cache_remove(ptr noundef %46)
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !12
  %47 = load i32, ptr %5, align 4
  %48 = load i32, ptr %8, align 4
  call void @victim_function(i32 noundef %47, i32 noundef %48)
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !13
  br label %49

49:                                               ; preds = %43
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, -1
  store i32 %51, ptr %7, align 4
  br label %24, !llvm.loop !14

52:                                               ; preds = %24
  store i64 0, ptr %11, align 8
  store i32 0, ptr %12, align 4
  br label %53

53:                                               ; preds = %83, %52
  %54 = load i32, ptr %12, align 4
  %55 = icmp slt i32 %54, 256
  br i1 %55, label %56, label %86

56:                                               ; preds = %53
  %57 = load i32, ptr %12, align 4
  %58 = mul nsw i32 %57, 128
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [131072 x i8], ptr @array2, i64 0, i64 %59
  store ptr %60, ptr %2, align 8
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !15
  %61 = load i64, ptr @timestamp, align 8
  store i64 %61, ptr %3, align 8
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !16
  %62 = load ptr, ptr %2, align 8
  call void asm sideeffect "LDR x10, [$0]", "r,~{x10},~{memory}"(ptr %62) #2, !srcloc !17
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !18
  %63 = load i64, ptr @timestamp, align 8
  store i64 %63, ptr %4, align 8
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !19
  %64 = load i64, ptr %4, align 8
  %65 = load i64, ptr %3, align 8
  %66 = sub i64 %64, %65
  store i64 %66, ptr %10, align 8
  %67 = load i64, ptr %10, align 8
  %68 = icmp ult i64 %67, 120
  br i1 %68, label %69, label %72

69:                                               ; preds = %56
  %70 = load i64, ptr %10, align 8
  %71 = icmp ne i64 %70, 0
  br label %72

72:                                               ; preds = %69, %56
  %73 = phi i1 [ false, %56 ], [ %71, %69 ]
  %74 = zext i1 %73 to i32
  %75 = load i32, ptr %12, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [131072 x i32], ptr @leakValue.cache_hits, i64 0, i64 %76
  store i32 %74, ptr %77, align 4
  %78 = load i32, ptr %12, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [131072 x i32], ptr @leakValue.cache_hits, i64 0, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %81)
  br label %83

83:                                               ; preds = %72
  %84 = load i32, ptr %12, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %12, align 4
  br label %53, !llvm.loop !20

86:                                               ; preds = %53
  %87 = load i64, ptr %11, align 8
  %88 = trunc i64 %87 to i32
  ret i32 %88
}

declare void @cache_remove(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @timer_start()
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @atoi(ptr noundef %9)
  store i32 %10, ptr %5, align 4
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !21
  call void @setup()
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #2, !srcloc !22
  %11 = load i32, ptr %5, align 4
  %12 = call i32 @leakValue(i32 noundef %11)
  store i32 %12, ptr %6, align 4
  %13 = load i32, ptr %6, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13)
  call void @timer_stop()
  ret i32 0
}

declare void @timer_start(...) #1

declare i32 @atoi(ptr noundef) #1

declare void @timer_stop(...) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 19.0.0git (https://github.com/llvm/llvm-project.git b074f25329501487e312b59e463a2d5f743090f8)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = !{i64 2151270299, i64 2151270308}
!11 = distinct !{!11, !7}
!12 = !{i64 2151270358, i64 2151270367}
!13 = !{i64 2151270406, i64 2151270415}
!14 = distinct !{!14, !7}
!15 = !{i64 2151231414, i64 2151231423}
!16 = !{i64 2151231482, i64 2151231491}
!17 = !{i64 2151231530}
!18 = !{i64 2151231613, i64 2151231622}
!19 = !{i64 2151231679, i64 2151231688}
!20 = distinct !{!20, !7}
!21 = !{i64 2151270458, i64 2151270467}
!22 = !{i64 2151270506, i64 2151270515}
