	.file	"fact.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.globl	fact                	; Объявление функции 'fact'
	.type	fact, @function     	; Объявление типа функции
fact:
.LFB0:
	.cfi_startproc
	pushl	%ebp                 	; Сохранение значения базового указателя
	.cfi_def_cfa_offset 8 
	.cfi_offset 5, -8
    movl	$1, %eax              	; Инициализация результата в 1
	movl	%esp, %ebp            	; Установка базового указателя
    .cfi_def_cfa_register 5
	movl	8(%ebp), %edx         	; Загрузка значения первого аргумента в EDX
.L3:                            	; Начало цикла
	cmpl	$1, %edx              	; Сравнение EDX с 1
	jbe	.L2                    	; Прыжок, если значение в EDX <= 1
	imull	%edx, %eax            	; Умножение EAX на EDX
	decl	%edx                  	; Уменьшение EDX на 1
	jmp	.L3                    	; Переход к началу цикла
.L2:                            	; Выход из цикла
	popl	%ebp                 	; Восстановление базового указателя
    .cfi_restore 5
	.cfi_def_cfa 4, 4
	ret                          	; Возврат из функции
	.cfi_endproc
.LFE0:
	.size	fact, .-fact
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (Ubuntu 4.9.2-10ubuntu13) 4.9.2"
	.section	.note.GNU-stack,"",@progbits