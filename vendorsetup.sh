#!/bin/bash
if [ -n "${CLEAN_DT_REPOS}" ]; then
    if [ "$CLEAN_DT_REPOS" = "True" ]; then
        echo "Cleaning old repos before cloning"
        rm -rf device/motorola/sm8475-common
        rm -rf device/motorola/eqs-kernel
        rm -rf vendor/motorola
        rm -rf hardware/motorola
        unset CLEAN_DT_REPOS
    fi
fi
echo eqs: start cloning device specific repos
COMMON_DT=device/motorola/sm8475-common/sm8475.mk
if ! [ -a $COMMON_DT ]; then git clone https://github.com/RisingOSS-devices/device_motorola_sm8475-common -b fourteen device/motorola/sm8475-common
fi
COMMON_VT=vendor/motorola/sm8475-common/sm8475-common-vendor.mk
if ! [ -a $COMMON_VT ]; then git clone https://github.com/RisingOSS-devices/vendor_motorola_sm8475-common -b fourteen vendor/motorola/sm8475-common
fi
VT=vendor/motorola/eqs/eqs-vendor.mk
if ! [ -a $VT ]; then git clone https://gitlab.com/RisingOSS-devices/vendor_motorola_eqs -b fourteen vendor/motorola/eqs
fi
KT=device/motorola/eqs-kernel/kernel
if ! [ -a $KT ]; then git clone --depth=1 https://github.com/RisingOSS-devices/device_motorola_eqs-kernel device/motorola/eqs-kernel
fi
HARDWARE_MOTO=hardware/motorola/lineage.dependencies
if ! [ -a $HARDWARE_MOTO ]; then git clone --depth=1 https://github.com/RisingOSS-devices/hardware_motorola -b fourteen hardware/motorola
fi
KERNEL_SOURCE=kernel/motorola/sm8475/Makefile
if ! [ -a $KERNEL_SOURCE ]; then git clone --depth=1 https://github.com/RisingOSS-devices/android_kernel_motorola_sm8475 -b fourteen kernel/motorola/sm8475
fi
echo eqs: end cloning device specific repos
