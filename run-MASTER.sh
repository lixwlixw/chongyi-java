LIB=$PATH
for jarfile in `ls /lib/skyEye/AV-lib/*.jar`

do
 export LIB=$LIB:$jarfile
done

for jarfile in `ls /lib/skyEye/kafka_2.11-0.9.0.0/libs/*.jar`
do
 export LIB=$LIB:$jarfile
done

for jarfile in `ls /usr/lib/hbase/lib/*.jar`
do
 export LIB=$LIB:$jarfile
done

for jarfile in `ls /usr/lib/hadoop/hadoop-*.jar`
do
 export LIB=$LIB:$jarfile
done

for jarfile in `ls /usr/lib/hadoop/lib/*.jar`
do
 export LIB=$LIB:$jarfile
done

#echo CLASSPATH=$CLASSPATH

java -cp  $LIB:AV-Master.jar com.main.AV_Master >>1.log 2>&1 &
echo "Master OK..."
