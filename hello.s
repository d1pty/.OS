.file	"hello.c"                       ; Исходный файл "hello.c"
.globl	n                               ; Обьявление переменной "n"
.data
.align 4
.type	n, @object
.size	n, 4                            ; Для переменной "n" выделяется 4 байта
n:
	.long	10                      ; Мнициализация переменной "n" со значением 10
.section	.rodata
.LC0:                                   ; Метка на строку "Hello World"
	.string	"Hello World"
.LC1:                                   ; Метка для строки "fact of %i is %i\n"
	.string	"fact of %i is %i\n"
.text
.globl	main
.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx           ; Загрузка адреса стека в регистр ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp              ; Выравнивание стека
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp              ; Копирование значения стека в ebp
	pushl	%ecx                    ; Сохранение значения регистра ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp                ; Выделение места на стеке для переменной
	subl	$12, %esp               ; Выделение места на стеке для  переменной
	pushl	$.LC0                   ; Помещение строки .LC0 в стек
	call	puts                    ; Вызов функции puts
	addl	$16, %esp               ; Освобождение места на стеке
	movl	n, %eax                 ; перенос переменной n в регистр eax
	subl	$12, %esp               ; Выделение места на стеке для  переменной
	pushl	%eax                    ; перенос переменной n в стек
	call	fact                    ; Вызов функции fact
	addl	$16, %esp               ; Освобождение места на стеке
	movl	%eax, %edx              ; перенос регистра eax в edx
	movl	n, %eax                 ; перенос n в регистр eax
	subl	$4, %esp                ; Выделение места на стеке для переменной
	pushl	%edx                    ; Помещение  edx в стек
	pushl	%eax                    ; Помещение  n в стек
	pushl	$.LC1                   ; Помещение  .LC1 в стек
	call	printf                  ; Вызов функции printf
	addl	$16, %esp               ; Освобождение места на стеке
	movl	$0, %eax                ; Загрузка значения 0 в eax
	movl	-4(%ebp), %ecx          ; Загрузка значения из стека в ecx
	.cfi_def_cfa 1, 0
	leave                           ; Очистка текущего фрейма
	.cfi_restore 5                  ; Восстановление предыдущего значения ebp
	leal	-4(%ecx), %esp          ; Загрузка адреса из ecx в стек
	.cfi_def_cfa 4, 4
	ret                             ; Возврат из функции
	.cfi_endproc
.LFE0:                                  ; Метка для окончания базового блока функции
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
	