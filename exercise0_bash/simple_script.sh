#! /bin/bash

pushd /tmp
mkdir uselessdir
cd uselessdir
for i in {1..10..1}
do
    echo creating file $i
    touch file$i
    if [ $(($i%2)) == 0 ]
    then
	echo I am even >> file$i
    else
	echo I am odd >> file$i
    fi 
done
echo All done
popd
