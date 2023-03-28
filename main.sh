#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
# Clone Upstream
echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">\n<wallpapers>" > pika-wallpapers.xml
for i in $(ls wallpapers)
do
echo -e "\t<wallpaper>\n\t\t<name>$i</name>\n\t\t<filename>/usr/share/backgrounds/pika/$i</filename>\n\t\t<options>zoom</options>\n\t\t<pcolor>#000000</pcolor>\n\t\t<scolor>#000000</scolor>\n\t\t<shade_type>solid</shade_type>\n\t</wallpaper>" >> pika-wallpapers.xml
done
echo -e "</wallpapers>" >> pika-wallpapers.xml
mkdir -p ./pika-wallpapers
cp -rvf ./* ./pika-wallpapers || echo
cd ./pika-wallpapers

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
