#!/usr/bin/bash

var1=$(dialog --keep-tite --inputbox 'Enter first value: ' 0 0 2>&1 >/dev/tty)
var2=$(dialog --keep-tite --inputbox 'Enter second value: ' 0 0 2>&1 >/dev/tty)

if [[  $((var1)) != "$var1" || $((var2)) != "$var2" ]] ; then  dialog --keep-tite --msgbox 'Invalid input!' 0 0 ; exit 1 ; fi

#select operation in "sum" "subtract" "multiply" "divide" "power" ; do
# case $operation in
#	"sum") output=$((var1 + var2)) ;;
#	"subtract") output=$((var1-var2)) ;;
#	"multiply") output=$((var1*var2)) ;;
#	"divide") output=$(echo "scale=2;$var1/$var2" | bc) ;;
#	"power") output=$((var1*var2))
# esac
# break
#done

operation=$(dialog --keep-tite --no-tags --menu 'Select the operation: ' 0 0 0  "sum" "Sum" "sub" "Subtract" "mul" "Multiply" "div" "Divide" "pow" "Power" 2>&1 >/dev/tty)

case $operation in
	"sum") output=$((var1 + var2)) ;;
	"sub") output=$((var1-var2)) ;;
	"mul") output=$((var1*var2)) ;;
	"div") if [[ "$var2" == "0" ]]; then
                dialog --keep-title --msgbox 'Division by zero is not allowed!' 0 0
               exit 1 ; fi 
	       output=$(echo "scale=2;$var1/$var2" | bc);;
	"pow") output=$((var1*var1)) ;;
esac

dialog --keep-tite --msgbox "Output of the calculation is: ${output}" 0 0
