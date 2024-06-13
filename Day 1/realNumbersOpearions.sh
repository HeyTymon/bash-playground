#!\bin\bash

n1=$1
n2=$2

n3=$(echo "$n1+$n2" | bc)
echo $n3

n4=$(echo "scale=2;$n1/$n2" | bc)
echo $n4
