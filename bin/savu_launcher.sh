module load global/cluster

qsub -N mpi_test -sync y -j y -pe openmpi 120 -q medium.q@@com06 /home/ssg37927/savu/Savu/bin/savu_mpijob.sh $@ > tmp.txt

filename=`echo mpi_test.o`
jobnumber=`awk '{print $3}' tmp.txt | head -n 1`
filename=$filename$jobnumber

while [ ! -f $filename ]
do
  sleep 2
done

cat $filename

sleep 20
echo qacct -j ${jobnumber}
qacct -j ${jobnumber}
