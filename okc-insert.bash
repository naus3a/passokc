#!/usr/bin/env bash
PREFIX="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
IDFILE="$PREFIX/.okc-id"
if [[ -z "$1" ]]; then
	echo "you need to specify a password name"
else
	PWPATH="${1%/}"
	PWFILE="$PREFIX/$PWPATH.gpg"
	#TODO: check if it already exists and prompt user for overwriting
	#TODO: implement multiline
	while true; do
		read -r -p "Enter password for $PWPATH: " -s PW || exit 1
		echo
		read -r -p "Retype password for $PWPATH: " -s PWAGAIN || exit 1
		echo
		if [[ $PW == "$PWAGAIN" ]]; then
			KID=$(< $IDFILE)
			echo "$PW" | okc-gpg -e -r "$KID" -o "$PWFILE" || die "Password encryption aborted"
			break
		else
			die "Error: the entered passwords do not match"
		fi
	done
fi
