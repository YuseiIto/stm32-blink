.align 4
.global label
.section ".text.start"　//ここから実行される
.global start
start:
 msr DAIFSet, 0x0f
 
ret
