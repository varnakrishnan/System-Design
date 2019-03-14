s1=0
s2=0
s3=0
i=0
rlno1=()
rlno2=()
rlno3=()
#s1 count
while IFS="," read rno name
do
  rlno1[$i]=$rno
  s1=`expr $s1 + 1`
  ((i++))
done < s1.csv
#for i in ${rlno1[@]}; do echo $i; done
#s2 count
i=0
while IFS="," read rno name
do
  rlno2[$i]=$rno
  s2=`expr $s2 + 1`
  ((i++))
done < s3.csv
#for i in ${rlno2[@]}; do echo $i; done

#s3 count
i=0
while IFS="," read rno name
do
  rlno3[$i]=$rno
  s3=`expr $s3 + 1`
  ((i++))
done < s5.csv
#total students
total=`expr $s1 + $s2 + $s3`
#no of rooms required
room1=`expr $total / 40`
room2=`expr $total % 40`
if [ `expr $room2 / 40` == 0 ]
then
tot_room=`expr $room1 + 1`
fi
#room allocation
i=1
p=0
q=0
r=0
f=0
j=0
f1=0
while [ $i -le $tot_room ]
do
echo '==========================================='  
echo 'Room ' $i
	j=0
	while [ $p -lt $s1 -a $j -lt 20 -a $q -lt $s2 -a $r -lt $s3 ]
	do
   	if [ $f == 0 ]
	then
	echo ${rlno1[$p]} ${rlno2[$q]}
	((p++))
	((q++))	
	((j++))
	f1=1
	else
	if [ $f == 1 ]
	then
	echo ${rlno2[$q]} ${rlno3[$r]}
	((q++))
	((r++))	
	((j++))
	f1=2
	fi
	fi
	
	if [ $f == 2 ]
	then
	echo ${rlno3[$r]} ${rlno1[$p]}
	((r++))
	((p++))	
	((j++))
	f1=0
	fi
	
	done
  i=`expr $i + 1`
if [ $f1 == 1 ]
then  
f=1
fi

if [ $f1 == 2 ]
then
f=2
fi

if [ $f1 == 0 ]
then
f=0
fi
done

while [ $p -lt $s1 -a $r -lt $s3 ]
do
	echo ${rlno3[$r]} ${rlno1[$p]}
	((r++))
	((p++))
done
while [ $q -lt $s2 -a $r -lt $s3 ]
do
	echo ${rlno3[$r]} ${rlno2[$q]}
	((r++))
	((q++))
done
while [ $q -lt $s2 -a $r -lt $s1 ]
do
	echo ${rlno1[$p]} ${rlno2[$q]}
	((p++))
	((q++))
done

while [ $p -lt $s1 ]
do
echo ${rlno1[$p]} 0
((p++))
done

while [ $q -lt $s2 ]
do
echo ${rlno2[$q]} 0
((q++))
done

while [ $r -lt $s3 ]
do
echo ${rlno3[$r]} 0
((r++))
done
