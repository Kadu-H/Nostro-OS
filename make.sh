nasm -f bin -o bootloader.bin bootloader.asm
dd if=bootloader.bin of=boot.img bs=512 count=1
qemu-system-aarch64 -fda boot.img
pause