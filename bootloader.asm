; bootloader.asm - Bootloader ARM64 que exibe "Hello" na tela

global _start
section .text

_start:
    ; Configuração do framebuffer e escrita de "Hello"
    ; Aqui você precisa ajustar o endereço de acordo com seu ambiente

    mov x0, 0x10000000       ; Endereço base do framebuffer (ajuste conforme necessário)
    ldr x1, =hello_string    ; Endereço da string "Hello"

print_loop:
    ldrb w2, [x1], #1       ; Carrega o próximo caractere da string
    cmp w2, #0               ; Verifica se é o final da string
    beq done                 ; Se for o final, saia do loop
    strb w2, [x0], #1       ; Escreve o caractere no framebuffer
    b print_loop             ; Continua o loop

done:
    b done                   ; Fica preso aqui após imprimir "Hello"

section .data
hello_string:
    .asciz "Hello"

section .bss
