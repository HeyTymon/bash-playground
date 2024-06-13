#!\bin\bash

n=$1
v=1

for (( i=1; i<=n; i++ ))
do
	for (( j=0; j<i; j++ ))
	do
		echo -n "$v "
		(( v++ ))
	done
	echo
done
