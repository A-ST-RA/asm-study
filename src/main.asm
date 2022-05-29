format ELF64
public _start

new_line equ 0xA

msg db "hello, world", new_line, 0
len = $-msg

_start:
    mov rax, msg
    call _print_string
    call exit

; >
; rax = string
_print_string:
    push rcx
    push rax
    push rbx
    push rdx

    mov rcx, rax
    
    call _length_string
    
    mov rdx, rax
    mov rax, 4
    mov rbx, 1
    
    int 0x80

    pop rdx
    pop rbx
    pop rax
    pop rcx

    ret

; >
; rax = string
; <
; rax = lenth 
_length_string:
    push rdx
    xor rdx, rdx
    
    .next:
        cmp [rax+rdx], byte 0
        je .close
        inc rdx
        jmp .next
    .close:
        mov rax, rdx
        pop rdx
        ret

    ret

exit:
    mov rax, 1
    mov rbx, 0
    int 0x80