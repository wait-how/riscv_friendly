ENTRY(_start) /* this is required because otherwise the first label encountered will be the first one executed in memory, which leads to annoying bugs if things are defined before _start */

SECTIONS
{
  . = 0x80000000;
  .text : { *(.text) }
  .data : { *(.data) }
  .bss : { *(.bss) }
}