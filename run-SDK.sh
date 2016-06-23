LIB=$PATH
for jarfile in `ls /lib/skyEye/AV-lib/*.jar`

do
 export LIB=$LIB:$jarfile
done

for jarfile in `ls /lib/skyEye/kafka_2.11-0.9.0.0/libs/*.jar`
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

java -cp  $LIB:AV-SDK-thrift-S.jar com.main.AV_SDK_Thrift_S >>1.log 2>&1 &
echo "SDK OK..."
