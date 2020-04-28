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
          . = ALIGN(2048);
          __text_end = . ;
        } > FLASH
 
 .rodata : {
          __rodata_start = . ;
          *(.rodata*)
          . = ALIGN(2048);
          __rodata_end = . ;
           } > RAM
 
 .data : {
         __data_start = . ;
         *(.data*)
         . = ALIGN(2048);
         __data_end = . ;
         } > RAM
 
 .bss : {
         __bss_start = . ;
         *(.bss*)
         __bss_end = . ;
        } > RAM
 
}
