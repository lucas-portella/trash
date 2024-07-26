#!/bin/bash

instalation_directory=$HOME/.local/bin/trash

echo "Instalando utilitário de lixeira"

if [ ! -f trash ]; then
	echo "Arquivo 'trash' não localizado. Abortando."

else

	#criando diretorio de instalação

	if [ ! -d $HOME/.local ]; then
		mkdir $HOME/.local/
	fi
	if [ ! -d $HOME/.local/bin ]; then
		mkdir $HOME/.local/bin
	fi
	if [ ! -d $HOME/.local/bin/trash ]; then
		mkdir $HOME/.local/bin/trash
		mv trash $instalation_directory
	fi
	
	#movendo arquivo para diretorio de instalacao
	if [ -d $HOME/.local/bin/trash ]; then
		mv trash $instalation_directory
	fi

	if [ -f $HOME/.bashrc ]; then
		echo "#Inclusão do utilitário trash na variávle PATH:
" >> $HOME/.bashrc
		echo "export PATH=$PATH:$instalation_directory" >> $HOME/.bashrc
		source $HOME/.bashrc

		if [ -f $HOME/.profile ]; then
			echo "
#Utiliário de lixeira: Habilitando limpeza automática de arquivos com mais de 30 dias" >> $HOME/.profile
			echo '
			while : ; do trash -f ; sleep $((24*60*60)) ; done &' >> $HOME/.profile
		else
			echo "Arquivo .profile não localizado. Limpeza automática desabilitada." 
		fi

		trash -c 
		echo "Instalação concluída."

	else
		echo "Problemas ao procurar os arquivos .bashrc e .profile. Abortando instalação." 
	fi

fi
