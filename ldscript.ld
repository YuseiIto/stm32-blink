/*　_startから呼ぶ　*/
ENTRY(_start)

/* メモリ領域の指定 */
MEMORY
{
RAM (xrw)      : ORIGIN = 0x20000000, LENGTH = 12K
CCMRAM (rw)      : ORIGIN = 0x10000000, LENGTH = 4K
FLASH (rx)      : ORIGIN = 0x8000000, LENGTH = 64K
}
