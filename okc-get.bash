#!/usr/bin/env bash
PREFIX="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
IDFILE="$PREFIX/.okc-id"
if [[ -z "$1" ]]; then
	echo "you need to specify a password name"
else
	PWPATH="${1%/}"
	PWFILE="$PREFIX/$PWPATH.gpg"
	if [ -f "$PWFILE" ]; then
		PW="$(okc-gpg -d "$PWFILE" )"
		echo "$PW"
	else
		echo "No password record at $PWPATH"
	fi
fi
