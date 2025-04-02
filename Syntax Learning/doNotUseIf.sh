#!\bin\bash

# Use ; to chain the commands

echo "Hello " ; echo "Wordl" ; echo "!"

# When && between commands it will execute the next command if the previous was succesfully executed

cat .thisFileDoesNotExist && echo "That works"

# || is the oposite to && - the chained command will be executed only when the previous was not succesfully executed

# & will start executing the first command and then it will execute the next one

sleep 5 & echo "Hello World!"

# Example 

# if [ "$EDITOR" = "" ] can be changed to [ -z "$EDITOR" ] 'z' like zero/nothing

[ -z "$EDITOR" ] && EDITOR=vi
echo $EDITOR
