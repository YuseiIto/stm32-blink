 .syntax unified
	.cpu cortex-m4       // Specify CPU
	.fpu softvfp         // Specify float computing method
	.thumb               // Use thumb codes
	.global _start       // Expose _start label

.section .text.start                      // specify section

_start:                                  // start label (Referd from linker script)
 ldr   sp, =_estack 
 bl data_init                            // Initialize data section 
 bl bss_clear                            // Zero-clear BSS section 
 bl main                                 // Run main() 
LoopForever:
 b LoopForever                           // Jump to 'LoopForever' 

data_init:                               // Initialize data section function 
 ldr r1, =_sdata                         // load addreses to Rn registers 
 ldr r2, =_sidata
 ldr r3, =_edata
 movs r4, 0                              // Set R4 as 0 
 1:
  cmp r1,r3                              // Compare R1 and R3 
  beq 2f                                 // When equal, jump to foward-closest '2' label 
  ldr r5, [r2, r4]                       // Load the value at r2(_sidata)+r4  
  str r5, [r1, r4]                       // Store the value at r2(_sdata)+r4  
  adds    r4, r4, #4                     // Increment offset 
  adds    r1, r1, #4                     // Increment address 
  bl 1b                                  // Loop. Jump to '1' label closest backward. 
 2:                                      // if r1 and r3 was equal, comes here
  bx lr                                  // Return 

bss_clear:                               // Clear BSS section function 
  ldr r1, =_sbss                         // Load address of begin to r1  
  ldr r2, =_ebss                         // Load address of end to r2  
  1:                                     // Label for loop  
   cmp r1,r2                             // Compare r1 and r2  
   beq 2f                                // If equal, jump to label '2' foward  
   movs r3,0                             // store zero to r3 
   str r3,[r1]                           // Store r3's value(=zero) to address where r1 points 
   add r1, r1,4                          // increment addrsss 
   b 1b                                  //Jump to '1' label backward (loop) 
  2:                                     // Loop exit here 
  bx lr                                  // Return 

.section .isr_vector,"a"                 // Specify another section 
    .word   _estack                      // SP(Stack pointer) initial address 
    .word   _start                       // Entrypoint 
