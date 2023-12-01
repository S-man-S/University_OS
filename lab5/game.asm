org 0x7C00
mov cx, 0x00
mov dx, 0x00
call main
jmp $
map:
	db 1, 2, 8, 10, 16, 0

map2:
	db '____', 10, 13, '____', 10, 13, '____', 10, 13, '____', 10, 13, 0

row:
	db 'Enter row number:', 10, 13, 0

col:
	db 10, 13, 'Enter column number:', 10, 13, 0

incor:
	db 10, 13, 'Incorrect data!', 10, 13, 0

input:
	mov ah, 0x00
	int 0x16
	mov ah, 0x0e
	int 0x10
	cmp al, '1'
	jl err
	cmp al, '4'
	jg err
	ret
err:
	mov si, incor
	call print
	jmp input


main:
	mov si, row
	call print
	call input
	mov bl, 0
	call korr
	mov si, col
	call print
	call input
	add al, bl
	sub al, 0x30
	call proverka
	mov al, 10
	int 0x10
	mov al, 13
	int 0x10
	mov si, map2
	call print
	cmp cx, 0x05
	je win
	inc dx
	cmp dx, 0x0a
	je lose
	jmp main

win_txt:
	db 'Congratulations, you win!^-^', 10, 13, 'The end.', 0

win:
	mov si, win_txt
	call print
	ret

lose_txt:
	db 'You lose:(', 10, 13, 'The end.', 0

lose:
	mov si, lose_txt
	call print
	ret


promah:
	db 10, 13, 'Miss!', 0

proverka:
	mov bx, map
preproverka:
	cmp al, [bx]
	je outmap
	inc bx
	cmp byte [bx], 0x00
	jne preproverka
	mov bx, map2 - 1
	call check
	call plus
	mov byte [bx], 'o'
	mov si, promah
	call print
	ret

check:
	cmp al, 0x0d
	jge addsix
	cmp al, 0x09
	jge addfour
	cmp al, 0x05
	jge addtwo
	ret

addsix:
	add al, 6
	ret

addfour:
	add al, 4
	ret

addtwo:
	add al, 2
	ret

plus:
	inc bx
	dec al
	cmp al, 0x00
	jne plus
	ret

popal:
	db 10, 13, 'Hit!', 0

outmap:
	inc cx
	mov bx, map2 - 1
	call check
	call plus
	mov byte [bx], 'x'
	mov si, popal
	call print
	ret

korr:
	cmp al, '1'
	jne korr2
	ret

korr2:
	add bl, 4
	dec al
	jmp korr

print:
	mov ah, 0x0e
	lodsb

printloop:
	int 0x10
	lodsb
	cmp al, 0x00
	jne printloop
	ret


times 510-($-$$) db 0
dw 0xAA55
