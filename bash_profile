#Kevin Townsend's bash_profile

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

if [ -d "${HOME}/lib" ]; then
    LD_LIBRARY_PATH="${HOME}/lib:${LD_LIBRARY_PATH}"
fi

USERNAME=""
PATH=".:${PATH}"

if [ -d "${HOME}/include" ]; then
  C_INCLUDE_PATH="${HOME}/include:${C_INCLUDE_PATH}"
  CPLUS_INCLUDE_PATH="${HOME}/include:${CPLUS_INCLUDE_PATH}"
fi

# cygwin pacific
if [[ $(uname) =~ "CYGWIN*" ]]
then
  PATH="/cygdrive/c/Program Files/MiKTeX 2.9/miktex/bin/x64:${PATH}"
  startxwin
  DISPLAY=localhost:0.0
  export DISPLAY
elif [[ $(uname) =~ "LINUX" ]]
then
    echo
fi

if [ $(hostname) = "*iastate*" ]
then
  source ./Xilinx_Env_1
  source ./Xilinx_Env_2
  source ./cny_Env
fi

export USERNAME BASH_ENV PATH DISPLAY C_INCLUDE_PATH CPLUS_INCLUDE_PATH
