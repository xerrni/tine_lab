#!/bin/bash
ip="194.29.169.1"
src_port="12345"
dest_port="3389"
username=""
if [[ "$#" -ne 1 ]]; then
	echo "\$1 Nie zawiera adresu IP" 
	exit 1
fi
edit_dir="~/.ssh/"

if [[ ! -d "`eval echo ${edit_dir//>}`" ]];
then 
	echo -e "Folder ${edit_dir} nie istnieje \nTworzę..."
	mkdir "`eval echo ${edit_dir//>}`"
	if [[ $? -ne 0 ]];
	then
		echo "Nie mogę stworzyć folderu: ${edit_dir}"
		exit 1
	fi
fi

edit_dir="~/.ssh/config"
if [[ ! -f "`eval echo ${edit_dir//>}`" ]];
then 
	echo -e "Plik ${edit_dir} nie istnieje \nTworzę..."
	touch "`eval echo ${edit_dir//>}`"
	created="1"
	if [[ $? -ne 0 ]];
	then
		echo "Nie mogę stworzyć folderu: ${edit_dir}"
		exit 1
	fi
fi

if [[ "${created}" -eq "1" ]];
then 
	chmod 600 "`eval echo ${edit_dir//>}`"
	if [[ $? -ne 0 ]];
	then
		echo "Nie mogę zmienić uprawnień ${edit_dir} na 600"
		exit 1
	fi
fi

echo -e "Host tine\n" "\tHostName ${ip}\n" \
"\tLocalForward ${src_port} ${1}:${dest_port}\n" \
"\tUser ${username}\n" \
"\tForwardX11 yes\n" \
"\n\n Program nadpisze twój plik ~/.ssh/config\n" \
"Jesteś pewny ?? Jeżeli tak wpisz y"

read answer 

if [[ "$answer" != "y" ]];
then
	echo "Wpisałeś: \"${answer}\" napisz: \"y\" aby zapisać plik."
	exit 2
fi

echo -e "Host tine\n" "\tHostName ${ip}\n" \
"\tLocalForward ${src_port} ${1}:${dest_port}\n" \
"\tUser ${username}\n" \
"\tForwardX11 yes\n" > ~/.ssh/config

if [[ $? -ne 0 ]];
then
	echo "Nie można zapisać ~/.ssh/config"
	exit 3
fi
