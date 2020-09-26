END=$1
for ((i=0;i<END;i++))
do
date +%s%N > /app/time$i.txt
timeout $2 ((cat /app/in$i.txt | python3 /app/code.py) 2> /app/error$i.txt 1> /app/output$i.txt)
echo $? > /app/exitCode$i.txt
date +%s%N >> /app/time$i.txt
done