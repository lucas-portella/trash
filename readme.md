*Trash: Utilitário de Lixeira*

Minha versão de um utilitário de lixeira para terminal.
Feito apenas em shell script (bash). Necessita que o usuário
utilize bash como padrão e que tenha os arquivos de configuração
.bashrc e .profile em sua home.

O programa compacta, descompacta e move arquivos. Além disso, apaga
arquivos que estejam a mais de 30 dias na lixeira de forma automática.

Para instalar o programa, execute o arquivo _install.sh_.

Para desinstalar o utilitário, basta:
	- Excluir o executável $HOME/.local/bin/trash/trash ;
	- Excluir o diretório da lixeira, $HOME/.trash ;
	- Apagar as linhas correspondentes ao programa nos arquivos .bashrc e .profile

Sugestões de alias para o utilitário:
	- alias rmf="trash -r" 
	- alias rcf="trash -d"
