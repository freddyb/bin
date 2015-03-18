#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
   setuid( 0 );
   system( "/lib/udev/keymap /dev/input/by-id/usb-Microsoft_Natural®_Ergonomic_Keyboard_4000-if01-event-kbd /lib/udev/keymaps/microsoft-4000");
   /* content of microsoft-4000 file is
    0xC022D up
    0xC022E down
    */
   return 0;
}
