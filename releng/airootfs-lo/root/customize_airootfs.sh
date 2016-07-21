#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service lightdm.service chrony.service bluetooth.service
systemctl set-default multi-user.target

useradd -c "Tux (pass is tux)" -m -G wheel,audio,users -s /bin/zsh tux
echo 'tux:tux' | chpasswd

echo '[LightDM]' >> /etc/lightdm/lightdm.conf
echo 'logind-check-graphical=true' >> /etc/lightdm/lightdm.conf

su -c tux pacaur --noconfirm --noedit -S openresty_luarocks
local luarocks="/opt/openresty/luajit/bin/luarocks"
$luarocks install lapis
$luarocks install lapis-console
$luarocks install lapis-exceptions
$luarocks install lapis-redis
$luarocks install lapis-systemd
$luarocks install lua-resty-string
$luarocks install payments
$luarocks install moonscript

fixperm() {
	chown -R "$h"":""$h" "$h"
}

#updates mlocate database
updatedb

local p=`pwd`
cd /home
for h in *; do
	cd "$h"
	fixperm
	if [ -x customize.sh ]; then
		local p=`pwd`
		su -c ./customize.sh "$h"
		cd "$p"
		rm customize.sh
	fi
	cd /home
done
cd $p

for f in customscript_*; do
	if [ -x "${f}" ]; then
		"${f}"
	fi
done
