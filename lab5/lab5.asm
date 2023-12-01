org 0x7C00
mov si, logo
call print
mov si, hello
call print
call input_name
mov si, hello_name
call print
mov si, play
call print
call choose_game
jmp $

print:
    mov ah, 0x0e
    lodsb
print_loop:
    int 0x10
    lodsb
    cmp al, 0x00
    jne print_loop
    ret

input_name:
    mov bx, hello_name + 7
input_loop:
    mov ah, 0x00
    int 0x16
    mov ah, 0x0e
    int 0x10
    cmp al, 8
    je input_back
    cmp al, 13
    je input_end
    mov [bx], al
    inc bx
    jmp input_loop
input_end:
    mov byte [bx], 0
    ret
input_back:
    dec bx
    jmp input_loop

choose_game:
    mov ah, 0x00
    int 0x16
    cmp al, 'y'
    je print_yes_game
    cmp al, 'n'
    je print_no_game
    jmp choose_game

choose_first_game:
    mov ah, 0x00
    int 0x16
    cmp al, 'y'
    je print_first_win
    cmp al, 'n'
    je print_first_lose
    jmp choose_first_game

print_first_win:
    mov si, first_win
    call print
    ret

print_first_lose:
    mov si, first_lose
    call print
    ret

print_yes_game:
    mov si, first_game
    call print
    call choose_first_game
    ret

print_no_game:
    mov si, no_game
    call print
    ret

first_win:
    db 'Oh, it is 2. You win!', 0

first_lose:
    db 'I HAVE 20! YOU LOSE! MUHAHA', 0

first_game:
    db 'Lets start! You have 19. Once more? (y\n)', 10, 13, 0

no_game:
    db 'I dont either.', 0

logo:
    db '__  ___  |\___/|', 10, 13, '| \   /  )     (', 10, 13, '| |  /  =\     /=', 10, 13, '|_/ /__   )===(', 10, 13, ' _   _   /     \', 10, 13, '/ \ / \  |   _ |', 10, 13, '| |  \  /   ( ( \', 10, 13, '| |   \ \   ) ) /', 10, 13, '\_/ \_/  \_( (_/', 10, 13, 0

hello:
    db 'Hello, user! Whats your name?', 10, 13, 0

play:
    db '! Do you want to play blackjack? (y\n)', 10, 13, 0

hello_name:
    db 'Hello, '

times 510 - ($ - $$) db 0 ;

dw 0xaa55 ;
