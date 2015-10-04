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
if [[ $(uname) =~ CYGWIN ]]
then
  if [ -d "/cygdrive/c/Program Files/MiKTeX 2.9/miktex/bin/x64" ]; then
    PATH="/cygdrive/c/Program Files/MiKTeX 2.9/miktex/bin/x64:${PATH}"
  fi
  if [ -d "/cygdrive/c/Program Files (x86)/Adobe/Reader 11.0/Reader" ]; then
      PATH="/cygdrive/c/Program Files (x86)/Adobe/Reader 11.0/Reader:${PATH}"
  fi
  if [ -d "/cygdrive/c/Program Files (x86)/SumatraPDF" ]; then
      PATH="/cygdrive/c/Program Files (x86)/SumatraPDF:${PATH}"
  fi
  PATH="${HOME}/KT/AppData/Local/Android/sdk/tools:${HOME}/KT/AppData/Local/Android/sdk/platform-tools:${PATH}"
  ANT_HOME=${HOME}/ant/
  export ANT_HOME
  DISPLAY=:0.0
  export DISPLAY
  if ! xset q &>/dev/null; then
    run xwin -multiwindow -noclipboard
  fi
elif [[ $(uname) =~ LINUX ]]
then
    echo
fi

if [[ $(hostname) =~ iastate ]]
then
    #license
    export LM_LICENSE_FILE=1717@io.ece.iastate.edu:27006@io.ece.iastate.edu:6978@io.ece.iastate.edu:27001@io.ece.iastate.edu
    #Xilinx setup
    #The below line can effect gcc. I am not sure of the details.
    source /remote/Xilinx/14.7/settings64.sh
    export PATH=$PATH:/remote/Modelsim/10.1c/modeltech/linux_x86_64/
    export XIL_PAR_ENABLE_LEGALIZER=1
    source /remote/Xilinx/2014.4/settings64.sh

    #Convey setup
    export PATH=$PATH:/opt/convey/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/convey/lib
    export CNY_PDK=/opt/convey/pdk
    export CNY_PDK_REV=2012_03_19
    export CNY_PDK_HDLSIM=Mentor
    export CNY_PDK_SIMMODE=64
    if [ -d "${HOME}/personalitites" ]; then
        export CNY_PERSONALITY_PATH=$HOME/personalities:${CNY_PERSONALITY_PATH}
    fi
    export CNY_RUNTIME_STARTUP_DEBUG=0
    export CNY_CALL_STATS=1
    #latex setup
    export PATH=${HOME}/texlive/bin/x86_64-linux:${PATH}
    export PATH=/var/tmp/bin:${PATH}

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/var/tmp/lib
fi

export USERNAME BASH_ENV PATH DISPLAY C_INCLUDE_PATH CPLUS_INCLUDE_PATH LD_LIBRARY_PATH
