{
  services.udev.extraRules = ''
  # Sony PlayStation Strikepack; USB
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c5", MODE="0660", TAG+="uaccess"

# Sony PlayStation DualShock 3; Bluetooth; USB
KERNEL=="hidraw*", KERNELS=="*054C:0268*", MODE="0660", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0268", MODE="0660", TAG+="uaccess"
## Motion Sensors
SUBSYSTEM=="input", KERNEL=="event*|input*", KERNELS=="*054C:0268*", TAG+="uaccess"

# Sony PlayStation DualShock 4; Bluetooth; USB
KERNEL=="hidraw*", KERNELS=="*054C:05C4*", MODE="0660", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0660", TAG+="uaccess"

# Sony PlayStation DualShock 4 Slim; Bluetooth; USB
KERNEL=="hidraw*", KERNELS=="*054C:09CC*", MODE="0660", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0660", TAG+="uaccess"

# Sony PlayStation DualShock 4 Wireless Adapter; USB
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0660", TAG+="uaccess"

# Sony DualSense Wireless-Controller; Bluetooth; USB
KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"

# Sony DualSense Edge Wireless-Controller; Bluetooth; USB
KERNEL=="hidraw*", KERNELS=="*054C:0DF2*", MODE="0660", TAG+="uaccess"
KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0df2", MODE="0660", TAG+="uaccess"
# Rules to ensure vendor-reset is loaded and the reset_method for our devices is set to 'device_specific' for kernel 5.15+
# (the module must be loaded, otherwise setting this may fail)
ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C0", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C1", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C2", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C4", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C7", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67D0", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67DF", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C8", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67C9", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67CA", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67CC", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67CF", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6FDF", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67E0", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67E3", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67E8", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67EB", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67EF", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67FF", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67E1", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67E7", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x67E9", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6980", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6981", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6985", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6986", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6987", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6995", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6997", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x699F", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6860", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6861", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6862", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6863", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6864", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6867", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6868", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x6869", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x686a", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x686b", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x686c", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x686d", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x686e", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x686f", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x687f", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66a0", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66a1", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66a2", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66a3", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66a4", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66a7", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x66af", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7310", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7312", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7318", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7319", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x731a", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x731b", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x731e", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x731f", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7340", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7341", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7347", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x734F", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7360", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x7362", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{device}=="0x738c", RUN+="/bin/sh -c '/sbin/modprobe vendor-reset; echo device_specific > /sys$env{DEVPATH}/reset_method'"

'';
  services.udev.extraHwdb = ''
    id-input:modalias:input:b0003v054Cp0268*
    id-input:modalias:input:b0005v054Cp0268*
     ID_INPUT_ACCELEROMETER=1  
     ID_INPUT_JOYSTICK=1
     '';

}
