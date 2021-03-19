#!/usr/bin/env bash

set -ex

if [ !  -f "/usr/bin/gnome-control-center.real" ]
then
    cp  /usr/bin/gnome-control-center /usr/bin/gnome-control-center.real
fi


cat << EOF > /usr/bin/gnome-control-center 
#!/bin/bash

USER=\$(id -un)

if [ \$USER == "user" ]; then
  zenity --info --text="Systemindstillingerne er ikke tilgængelige for publikum.\n\n Kontakt personalet, hvis der er problemer."
else
  /usr/bin/gnome-control-center.real
fi

EOF

chmod +x /usr/bin/gnome-control-center


