@ECHO OFF
julia --color=yes -e "using RedPen,Obfuscatee; @binclude \"../src/.sbin\"" %*