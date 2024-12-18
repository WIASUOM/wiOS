if grub-file --is-x86-multiboot isoroot/myos.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi
