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
while IFS="," read rno name
do
  rlno2[$i]=$rno
  s2=`expr $s2 + 1`
  ((i++))
done < s3.csv
#s3 count
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
while [ $i -le $tot_room ]
do
  echo 'Room ' $i
	while [ $p -lt $s1 -a $q -lt $s2 -a $r -lt $s3 ]
	do
   	if [ $f == 0 ]
	then
	#echo ${rlno2[$q]}
	((p++))
	((q++))
	fi
	
	done
   i=`expr $i + 1`
done
