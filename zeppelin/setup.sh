https://zeppelin.apache.org/download.html 

docker run \
    -p 7070:8080 \
    -v $PWD/logs:/logs \
    -v $PWD/notebook:/notebook \
    -e ZEPPELIN_LOG_DIR='/logs' \
    -e ZEPPELIN_NOTEBOOK_DIR='/notebook' \
    --name zeppelin apache/zeppelin:0.8.0




$ sudo su

$ cd root

# Download binary package 'all interpreter package' are available on the download page https://zeppelin.apache.org/download.html 
$ wget http://apache.mivzakim.net/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz 

# To extract a .tgz file with tar 
# tar -xvzf /path/to/yourfile.tgz
$ tar -xvzf /root/zeppelin-0.8.0-bin-all.tgz --directory=/zeppelin

# Download Impala JDBC Driver from Cloudera Website and copy it to /zeppelin/path/interpreter/jdbc/ folder
$ wget https://downloads.cloudera.com/connectors/impala_jdbc_2.6.3.1004.zip
$ unzip impala_jdbc_2.6.3.1004.zip
$ cd ClouderaImpalaJDBC-2.6.3.1004/
$ unzip ClouderaImpalaJDBC4-2.6.3.1004.zip
$ cp ImpalaJDBC4.jar /zeppelin/zeppelin-0.8.0-bin-all/interpreter/jdbc/


# Copy the dependency jars from instance itself
# cp /opt/cloudera/parcels/CDH/lib/hadoop/client/*.jar /zeppelin/path/interpreter/jdbc/
# Open 10.50.6.134 through SSH
$ sudo cd /opt/cloudera/parcels/CDH/lib/hadoop/client/

# Copy JAR's files of hadoop client
$ cp /opt/cloudera/parcels/CDH/lib/hadoop/client/*.jar /home/philipgo/hadoop/client/

# Copy JAR files to remote server
# scp remoteuser@remotehost:/remote/dir/file /local/dir/
scp philipgo@10.50.6.134:/home/philipgo/hadoop/client/*.jar /zeppelin/zeppelin-0.8.0-bin-all/interpreter/jdbc/




# Kerberos Configuration
# default.url jdbc:impala://IMPALA_HOST:21050;AuthMech=1;KrbRealm=REALM_DOMAIN;KrbHostFQDN=IMPALA_HOST;KrbServiceName=impala
# zeppelin.jdbc.auth.type KERBEROS
# zeppelin.jdbc.keytab.location /path/to/keytab 
# zeppelin.jdbc.principal principal_name
default.url jdbc:impala://azwrk-ml-3c0eff5b.dev.paybigdata.local:21050;AuthMech=1;KrbRealm=azwrk-ml-3c0eff5b.dev.paybigdata.local;KrbHostFQDN=dev.paybigdata.local;KrbServiceName=impala
zeppelin.jdbc.auth.type KERBEROS
zeppelin.jdbc.keytab.location /zeppelin/keytab/appusermltx.keytab
zeppelin.jdbc.principal kafka


jdbc:impala://azwrk-ml-3c0eff5b.dev.paybigdata.local:21050;AuthMech=1;KrbRealm=azwrk-ml-3c0eff5b.dev.paybigdata.local;KrbHostFQDN=dev.paybigdata.local;KrbServiceName=impala


jdbc:impala://10.50.6.134:21050;AuthMech=1;KrbRealm=10.50.6.134;KrbHostFQDN=dev.paybigdata.local;KrbServiceName=impala