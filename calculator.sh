echo -e "1.Addition\n2.Subtraction\n3.Division\n4.Multiplication"
read x
case $x in
1) echo `expr $1 + $2`;;
2) echo `expr $1 - $2`;;
3) echo `expr $1 / $2`;;
4) echo `expr $1 \* $2`;;
esac
