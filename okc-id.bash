#!/usr/bin/env bash
PREFIX="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
IDFILE="$PREFIX/.okc-id"
touch $IDFILE
if [[ -z "$1" ]]; then
	echo "missing id arg"
else
	> $IDFILE
	echo "$1" > $IDFILE
	echo "okc identity: $1"
fi
