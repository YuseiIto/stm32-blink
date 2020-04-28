.align 4
.global label
.section ".text.start"　//ここから実行される
.global start
start:
 msr DAIFSet, 0x0f
 ldr x0, =__stack_start
 bss_clear:
  ldr x1, =__bss_start
  ldr x2, =__bss_end
  
ret
