#!/bin/bash
# Local-only shim for an old bubblewrap without --clearenv: emulate it by starting bwrap with an empty environment.
args=(); clear=0
for a in "$@"; do if [ "$a" = "--clearenv" ]; then clear=1; else args+=("$a"); fi; done
if [ $clear = 1 ]; then exec env -i /usr/bin/bwrap "${args[@]}"; else exec /usr/bin/bwrap "${args[@]}"; fi
