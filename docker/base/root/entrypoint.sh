#!/bin/sh

if ! run-parts --exit-on-error /docker/entrypoint.d; then
	echo "*** ERROR *** Container initialization failed." >&2
	exit 1
fi

exec "$@"
