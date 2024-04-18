; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@global_variable = global i64 3203383023, align 2048
@secret = global i32 -559039810, align 2048
@array = internal global [131072 x i8] zeroinitializer, align 2048
@array_ctx = global ptr null, align 8
@arr_context = global ptr null, align 2048
@global_variable_context = global ptr null, align 2048
@secret_context = global ptr null, align 2048
@.str = private unnamed_addr constant [7 x i8] c"%3lld \00", align 1
@training_offset = global i64 0, align 8
@timestamp = external global i64, align 8

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @victim_function(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  %11 = load i8, ptr getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 1024), align 1024
  %12 = zext i8 %11 to i32
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %39

14:                                               ; preds = %3
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  %17 = ashr i32 %15, %16
  %18 = and i32 %17, 1
  %19 = mul nsw i32 %18, 0
  %20 = sext i32 %19 to i64
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %5, align 4
  %23 = ashr i32 %21, %22
  %24 = and i32 %23, 1
  %25 = icmp ne i32 %24, 0
  %26 = xor i1 %25, true
  %27 = zext i1 %26 to i32
  %28 = sext i32 %27 to i64
  %29 = mul nsw i64 %28, 4748437441418039
  %30 = add nsw i64 %20, %29
  store i64 %30, ptr %7, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 1 %7, i64 8, i1 false)
  %31 = load double, ptr %8, align 8
  %32 = load double, ptr %8, align 8
  %33 = fmul double %31, %32
  store double %33, ptr %8, align 8
  %34 = load double, ptr %8, align 8
  call void asm sideeffect "fmov d0, ${0:x}", "r"(double %34) #4, !srcloc !6
  call void asm sideeffect ".rept 43\0A\09fsqrt d0, d0\0A\09fmul d0, d0, d0\0A\09.endr\0A\09", ""() #4, !srcloc !7
  %35 = call double asm sideeffect "fmov $0, d0", "=r"() #4, !srcloc !8
  store double %35, ptr %8, align 8
  %36 = load double, ptr %8, align 8
  %37 = call i64 asm sideeffect "mov $0, $1", "=r,r"(double %36) #4, !srcloc !9
  store i64 %37, ptr %7, align 8
  store ptr @global_variable, ptr %9, align 8
  %38 = load ptr, ptr %9, align 8
  call void asm sideeffect "LDR x10, [$0]", "r,~{x10},~{memory}"(ptr %38) #4, !srcloc !10
  br label %39

39:                                               ; preds = %14, %3
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @setup() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %10, %0
  %3 = load i32, ptr %1, align 4
  %4 = sext i32 %3 to i64
  %5 = icmp ult i64 %4, 131072
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [131072 x i8], ptr @array, i64 0, i64 %8
  store i8 0, ptr %9, align 1
  br label %10

10:                                               ; preds = %6
  %11 = load i32, ptr %1, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %1, align 4
  br label %2, !llvm.loop !11

13:                                               ; preds = %2
  store i8 10, ptr getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 1024), align 1024
  %14 = call ptr @cache_remove_prepare(ptr noundef getelementptr inbounds ([131072 x i8], ptr @array, i64 0, i64 1024))
  store ptr %14, ptr @arr_context, align 2048
  %15 = call ptr @cache_remove_prepare(ptr noundef @global_variable)
  store ptr %15, ptr @global_variable_context, align 2048
  %16 = call ptr @cache_remove_prepare(ptr noundef @secret)
  store ptr %16, ptr @secret_context, align 2048
  ret void
}

declare ptr @cache_remove_prepare(ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @leakValue(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i32 %0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !13
  store i32 300, ptr %7, align 4
  br label %10

10:                                               ; preds = %25, %1
  %11 = load i32, ptr %7, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %28

13:                                               ; preds = %10
  %14 = load i32, ptr %7, align 4
  %15 = icmp eq i32 %14, 0
  %16 = zext i1 %15 to i32
  %17 = mul nsw i32 %16, 100
  store i32 %17, ptr %8, align 4
  %18 = load ptr, ptr @arr_context, align 2048
  call void @cache_remove(ptr noundef %18)
  %19 = load ptr, ptr @global_variable_context, align 2048
  call void @cache_remove(ptr noundef %19)
  %20 = load ptr, ptr @arr_context, align 2048
  call void @cache_remove(ptr noundef %20)
  %21 = load ptr, ptr @global_variable_context, align 2048
  call void @cache_remove(ptr noundef %21)
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !14
  %22 = load i32, ptr @secret, align 2048
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %8, align 4
  call void @victim_function(i32 noundef %22, i32 noundef %23, i32 noundef %24)
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !15
  br label %25

25:                                               ; preds = %13
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr %7, align 4
  br label %10, !llvm.loop !16

28:                                               ; preds = %10
  store ptr @global_variable, ptr %2, align 8
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !17
  %29 = load i64, ptr @timestamp, align 8
  store i64 %29, ptr %3, align 8
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !18
  %30 = load ptr, ptr %2, align 8
  call void asm sideeffect "LDR x10, [$0]", "r,~{x10},~{memory}"(ptr %30) #4, !srcloc !19
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !20
  %31 = load i64, ptr @timestamp, align 8
  store i64 %31, ptr %4, align 8
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !21
  %32 = load i64, ptr %4, align 8
  %33 = load i64, ptr %3, align 8
  %34 = sub i64 %32, %33
  store i64 %34, ptr %9, align 8
  %35 = load i64, ptr %9, align 8
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = add i64 %37, %35
  %39 = trunc i64 %38 to i32
  store i32 %39, ptr %6, align 4
  %40 = load i32, ptr %6, align 4
  ret i32 %40
}

declare void @cache_remove(ptr noundef) #2

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [32 x i64], align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  call void @timer_start()
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 @atoi(ptr noundef %12)
  store i32 %13, ptr @secret, align 2048
  store i32 0, ptr %6, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 256, i1 false)
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !22
  call void @setup()
  call void asm sideeffect "DMB SY\0AISB SY", "~{memory}"() #4, !srcloc !23
  store volatile i32 0, ptr %8, align 4
  br label %14

14:                                               ; preds = %24, %2
  %15 = load volatile i32, ptr %8, align 4
  %16 = icmp slt i32 %15, 32
  br i1 %16, label %17, label %27

17:                                               ; preds = %14
  %18 = load volatile i32, ptr %8, align 4
  %19 = call i32 @leakValue(i32 noundef %18)
  %20 = sext i32 %19 to i64
  %21 = load volatile i32, ptr %8, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [32 x i64], ptr %7, i64 0, i64 %22
  store i64 %20, ptr %23, align 8
  br label %24

24:                                               ; preds = %17
  %25 = load volatile i32, ptr %8, align 4
  %26 = add nsw i32 %25, 1
  store volatile i32 %26, ptr %8, align 4
  br label %14, !llvm.loop !24

27:                                               ; preds = %14
  store i32 0, ptr %9, align 4
  br label %28

28:                                               ; preds = %37, %27
  %29 = load i32, ptr %9, align 4
  %30 = icmp slt i32 %29, 32
  br i1 %30, label %31, label %40

31:                                               ; preds = %28
  %32 = load i32, ptr %9, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [32 x i64], ptr %7, i64 0, i64 %33
  %35 = load i64, ptr %34, align 8
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %35)
  br label %37

37:                                               ; preds = %31
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %9, align 4
  br label %28, !llvm.loop !25

40:                                               ; preds = %28
  call void @timer_stop()
  %41 = load i32, ptr %3, align 4
  ret i32 %41
}

declare void @timer_start(...) #2

declare i32 @atoi(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #2

declare void @timer_stop(...) #2

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"clang version 19.0.0git (https://github.com/llvm/llvm-project.git b074f25329501487e312b59e463a2d5f743090f8)"}
!6 = !{i64 1234}
!7 = !{i64 1301, i64 1312, i64 1345, i64 1381, i64 1405}
!8 = !{i64 1451}
!9 = !{i64 1513}
!10 = !{i64 2151268080}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{i64 2151268194, i64 2151268203}
!14 = !{i64 2151268246, i64 2151268255}
!15 = !{i64 2151268294, i64 2151268303}
!16 = distinct !{!16, !12}
!17 = !{i64 2151229071, i64 2151229080}
!18 = !{i64 2151229139, i64 2151229148}
!19 = !{i64 2151229187}
!20 = !{i64 2151229270, i64 2151229279}
!21 = !{i64 2151229336, i64 2151229345}
!22 = !{i64 2151268342, i64 2151268351}
!23 = !{i64 2151268390, i64 2151268399}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12}
