arm-none-eabi-as -c startup.s -o startup.o
arm-none-eabi-gcc -c main.c -o main.o -mcpu=cortex-m4 -Os
arm-none-eabi-ld -T ldscript.ld main.o startup.o -o kernel.out

arm-none-eabi-objcopy kernel.out -I ihex -O binary kernel.bin 
st-flash write kernel.bin 0x8000000
