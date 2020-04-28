.align 4
.global label
.section ".text.start"　//ここから実行される
.global start
start:
 msr DAIFSet, 0x0f
 ldr x0, =__stack_start
 mov sp,x0
 bl bss_clear
 
 bss_clear:
  ldr x1, =__bss_start
  ldr x2, =__bss_end
 1:
  cmp x1,x2
  beq 2f
  str xzr, [x1]
  add x1, x1, #4
  b 1b
 2:
  ret
