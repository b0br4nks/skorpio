BITS 64
segment .text
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
.L2:
    mov     rax, rdi
    lea     r8, [rsp+32]
    mul     r9
    mov     rax, rdi
    sub     r8, rcx
    shr     rdx, 3
    lea     rsi, [rdx+rdx*4]
    add     rsi, rsi
    sub     rax, rsi
    add     eax, 48
    mov     BYTE [rcx], al
    mov     rax, rdi
    mov     rdi, rdx
    mov     rdx, rcx
    sub     rcx, 1
    cmp     rax, 9
    ja      .L2
    lea     rax, [rsp+32]
    mov     edi, 1
    sub     rdx, rax
    xor     eax, eax
    lea     rsi, [rsp+32+rdx]
    mov     rdx, r8
    mov     rax, 1
    syscall
    add     rsp, 40
    ret
global _start
_start:
    mov [args_ptr], rsp
addr_0:
    ;; -- push int 0 --
    mov rax, 0
    push rax
addr_1:
    ;; -- push int 1 --
    mov rax, 1
    push rax
addr_2:
    ;; -- while --
addr_3:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_4:
    ;; -- push int 1000000 --
    mov rax, 1000000
    push rax
addr_5:
    ;; -- lt --
    mov rcx, 0
    mov rdx, 1
    pop rbx
    pop rax
    cmp rax, rbx
    cmovl rcx, rdx
    push rcx
addr_6:
    ;; -- do --
    pop rax
    test rax, rax
    jz addr_13
addr_7:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_8:
    ;; -- print --
    pop rdi
    call print
addr_9:
    ;; -- swap --
    pop rax
    pop rbx
    push rax
    push rbx
addr_10:
    ;; -- over --
    pop rax
    pop rbx
    push rbx
    push rax
    push rbx
addr_11:
    ;; -- plus --
    pop rax
    pop rbx
    add rax, rbx
    push rax
addr_12:
    ;; -- end --
    jmp addr_2
addr_13:
    ;; -- drop --
    pop rax
addr_14:
    ;; -- drop --
    pop rax
addr_15:
    mov rax, 60
    mov rdi, 0
    syscall
segment .data
segment .bss
args_ptr: resq 1
mem: resb 640000
