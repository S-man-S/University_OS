nasm lab5.asm -f bin -o lab5.bin
#xxd lab5.bin
qemu-system-x86_64 lab5.bin
#rm -f lab5.bin
