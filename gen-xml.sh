#! /bin/bash
echo -e "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE wallpapers SYSTEM \"gnome-wp-list.dtd\">\n<wallpapers>" > pika-wallpapers.xml
for i in $(ls wallpapers)
do
echo -e "\t<wallpaper>\n\t\t<name>$i</name>\n\t\t<filename>/usr/share/backgrounds/pika/$i</filename>\n\t\t<options>zoom</options>\n\t\t<pcolor>#000000</pcolor>\n\t\t<scolor>#000000</scolor>\n\t\t<shade_type>solid</shade_type>\n\t</wallpaper>" >> pika-wallpapers.xml
done
echo -e "</wallpapers>" >> pika-wallpapers.xml
