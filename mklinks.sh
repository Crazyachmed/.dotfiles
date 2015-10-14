#!/bin/bash

function make_symlink {
	echo "Linking \"$1\""
        ln -srf "$DIR/$1" "$HOME/$1"
}

#Get basedir of script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "Source is \"$DIR\", destination is \"$HOME\"."

make_symlink ".screenrc"
make_symlink ".yaourtrc"
make_symlink ".bash_profile"
make_symlink ".bashrc"
make_symlink ".vimrc"
