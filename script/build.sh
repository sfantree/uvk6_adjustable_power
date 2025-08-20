set -ex
pushd $HOME
pacman -Syyu --noconfirm \
            make unzip zip wget base-devel \
            arm-none-eabi-gcc \
            arm-none-eabi-newlib \
            git \
            python-pip \
            python-crcmod
wget https://github.com/losehu/uv-k5-firmware-custom/archive/refs/tags/0.13.2.zip
unzip 0.13.2.zip
wget https://raw.githubusercontent.com/sfantree/uvk6_adjustable_power/refs/heads/master/patch/power.patch
pushd uv-k5-firmware-custom-0.13.2
patch -p1 < ../power.patch
#make full
make build ENABLE_CHINESE_FULL=0 ENABLE_ENGLISH=1 ENABLE_CUSTOM_POWER=1
ls -lh *.bin
cp LOSEHU132E.bin /tmp/LOSEHU132E.bin
popd
popd