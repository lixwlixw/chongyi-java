LIB=$PATH
for jarfile in `ls /lib/skyEye/AV-lib/*.jar`

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

java -cp  $LIB:AV-HBase-thrift-S.jar com.main.AV_HBase_Thrift_S >>1.log 2>&1 &
