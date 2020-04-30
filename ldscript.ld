/* Entry Point */
ENTRY(_start)

/* Specify the memory areas */

MEMORY
{
 RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 12K /* SRAM area */
 FLASH (rx) : ORIGIN = 0x8000000, LENGTH = 64K /* Flash ROM area */
}

/* Define output sections */
SECTIONS
{
  /* The startup code goes first into FLASH */
  .isr_vector :
  {
    . = ALIGN(4);
    KEEP(*(.isr_vector)) /* Startup code */
    . = ALIGN(4);
  } >FLASH

 .text :
  {
    . = ALIGN(4);
    _stext = .; /* Start of code */
    /* text sections (contains code) */
    *(.text)
    *(.text*)
    . = ALIGN(4);
    _etext = .; /* End of code */
  } >FLASH

  .rodata :
  {
    . = ALIGN(4);
    /* rodata sections(contains constants) */
    *(.rodata)
    *(.rodata*)
    . = ALIGN(4);
  } >FLASH


  _sidata = LOADADDR(.data); /* Address on ROM */

  .data : 
  {
    . = ALIGN(4);
    _sdata = .; 
    *(.data) 
    *(.data*)

    . = ALIGN(4);
    _edata = .; 
  } >RAM AT> FLASH

  
  . = ALIGN(4);
  .bss :
  {
    _sbss = .;
    *(.bss)
    *(.bss*)
    . = ALIGN(4);
    _ebss = .; 
  } >RAM

  .heap : {
        _sheap= .;
        /* 1KiB heap */ 
        . = . + 1024 ;
        . = ALIGN(4);
        _eheap = .;
  }> RAM

  .stack : {
        _estack = .;
        /* 1KiB stack*/
        _stack = _estack + 1024;
  }> RAM

}


