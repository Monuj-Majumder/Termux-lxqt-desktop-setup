green='\033[0;32m'
red='\033[0;31m'
cyan='\033[1;36m'
white='\033[1;37m'
yellow='\033[1;33m'

banner(){        

echo -e "${yellow}::::::::::::::::::::::::::::::::::::::::::::::::::";
echo " ";
echo " ";      
echo -e "              ${white}cWM ${cyan}xodoooc"; 
echo -e "             ${white}oWoM ${cyan}Ood  :dl";
echo -e "            ${white}aw mM ${cyan}ocd  ;dl" ;
echo -e "           ${white}a.WdOM ${cyan}Ood  :dc" ;
echo -e "          ${white}adX  'X ${cyan}xloooca"; 
echo " ";
echo " ";
echo -e "             ${white}APNA DIGITAL HUB ${white}";
echo -e "${yellow}::::::::::::::::::::::::::::::::::::::::::::::::::";
echo " ";
}

tell(){
echo -e "       ${white}Installing LXQT dektop on Your TERMUX (native)"
echo -e "  ${white}Additional package will installing, they are : ";
echo -e "1. Featherpad";
echo "2. pcmanfm";
echo " ";
}


instalL(){
echo " ";
echo " Service with their package:  ";
echo " Desktop: LXQT"; 
echo "File manager: pcmanfm";
 echo "Window manger: Openbox"; 
echo "Notepad: Featherpad ";
echo "Terminal: Qterminsl";
echo "  ";
echo -e "${green}Updating previous packages .....";
pkg update -y
pkg upgrade -y
pkg install x11-repo -y
pkg install tigervnc xorg-xsetroot -y
echo " ";

echo -e "${red}Insatlling......... ${white}"
pkg install lxqt openbox dbus dbus-python -y
pkg install pcmanfm-qt -y

pkg install qterminal -y
pkg install lxqt-session -y
pkg install libxcb xcb-util-cursor xcb-util-wm xcb-util-keysyms -y

pkg install papirus-icon-theme -y
pkg install menu-cache -y
pkg install featherpad -y
pkg install lxqt-panel lxqt liblxqt lxqt-build-tools lxqt-config lxqt-runner lxqt-themes qt6-qtbase qt6-qtsvg -y

pkg install lxqt-menu-data desktop-file-utils -y
echo " ";
echo " ";
echo -e "${green}Installing Firefox browser.."
pkg install firefox -y
pkg install lximage-qt -y
pkg install pulseaudio -y
echo " ";
echo " ";
echo "Instaling VLC...";
pkg install vlc -y

}

vncpaswd(){
echo -e "${white} Set password for VNC : ";
echo " "
vncpasswd
}


#--main caller----
clear
banner
tell
sleep 2
instalL
clear
banner
sleep 1

echo "Do u want Word , excelsheet packgae (alternate of MS-Word, MS-Excel) ??: ";
read -p " enter (y/n): " choice
sleep 0.5

if [[ $choice = 'y' || $choice = 'Y' ]]; then
	echo -e "${green}Installing word and excel..."
	sleep 0.5
	pkg install abiword -y
	pkg install gnumeric -y
fi
sleep 1
vncserver
sleep 4
vncserver -kill :1
sleep 3
cd .vnc
rm -f xstartup
cat<<EOF > xstartup
#!/data/data/com.termux/files/usr/bin/sh
##Tis file is executed during VNC server
#Launch Desktop
startlxqt &
openbox &
EOF
sleep 2
chmod +x xstartup
sleep 0.5
clear
banner
echo " ";
echo " ";
echo -e "${green} !! Type ${white}\"vncserver\" ${green}to start VNC server "
echo " "
echo -e "${red}You have to set Icon theme by own, view my page for setting up !!"
echo " "
echo -e "${green}View Your Desktop using RVNC Viewer ( available at Play Store)"
echo " "
echo -e "${white}Check my page for how to use RVNC viewer app !!"
echo " "
echo " "
echo " "
echo -e "${white}THANK YOU for using it !!"
