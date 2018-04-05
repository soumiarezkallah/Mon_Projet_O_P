#!/bin/bash


if test $# -gt 4 || test $# -eq 0
then
echo "Expected arguments, please check the help : initdev –help"
exit 1
fi


if test $# -gt 0
then

if test $1 = "-help"
	then
	echo "-Name : Afficher le nom de l’application et une petite description.
— Syntax : Afficher la syntaxe d’utilisation de la commande initdev.
— args : Lister les arguments et donner une description de chaque argument.
— author : Afficher le nom et l’email de l’auteur de l’application."
else

dir=$HOME/.initdev
if [ ! -d "$dir" ];
then 
mkdir $dir
else 
echo "$dir already exists"
exit 1
fi

mkdir    $dir/$1
mkdir    $dir/$1/bin		# Le language utilisé est shell donc le dossier bin est vide
mkdir    $dir/$1/licenses
mkdir    $dir/$1/makfiles
mkdir    $dir/$1/sources
touch    $dir/$1/install.sh
touch    $dir/$1/LICENCES
touch    $dir/$1/makefile
fi


if test $# -gt 1
then

case $2 in 
	#Type de fichier
	 -C) touch $dir/$1/main.c;;
     -CPP) touch $dir/$1/main.cpp;;
     -C++) touch $dir/$1/main.cpp;;
     -Py) touch $dir/$1/main.py;;
     -Latex) touch $dir/$1/main.latex;;
     -BEAMER) touch $dir/$1/main.beamer;;
	#Type de Licence
     -GPL) echo "GENERAL PUBLIC LICENSE" > $dir/$1/LICENCES
           touch $dir/$1/main ;;
     -MIT) echo "Licence MIT" > $dir/$1/LICENCES
           touch $dir/$1/main;;
     -git) echo "You must set project type, please check the help : initdev –help";;
      *) echo "Uknown arguments, please check the help : initdev –help"
           exit 1;;
esac
fi	


if test $# -gt 2
then

case $3 in 
	-C) touch $dir/$1/main.c;;
     -CPP) touch $dir/$1/main.cpp;;
     -C++) touch $dir/$1/main.cpp;;
     -Py) touch $dir/$1/main.py;;
     -Latex) touch $dir/$1/main.latex;;
     -BEAMER) touch $dir/$1/main.beamer;;
	
     -GPL) echo "GENERAL PUBLIC LICENSE" > $dir/$1/LICENCES
           touch $dir/$1/main ;;
     -MIT) echo "Licence MIT" > $dir/$1/LICENCES
           touch $dir/$1/main;;
      -git) cd $dir/$1 
            git init $dir/$1
	    touch $dir/$1/.gitignore;;
      *) echo "Uknown arguments, please check the help : initdev –help"
           exit 1;;
esac
fi


if test $# -gt 3
then

case $4 in 
	-C) touch $dir/$1/main.c;;
     -CPP) touch $dir/$1/main.cpp;;
     -C++) touch $dir/$1/main.cpp;;
     -Py) touch $dir/$1/main.py;;
     -Latex) touch $dir/$1/main.latex;;
     -BEAMER) touch $dir/$1/main.beamer;;
	
     -GPL) echo "GENERAL PUBLIC LICENSE" > $1/LICENCES
           touch $dir/$1/main ;;
     -MIT) echo "Licence MIT" > $dir/$1/LICENCES
           touch $dir/$1/main;;
      -git) cd $dir/$1
	    git init $dir/$1
	    touch $dir/$1/.gitignore ;;
      *) echo "Uknown arguments, please check the help : initdev –help"
           exit 1;;
esac
fi

fi

if [ $SHELL == "/bin/bash" ];
then 
echo "export PATH=\$HOME/.initdev:\$PATH" >> $HOME/.bashrc
fi 

if [ $SHELL == "/bin/zsh" ];
then 
echo "export PATH=\$HOME/.initdev:\$PATH" >> $HOME/.zshrc
fi
exit 0;
