# AWS Database Migration Service

- AWS Database Migration Service supports homogeneous migrations such as  Oracle to Oracle, as well as heterogeneous migrations between different  database platforms, such as Oracle or Microsoft SQL Server to Amazon  Aurora.
- You can use Database Migration Service for one-time data migration into RDS and EC2-based databases.
- You can also continuously replicate your data with high availability  (enable multi-AZ) and consolidate databases into a petabyte-scale data  warehouse by streaming data to Amazon Redshift and Amazon S3.
- Continuous replication can be done from your data center to the databases in AWS or the reverse. 
- Replication between on-premises to on-premises databases is not supported.
- The service provides an end-to-end view of the data replication process,  including diagnostic and performance data for each point in the  replication pipeline.
- AWS Schema Conversion Tool (SCT)
  - The AWS Schema Conversion Tool makes heterogeneous database migrations  predictable by automatically converting the source database schema and a majority of the database code objects, including views, stored  procedures, and functions, to a format compatible with the target  database.
  - SCT can also scan your application source code for embedded SQL statements  and convert them as part of a database schema conversion project.
  - Supported migrations

| **Source Database**                                          | **Target Database**  |
| ------------------------------------------------------------ | -------------------- |
| Oracle Database, Azure SQL, Microsoft SQL Server, PostgreSQL, IBM DB2 LUW, Amazon Aurora | Amazon Aurora, MySQL |
| Oracle Database                                              | Oracle               |
| Oracle Database, Azure SQL, Microsoft SQL Server, MySQL and MariaDB, IBM DB2 LUW | PostgreSQL           |
| Oracle Data Warehouse, Microsoft SQL Server, Teradata, IBM Netezza, Greenplum, HPE Vertica | Amazon Redshift      |
| Apache Cassandra                                             | Amazon DynamoDB      |

 

- Basic Schema Copy
  - To quickly migrate a database schema to your target instance you can rely  on the Basic Schema Copy feature of AWS Database Migration Service. 
  - Basic Schema Copy will automatically create tables and primary keys in the  target instance if the target does not already contain tables with the  same names. 
  - It will not migrate secondary indexes, foreign keys or stored procedures.  When you need to use a more customizable schema migration process, use  AWS SCT.
- Pricing
  - You only pay for the compute resources used during the migration process  and any additional log storage. Each database migration instance  includes storage sufficient for swap space, replication logs, and data  cache for most replications and inbound data transfer is free.

Sources:
 https://aws.amazon.com/dms/
 https://aws.amazon.com/dms/schema-conversion-tool/
 https://aws.amazon.com/dms/faqs/