#   Setup Hortonworks HDP

Add hosts in host file of Ambari server
```
sudo vi /etc/hosts
```

**Passwordless SSH - Add the public key to Authorized keys**

Add the public key to Authorized keys in each of the host which Ambari Server needs to connect with 
```
cd .ssh/
rm -rf id_rsa
cat id_rsa.pub >> authorized_keys
logout
```
*Note: repeat this action on each server*

**Check ssh connection**
```
ssh hdpmaster1
```

**Copy /etc/hosts from Ambari server to all nodes in the cluster**
```
scp /etc/hosts hdpmaster1:
```
Then connect to each node and run command
```
sudo cp hosts /etc/hosts
logout
```

Copy Amrabi repo to the Amber server 
```
wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.1.5/ambari.repo -O /etc/yum.repos.d/ambari.repo
```
*Need to check actual version*

```
sudo yum repolist
```

```
sudo yum install ambari-server
```
out put 
```
Total download size: 724 M
Installed size: 814 M
```
then select `Is this ok [y/d/N]: y`

output 
```
Importing GPG key 0x07513CAD:
 Userid     : "Jenkins (HDP Builds) <jenkin@hortonworks.com>"
 Fingerprint: df52 ed4f 7a3a 5882 c099 4c66 b973 3a7a 0751 3cad
 From       : http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.6.1.5/RPM-GPG-KEY/RPM-GPG-KEY-Jenkins
Is this ok [y/N]:
```
then select `Is this ok [y/d/N]: y`

```
sudo ambari-server setup
```

output
```
Customize user account for ambari-server daemon [y/n] (n)?
```
then select `[y/n] (n)? n`

output

```
Checking JDK...
[1] Oracle JDK 1.8 + Java Cryptography Extension (JCE) Policy Files 8
[2] Oracle JDK 1.7 + Java Cryptography Extension (JCE) Policy Files 7
[3] Custom JDK
==============================================================================
Enter choice (1):
```
Select `Enter choice (1): 1`

Select `Do you accept the Oracle Binary Code License Agreement [y/n] (y)? y`

Select `Enable Ambari Server to download and install GPL Licensed LZO packages [y/n] (n)? n`

Select `Enter advanced database configuration [y/n] (n)? n`

output
```
Ambari Server 'setup' completed successfully.
```
```
sudo ambari-server start
```

Copy the Private key to you machine and we will use it to create cluster using Ambari Server
```
scp -i naya.pem ec2-user@34.253.248.33:/home/ec2-user/.ssh/id_rsa ./
```


========
Clean host on Ambari Agent 
```bash
sudo python 

/usr/lib/python2.6/site-packages/ambari_agent/HostCleanup.py
```

## Add Oozie and Hive database connection Authorization in PostgreSQL

### Install PostgreSQL Jdbc Driver package
To install the jdbc driver package, please run the following command on the postgres installe

```
yum install postgresql-jdbc
```

### Setup Ambari-server to Use PostgreSQLJDBC Driver
After the postgresql-jdbc package is installed, the next step is to set the environment variable to this location so that when Oozie tries to connect with Postgres via Ambari-installation wizard, it is able to find this driver.
To do so, please run the following command:
```
sudo ambari-server setup --jdbc-db=postgres --jdbc-driver=/usr/share/java/postgresql-jdbc.jar
```
### Add Oozie and Hive database connection Authorization in PostgreSQL
The Oozie services uses Oozie named database to persist its metadata and similarly hive uses Hive named database to persist its metadata. We will see in detail how to create these databases. But before that we need to add authorization for these databases in Postgres configuration file. This step will allow a remote server to connect with Oozie/Hive database in Postgres server respectively. To do so, please locate the pg_hba.conf file on your Postgres server. Once you find this file, please add following lines in the file to allow the server (which will host oozie/hive service) to connect with Oozie/Hive database on Postgres server.

Please see the screenshot for better understanding.

...

### Edit the postgresql.conf
```
sudo vi /var/lib/pgsql/data/pg_hba.conf
```
## PostgreSQL 

### Restart 
```
sudo -i
service postgresql restart
```
## Setup Oozie To Use PostgreSQL
### Create Oozie Database and Grant privileges on it to User Oozie
```
[ec2-user@ip-172-31-24-87 ~]$ sudo -i
[root@ip-172-31-24-87 ~]# su - postgres
-bash-4.1$ psql
postgres=# CREATE DATABASE oozie;
CREATE DATABASE
postgres=# CREATE USER oozie with PASSWORD 'bigdata';
CREATE ROLE
postgres=# GRANT ALL PRIVILEGES ON DATABASE oozie to oozie;
GRANT
```
Once this has been achieved, you need to use the same user/password in Ambari and test your connection for Oozie service. See the screenshot below for better understanding.


This confirms that Postgres is reachable and can be configured correctly for Oozie service.

## Setup Hive to Use Postgres
### Create Hive Database and Grant all privileges to User Hive
As show below, create hive database, hive user and grant all privileges on hive database to user hive.
```
[ec2-user@ip-172-31-24-87 ~]$ sudo -i
[root@ip-172-31-24-87 ~]# su - postgres
-bash-4.1$ psql
postgres=# CREATE DATABASE HIVE;
CREATE DATABASE
postgres=# CREATE USER HIVE with PASSWORD 'bigdata';
CREATE ROLE
postgres=# GRANT ALL PRIVILEGES ON DATABASE hive to hive;
GRANT
```
Once the above steps are completed successfully, you need to use the same credentials in Ambari-Hive setup and test the connection. Please see the screenshot below:



## Links:

https://www.youtube.com/watch?v=hGwjwBOCa2I
https://duckduckgo.com/?q=Ambari+2.6+Failed+to+install+package+ambari-metrics-monitor&t=hj&ia=qa
https://community.hortonworks.com/questions/218785/ambari-grafana-installation-failure-aws-rhel-65.html 
https://developer.ibm.com/hadoop/2015/10/29/using-postgresql-for-oozie-and-hive/




# Player
sudo -u hdfs /usr/hdp/2.6.5.0-292/spark2/bin/spark-submit --class il.nayatech.producer.Player --master yarn --deploy-mode cluster --num-executors 1 hdfs://ip-172-31-19-150.eu-west-1.compute.internal:8020/jars/cads-player-1.0-SNAPSHOT.jar

# DE
sudo -u hdfs /usr/hdp/2.6.5.0-292/spark2/bin/spark-submit --class il.nayatech.MainDEApp --master yarn --deploy-mode cluster --num-executors 1 hdfs://ip-172-31-19-150.eu-west-1.compute.internal:8020/jars/cads-dfe-1.0-SNAPSHOT.jar

# FE
sudo -u hdfs /usr/hdp/2.6.5.0-292/spark2/bin/spark-submit --class il.nayatech.MainFEApp --master yarn --deploy-mode cluster --num-executors 1 hdfs://ip-172-31-19-150.eu-west-1.compute.internal:8020/jars/cads-dfe-1.0-SNAPSHOT.jar

# Pre-process-fe
sudo -u hdfs /usr/hdp/2.6.5.0-292/spark2/bin/spark-submit --class il.nayatech.MainPreProcessFEApp --master yarn --deploy-mode cluster --num-executors 1 hdfs://ip-172-31-19-150.eu-west-1.compute.internal:8020/jars/cads-pre-process-fe-1.0-SNAPSHOT.jar

# Sync generator
sudo -u hdfs /usr/hdp/2.6.5.0-292/spark2/bin/spark-submit --class il.nayatech.MainSyncGeneratorApp --master yarn --deploy-mode cluster --num-executors 1 hdfs://ip-172-31-19-150.eu-west-1.compute.internal:8020/jars/cads-pre-process-fe-1.0-SNAPSHOT.jar

# Write to hfs
sudo -u hdfs /usr/hdp/2.6.5.0-292/spark2/bin/spark-submit --class il.nayatech.writer.KafkaHdfsWriter --master yarn --deploy-mode cluster --num-executors 1 hdfs://ip-172-31-19-150.eu-west-1.compute.internal:8020/jars/cads-write-to-hdfs-1.0-SNAPSHOT.jar


open permission
sudo -u hdfs hdfs dfs -chown -R admin:hdfs /hadoop 

https://gist.github.com/rajkrrsingh/71f43afaac098428dc614d50ca0293ac 


# Known issues

## Failed to set locale, defaulting to C
Getting error 
```
STDOUT: Failed to set locale, defaulting to C
```
Solution:

To set i18n stuff CentOS/Fedora and RedHat Enterprise Linux call a special script called /etc/profile.d/lang.sh. Make sure this file exist in your system:
```
$ ls -l /etc/profile.d/lang.sh
```
```
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
```
then run:
```
source /etc/profile.d/lang.sh
```
Links:

* [Failed to set locale, defaulting to C warning message on CentOS Linux when running yum](https://www.cyberciti.biz/faq/failed-to-set-locale-defaulting-to-c-warning-message-on-centoslinux/)
* [Why do I get “Failed to set locale, defaulting to C” when using yum?](https://superuser.com/questions/331242/why-do-i-get-failed-to-set-locale-defaulting-to-c-when-using-yum)


## Problem: Ambari 2.5 deploy of hdp 2.6 faiils on RHEL 7 on libtirpc-devel libarary
Error in logs:
Datanode install fails 2017-04-13 14:20:28,416 - Execution of '/usr/bin/yum -d 0 -e 0 -y install hadoop_2_6_0_3_8-client' returned 1. Error: Package: hadoop_2_6_0_3_8-hdfs-2.7.3.2.6.0.3-8.x86_64 (HDP-2.6)

Requires: libtirpc-devel

Solution
```
sudo yum-config-manager --enable rhui-REGION-rhel-server-optional
sudo yum install libtirpc-devel
```
Resources 
* [Ambari 2.5 deploy of hdp 2.6 faiils on RHEL 7 on libtirpc-devel libarary](https://community.hortonworks.com/questions/96763/hdp-26-ambari-install-fails-on-rhel-7-on-libtirpc.html?childToView=99526#answer-99526)

## Problem: Openssl error 
Error in logs:
```
INFO 2018-09-19 16:53:37,830 NetUtil.py:70 - Connecting to https://ip-172-31-39-166.eu-west-1.compute.internal:8440/ca
ERROR 2018-09-19 16:53:37,834 NetUtil.py:96 - EOF occurred in violation of protocol (_ssl.c:579)
ERROR 2018-09-19 16:53:37,834 NetUtil.py:97 - SSLError: Failed to connect. Please check openssl library versions.
Refer to: https://bugzilla.redhat.com/show_bug.cgi?id=1022468 for more details.
```

Solution 
By adding below config in [security] section of
```
vi /etc/ambari-agent/conf/ambari-agent.ini
```
```
[security]
ssl_verify_cert=0
force_https_protocol=PROTOCOL_TLSv1_2
```
Link
* [https://community.hortonworks.com/questions/145/openssl-error-upon-host-registration.html](https://community.hortonworks.com/questions/145/openssl-error-upon-host-registration.html)

## How to add public hostname 

Link 
* [How to Customize the name of a host](https://docs.hortonworks.com/HDPDocuments/Ambari-2.2.1.1/bk_ambari_reference_guide/content/_how_to_customize_the_name_of_a_host.html)

## Problem: HDFS Permission denied: user=root, access=WRITE
Error in logs
```
Permission denied: user=root, access=WRITE, inode="/mp2/links":hdfs:hdfs:drwxr-xr-x
```
Solution
```
export=hdfs
```

Change the owner of the mp2-folder (note: to change the owner you have to be a superuser or the owner => hdfs)
```
hdfs dfs -chown -R <username_of_new_owner> /mp2
```
Link
* [Permission denied: user=root, access=WRITE](https://community.hortonworks.com/questions/10508/mkdir-permission-denied-userroot-accesswrite-inode.html)

## Problem: HDFS Permission denied: user=root, access=WRITE
Error in logs
```
Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.security.AccessControlException): Permission denied: user=hbase, access=ALL, inode="/apps/hbase/data/.tmp":admin:hdfs:drwxr-xr-x
```

Solution
```
sudo -u hdfs hdfs dfs -chown -R admin:hdfs /hadoop
```

``
[ec2-user@ip-172-31-32-200 ~]$ sudo -u hdfs hdfs dfs -chown -R admin:hdfs /
[ec2-user@ip-172-31-32-200 ~]$ sudo -u hdfs hdfs dfs -chown -R ambari-qa:hdfs /
[ec2-user@ip-172-31-32-200 ~]$ sudo -u hdfs hdfs dfs -chown -R zeppelin:hdfs /
[ec2-user@ip-172-31-32-200 ~]$ sudo -u hdfs hdfs dfs -chown -R ec2-user:hdfs /
[ec2-user@ip-172-31-32-200 ~]$
``

## Problem: HDFS Permission denied: user=ambari-qa, access=EXECUTE

Error in logs
```
Caused by: org.apache.hadoop.security.AccessControlException: Permission denied: user=ambari-qa, access=EXECUTE, inode="/tmp/hive/ambari-qa/f097bc8d-91a8-4ac7-a26b-66dff4f0175a":hbase:hdfs:drwx------
```


## Problem Oozie Workflow Manager View doesn't display
Solution: Create and Configure a Workflow Manager View Instance in Ambari
Link
* [​Creating and Configuring a Workflow Manager View Instance](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.2.2/bk_ambari-views/content/create_wfm_view.html)

Need to read 
https://nofluffjuststuff.com/blog/mark_johnson/2016/02/5_steps_to_get_started_running_spark_on_yarn_with_a_hadoop_cluster

## To enable Oozie web console install the Ext JS library in HDP 2.6

Solution 

Install a third-party version of ExtJS from the following url: http://archive.cloudera.com/gplextras/misc/ext-2.2.zip

Then following the steps:

Stop Oozie service from Ambari

Copy it to the path:
```
/usr/hdp/current/oozie-client/libext/
```
Regenerate the war file by executing:
```
$ /usr/hdp/current/oozie-server/bin/oozie-setup.sh prepare-war
```
Start Oozie again

Link 
* [Ext JS library not installed correctly in Oozie](https://stackoverflow.com/questions/49276756/ext-js-library-not-installed-correctly-in-oozie)