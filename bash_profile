#general

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

# Set MANPATH so it includes users' private man if it exists
if [ -d "${HOME}/man" ]; then
  MANPATH="${HOME}/man:${MANPATH}"
fi

# Set INFOPATH so it includes users' private info if it exists
if [ -d "${HOME}/info" ]; then
  INFOPATH="${HOME}/info:${INFOPATH}"
fi

PATH=".:${PATH}"

#specific computer
specific=firefly
# cygwin pacific
if [ $specific = "firefly" ]
then
    PATH="/cygdrive/c/Program Files/MiKTeX 2.9/miktex/bin/x64:${PATH}"
    export DESKTOP=/cygdrive/c/Users/KT/Desktop
    export GOOGLECODE=/cygdrive/c/Users/KT/googleCode/
    startxwin
    DISPLAY=localhost:0.0
    export DISPLAY
fi
