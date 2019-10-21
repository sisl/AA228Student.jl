@ECHO OFF
julia --color=yes -p auto -e "using RedPen,Obfuscatee; @binclude \"../src/.sbin\"" %*