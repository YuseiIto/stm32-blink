#include <stdint.h>
#define mem(ADDR) *((volatile uint32_t *)(ADDR))

#define GPIOB_PORT_BASE 0x48000400U
#define GPIOB_MODER GPIOB_PORT_BASE + (uint32_t)0x00
#define GPIOB_OTYPER GPIOB_PORT_BASE + (uint32_t)0x04
#define GPIOB_PUPDR GPIOB_PORT_BASE + (uint32_t)0x0C
#define GPIOB_ODR GPIOB_PORT_BASE + (uint32_t)0x14

#define RCC_BASE 0x40021000U
#define RCC_AHBENR RCC_BASE + (uint32_t)0x14

int main(void)
{
    mem(RCC_AHBENR) |= (1 << 18);
    mem(GPIOB_MODER) = (0b01 << 2 * 3); // Set '01' to GPIOB port 3
    mem(GPIOB_OTYPER) = 0x0000;         //All-push pull
    mem(GPIOB_PUPDR) = 0x000000000;     //No pullup-pulldown

    int i = 1;

    while (1)
    {
        if (i > 500000)
        {
            i = 0;

            if (mem(GPIOB_ODR) & (1 << 3))
            {
                mem(GPIOB_ODR) &= ~(1 << 3);
            }
            else
            {
                mem(GPIOB_ODR) |= (1 << 3);
            }
        }
        i++;
    }
    return 0;
}
