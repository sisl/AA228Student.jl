#!/bin/sh
julia --color=yes -e 'using RedPen,Obfuscatee; @binclude "../src/.sbin"' "$@"