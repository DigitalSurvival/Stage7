#/bin/bash

# Make it easy to set some handsome colors for this script. 
# Possibly clone Gentoo's color scheme. 
black='\E[30;47m'
red='\E[31;47m'
green='\E[32;47m'
yellow='\E[33;47m'
blue='\E[34;47m'
magenta='\E[35;47m'
cyan='\E[36;47m'
white='\E[37;47m'

#  Reset text attributes to normal without clearing screen.
alias Reset="tput sgr0"      

# Define a color-echo function. Argument $1 = message, Argument $2 = color
cecho ()          

{
local default_msg="No message passed."
# Doesn't really need to be a local variable.

# Defaults to default message.
message=${1:-$default_msg}   

# Defaults to black, if not specified.
color=${2:-$black}           

  echo -e "$color"
  echo "$message"
  Reset                      
  # Reset to normal.

  return
}