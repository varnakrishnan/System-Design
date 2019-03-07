s1=0
s2=0
s3=0
#s1 count
while IFS= read
do
  s1=`expr $s1 + 1`
done < s1.csv
#s2 count
while IFS= read
do
  s2=`expr $s2 + 1`
done < s1.csv
#s3 count
while IFS= read
do
  s3=`expr $s3 + 1`
done < s3.csv
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
while [ $i -le $tot_room ]
do
   echo 'Room ' $i

i=`expr $i + 1`
done
