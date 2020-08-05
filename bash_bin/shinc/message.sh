
##########################################################################
# This file is a 'shinc' (Shell Include) that contains bash
# commands and declarations that are intended to be included into a bash
# script using the 'source' commands
##########################################################################

if [ $0 != $BASH_SOURCE ]; then
  #
  # Keeping track if file has already been sourced
  # 
  if [ ! -v SOURCED_FILES ]; then
    declare -A SOURCED_FILES
  fi
  if [ ! ${SOURCED_FILES[$BASH_SOURCE]+_} ]; then
    SOURCED_FILES["$BASH_SOURCE"]=1

    NORMAL="\033[m"        # White
    RED_TEXT="\033[31m"    # Red
    GREEN_TEXT="\033[32m"  # Green

    function message {
      echo
      echo "====> " "$(date)"
      printf "${NORMAL}  %s${NORMAL}\n" "$@"
    }

    function message_red {
      echo
      echo "====> " "$(date)"
      printf "${RED_TEXT}  %s${NORMAL}\n" "$@"
    }

    function message_green {
      echo
      echo "====> " "$(date)"
      printf "${GREEN_TEXT}  %s${NORMAL}\n" "$@"
    }
  fi
else
  echo "[$BASH_SOURCE] is intended to be a bash include file."
  echo "This script should never be run directly"
  echo "It should be included using the 'source' command in"
  echo "another bash script."
fi
