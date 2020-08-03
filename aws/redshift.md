# Amazon Redshift 

- A fully managed, **petabyte-scale data warehouse** service.
- Redshift extends data warehouse queries to your data lake. You can run analytic queries against petabytes of data stored locally in Redshift, and directly against exabytes of data stored in S3.
- RedShift is an OLAP type of DB.
- Currently, Redshift only supports Single-AZ deployments.
-  Features
  - Redshift uses **columnar storage**, data compression, and zone maps to reduce the amount of I/O needed to perform queries.
  - It uses a **massively parallel processing** data warehouse architecture to parallelize and distribute SQL operations.
  - Redshift uses machine learning to deliver high throughput based on your workloads.
  - Redshift uses **result caching** to deliver sub-second response times for repeat queries.
  - Redshift automatically and continuously backs up your data to S3. It can asynchronously replicate your snapshots to S3 in another region for disaster recovery.

## Components

- **Cluster** – a set of **nodes**, which consists of a leader node and one or more compute nodes.
  - Redshift creates one database when you provision a cluster. This is the database you use to load data and run queries on your data.
  - You can scale the cluster in or out by adding or removing nodes. Additionally, you can scale the cluster up or down by specifying a different node type.
  - Redshift assigns a 30-minute maintenance window at random from an 8-hour block of time per region, occurring on a random day of the week. During these maintenance windows, your cluster is not available for normal operations.
  - Redshift supports both the EC2-VPC and EC2-Classic platforms to launch a cluster. You create a **cluster subnet group** if you are provisioning your cluster in your VPC, which allows you to specify a set of subnets in your VPC.
- Redshift Nodes
  - The *leader node* receives queries from client applications, parses the queries, and develops query execution plans. It then coordinates the parallel execution of these plans with the compute nodes and aggregates the intermediate results from these nodes. Finally, it returns the results back to the client applications.
  - *Compute nodes* execute the query execution plans and transmit data among themselves to serve these queries. The intermediate results are sent to the leader node for aggregation before being sent back to the client applications.
  - Node Type
    - **Dense storage (DS)** node type – for large data workloads and use hard disk drive (HDD) storage.
    - **Dense compute (DC)** node types – optimized for performance-intensive workloads. Uses SSD storage.
- **Parameter Groups – a group of parameters that apply to all of the databases that you create in the cluster. The default parameter group has preset values for each of its parameters, and it cannot be modified.**

## Database Querying Options

- Connect to your cluster and run queries on the AWS Management Console with the Query Editor.
- Connect to your cluster through a SQL client tool using standard ODBC and JDBC connections.

## Enhanced VPC Routing

- By using Enhanced VPC Routing, you can use VPC features to manage the flow of data between your cluster and other resources.
- You can also use VPC flow logs to monitor *COPY* and *UNLOAD* traffic.

## RedShift Spectrum

- Enables you to run queries against exabytes of data in S3 without having to load or transform any data.
- Redshift Spectrum doesn’t use Enhanced VPC Routing.
- If you store data in a columnar format, Redshift Spectrum scans only the columns needed by your query, rather than processing entire rows.
- If you compress your data using one of Redshift Spectrum’s supported compression algorithms, less data is scanned.

## Cluster Snapshots

- Point-in-time backups of a cluster. There are two types of snapshots: automated and manual. Snapshots are stored in S3 using SSL.

- Redshift periodically takes incremental snapshots of your data every 8 hours or 5 GB per node of data change.

- Redshift provides free storage for snapshots that is equal to the storage capacity of your cluster until you delete the cluster. After you reach the free snapshot storage limit, you are charged for any additional storage at the normal rate.

- Automated snapshots are enabled by default when you create a cluster. These snapshots are deleted at the end of a retention period, which is one day, but you can modify it. You cannot delete an automated snapshot manually.

- By default, manual snapshots are retained indefinitely, even after you delete your cluster.

- You can share an existing manual snapshot with other AWS accounts by authorizing access to the snapshot.

- You can configure Amazon Redshift to automatically copy snapshots (automated or manual) for a cluster to another AWS Region. For automated snapshots, you can also specify the retention period to keep them in the destination AWS Region. The default retention period for copied snapshots is seven days. 

- If you store a copy of your snapshots in another AWS Region, you can restore your cluster from recent data if anything affects the primary AWS Region. You can configure your cluster to copy snapshots to only one destination AWS Region at a time.

  

## Monitoring

- Use the *database audit logging* feature to track information about authentication attempts, connections, disconnections, changes to database user definitions, and queries run in the database. The logs are stored in S3 buckets.
- Redshift tracks events and retains information about them for a period of several weeks in your AWS account.
- Redshift provides performance metrics and data so that you can track the health and performance of your clusters and databases. It uses CloudWatch metrics to monitor the physical aspects of the cluster, such as CPU utilization, latency, and throughput.
- *Query/Load performance data* helps you monitor database activity and performance.
- When you create a cluster, you can optionally configure a CloudWatch alarm to monitor the average percentage of disk space that is used across all of the nodes in your cluster, referred to as the *default disk space* alarm.

## Security

- By default, an Amazon Redshift cluster is only accessible to the AWS account that creates the cluster.

- Use IAM to create user accounts and manage permissions for those accounts to control cluster operations.

- If you are using the EC2-Classic platform for your Redshift cluster, you must use Redshift security groups.

- If you are using the EC2-VPC platform for your Redshift cluster, you must use VPC security groups.

- When you provision the cluster, you can optionally choose to encrypt the cluster for additional security. Encryption is an immutable property of the cluster.

- Snapshots created from the encrypted cluster are also encrypted.

  

## Pricing

- You pay a per-second billing rate based on the type and number of nodes in your cluster.

- You pay for the number of bytes scanned by RedShift Spectrum

- You can reserve instances by committing to using Redshift for a 1 or 3 year term and save costs.

  

## Limits per Region

| **Resource**        | **Default Limit** |
| ------------------- | ----------------- |
| Nodes per cluster   | 101               |
| Nodes               | 200               |
| Reserved Nodes      | 200               |
| Snapshots           | 20                |
| Parameter Groups    | 20                |
| Event Subscriptions | 20                |

- The maximum number of tables is 9,900 for *large* and *xlarge* cluster node types and 20,000 for *8xlarge* cluster node types.
- The number of user-defined databases you can create per cluster is 60.
- The number of concurrent user connections that can be made to a cluster is 500.
- The number of AWS accounts you can authorize to restore a snapshot is 20 for each snapshot and 100 for each AWS KMS key.



**Deep Dive and Best Practices for Amazon Redshift:**

https://www.youtube.com/watch?v=TJDtQom7SAA

 

**References:** 

https://docs.aws.amazon.com/redshift/latest/mgmt/welcome.html

https://docs.aws.amazon.com/redshift/latest/gsg/getting-started.html

