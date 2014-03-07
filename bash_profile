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

USERNAME=""
PATH=".:${PATH}"

C_INCLUDE_PATH="${HOME}/include:${C_INCLUDE_PATH}"
CPLUS_INCLUDE_PATH="${HOME}/include:${CPLUS_INCLUDE_PATH}"

#specific computer
MACHINE_DESCRIPTION=$(head -1 MACHINE_DESCRIPTION)
# cygwin pacific
if [ ${MACHINE_DESCRIPTION} = "CYGWIN" ]
then
    PATH="/cygdrive/c/Program Files/MiKTeX 2.9/miktex/bin/x64:${PATH}"
    export DESKTOP=/cygdrive/c/Users/KT/Desktop
    export GOOGLECODE=/cygdrive/c/Users/KT/googleCode/
    startxwin
    DISPLAY=localhost:0.0
    export DISPLAY
elif [ ${MACHINE_DESCRIPTION} = "LINUX_ISU" ]
then
    #source ~/etc/profile.d/nx.sh
    source ./Xilinx_Env_1
    source ./Xilinx_Env_2
    source ./cny_Env
    CPLUS_INCLUDE_PATH="${HOME}/intel/include:${HOME}/intel/mkl/include:${CPLUS_INCLUDE_PATH}"
    C_INCLUDE_PATH="${HOME}/intel/include:${HOME}/intel/mkl/include:${CPLUS_INCLUDE_PATH}"
    LD_LIBRARY_PATH="${HOME}/intel/lib/intel64:${HOME}/intel/mkl/lib/intel64:${LD_LIBRARY_PATH}"
    PATH="${HOME}/intel/bin:${PATH}"
fi

export USERNAME BASH_ENV PATH DISPLAY C_INCLUDE_PATH CPLUS_INCLUDE_PATH MACHINE_DESCRIPTION
