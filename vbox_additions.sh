#!/bin/bash
VBOXVERSION=`VBoxControl -v`
if [ $VBOXVERSION != "4.3.12r93733" ]; then
	wget -q http://download.virtualbox.org/virtualbox/4.3.12/VBoxGuestAdditions_4.3.12.iso
	mkdir /media/VBoxGuestAdditions
	mount -o loop,ro VBoxGuestAdditions_4.3.12.iso /media/VBoxGuestAdditions
	sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
	rm VBoxGuestAdditions_4.3.12.iso
	umount /media/VBoxGuestAdditions
	rmdir /media/VBoxGuestAdditions
fi
