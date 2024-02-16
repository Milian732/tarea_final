#!/bin/bash

# DO NOT EDIT THIS SCRIPT 
# IT WILL BE AUTOMAGICALLY GENERATED

# Orig old.xlsx
# Dest new.xlsx


# DESPIDOS PROCEDENTES :  

# Deleting Cesar Tomas
deluser csueca

# Deleting Angel Diseño
deluser aberlanas


# NUEVOS CONTRATOS : 
useradd -m -d "/home/jguesser" -s "/bin/bash" -u 5004 -c "Jose Guesser, ,123554422, ,timeguesser@champion.co.uk" "jguesser"
echo "jguesser:123554422"| chpasswd 


# MODIFICACIONES : 

chfn -f "Lautaro Guapeton" lautarin

chfn -o "scriptingman@shell.linux" vthin
exit 0
