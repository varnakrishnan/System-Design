count=0;
tmp=0;
tmp1=0;
awk -F "," 'total_marks= $4+$5+$6+$7+$8+$9+$10 { print total_marks } ' mark > temp;
while read p; do
	summ=$((summ+$p));
	count=$((count+1));
done < temp
mean=$((summ/count));
echo "Mean = $mean";
while read q; do
	tmp=$((($q-$mean)*($q-$mean)));
	tmp1=$(($tmp+$tmp1));
	tmp=0;
done < temp
var=$((tmp1/count));
echo "Variance = $var";
sd=$(bc <<< "scale=5;sqrt($var)");
echo "Standard deviation = $sd";
a=$(bc <<< "$mean+(2*$sd)");
b=$(bc <<< "$mean+$sd");
c=$(bc <<< "$mean");
d=$(bc <<< "$mean-($sd)");
e=$(bc <<< "$mean-(2*$sd)");
echo "Grade A = $a";
echo "Grade B = $b";
echo "Grade C = $c";
echo "Grade D = $d";
echo "Grade E = $e";

declare -A grade
grade[A]=0
garde[B]=0
garde[C]=0
garde[D]=0
garde[E]=0
grade[F]=0;

while read r; do
	if [[ ${r%%.*} -ge ${a%%.*} ]]
	then
		grade[A]=`expr ${grade[A]} + 1`
		#echo "A";
	elif [[ ${r%%.*} -ge ${b%%.*} ]]
	then
		grade[B]=`expr ${grade[B]} + 1`
		#echo "B";
	elif [[ ${r%%.*} -ge ${c%%.*} ]]
	then
		grade[C]=`expr ${grade[C]} + 1`
		#echo "C";
	elif [[ ${r%%.*} -ge ${d%%.*} ]]
	then
		grade[D]=`expr ${grade[D]} + 1`
		#echo "D";
	elif [[ ${r%%.*} -ge ${e%%.*} ]]
	then
		grade[E]=`expr ${grade[E]} + 1`
		#echo "E";
	elif [[  ${r%%.*} -le ${e%%.*} ]]
	then
		grade[F]=`expr ${grade[F]} + 1`
		#echo "F";
	fi
done < temp

for k in "${!grade[@]}"
do 
	his=${grade[$k]}
	echo "$k `yes "*" | head -n $his | tr '\n' ' '`"
done
