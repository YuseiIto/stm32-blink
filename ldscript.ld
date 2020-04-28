/*　_startから呼ぶ　*/
ENTRY(_start)

/* メモリ領域の指定 */
MEMORY
{
RAM (xrw)      : ORIGIN = 0x20000000, LENGTH = 12K
CCMRAM (rw)      : ORIGIN = 0x10000000, LENGTH = 4K
FLASH (rx)      : ORIGIN = 0x8000000, LENGTH = 64K
}

SECTIONS
{
 .text : {
          __text_start = . ;
          __start = . ;
          KEEP(*(.text.start))
          *(.text*)
          . = ALIGN(4);
          __text_end = . ;
        } > FLASH
 
 .rodata : {
          __rodata_start = . ;
          *(.rodata*)
          . = ALIGN(4);
          __rodata_end = . ;
           } > FLASH
 
 .data : {
         __data_start = . ;
         *(.data*)
         . = ALIGN(4);
         __data_end = . ;
         } > RAM AT> FLASH
 
 .bss : {
         __bss_start = . ;
         *(.bss*)
         __bss_end = . ;
        } > RAM

 .heap: {
         __heap_start = . ;
         /* 32KiB heap */ 
         . = . + 1024 * 32;
         . = ALIGN(4);
         __heap_end = . ;
        } > RAM
 
 .stack: {
          __stack_end = .;
          . = . + 1024 * 32;
          . = ALIGN(4);
          __stack_end = . ;
         } > CCRAM
}
