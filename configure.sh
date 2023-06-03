#!/bin/bash

user=$(git config --get user.name)
if [ -z "$user" ]; then
    echo "Nenhum nome de usuário configurado no Git."
else
    DIR=$(dirname "$0")
_1() {
	if [ -d "lib" ]; then
		cd lib
	else
		echo "clone a lib"
		return
	fi
	REMOTE="$(git remote get-url origin)"
	USER=$(echo "$REMOTE" | sed -n 's/.*:\/\/[^/]*\/\([^/]*\)\/.*/\1/p')
	if [ "$USER" = "$user" ]; then
		return
	fi
	cd "$DIR"/lib && git remote add "$USER" https://github.com/"$user"/lib
	cd "$DIR"/lib && git remote set-url origin https://github.com/"$user"/lib
}
	_1()

_2() {
	if [ -d "script" ]; then
		cd script
	else
		echo "clone o repo script"
		return
	fi
	REMOTE=$(git remote get-url origin)
	USER=$(echo "$REMOTE" | sed -n 's/.*:\/\/[^/]*\/\([^/]*\)\/.*/\1/p')
	if [ "$USER" = "$user" ]; then
		return
	fi
	cd "$DIR"/script && git remote add "$USER" https://github.com/"$user"/script
	cd "$DIR"/script && git remote set-url origin https://github.com/"$user"/script
}
	_2()
fi