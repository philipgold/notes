# Amazon Kinesis


## Streaming Data Overview 

High volume data produced continuously from a large variety of sources at a high velocity:
* Mobile apps
* Metering records 
* Web clickstream
* IoT sensors 
* Application logs
* Smart building 


*Challenges of data streaming:*
* Difficult to setup
* Hard to achieve high availability
* Error prone and complex to manage
* Tricky to scale
* Integration requires development
* Expensive to maintain



### Introduction to Amazon Kinesis

Kinesis tools:
1. *Kinesis Data Streams*. Collect and store data streams for analytics 
2. *Kinesis Data Firehose*. Load data streams into AWS data stores
3. *Kinesis Data Analytics*. Analyse data stream with SQL or Java
4. *Kinesis Video Streams*. Capture and store video streams for analytics


*Benefits of Kinesis for Streaming:*
1. No infrastructure provisioning, no management 
2. Automatically scales during re-shard operations 
3. No stream consumptions costs when no new records to process
4. Hight availability and secure 


*Streaming Ingestion:*
1. AWS Toolkits/Libraries:
    1. AWS SDK
    2. Kinesis Producer Library
    3. AWS Mobile SDK
    4. Kinesis Agent 
2. AWS Services Integrations:
    1. AWS IoT
    2. Amazon CloudWatch. Events and Logs
    3. Amazon Database. Migration services 
3. 3rd party Offerings:
    1. LOG4J
    2. Flume
    3. Fluentd


*Streaming Processing:*
1. Kinesis:
    1. SQL
    2. Flink
    3. Kinesis Client Library + Connection Library 
2. AWS Services 
    1. AWS Lambda
    2. Amazon EMR 
3. 3rd party offering:
    1. Spark Streaming 
    2. Storm
    3. MongoDB
    4. Splunk
    5. …

*Create Kinesis Stream*
* Kinesis stream name
    * Number of shard
    * Total stream capacity 

Kinesis Data Stream: Standard consumers 
![KDS](./img/kinesis-01.png)
![KDS](./img/kinesis-02.png)

Beware poison messages 
* Lambda checkpoints upon the success of each batch.
* Failed batches are retried indefinitely (until the bad record expires from the shard)
![KDS](./img/kinesis-03.png)

* Catch exceptions and log for online analysis
![KDS](./img/kinesis-04.png)

Note: Kinesis data is base64 encoded so need to decode 

Kinesis Data Streams: Enhanced fan-out consumers
* Consumers do not pull. Messages are pushed to the consumer as they arrive.
![KDS](./img/kinesis-05.png)

* Each consumer app gets dedicated 2MB per second egress, per shard.
![KDS](./img/kinesis-06.png)

Create Kinesis Consumer 
* Register consumer with the CLI
* Kinesis trigger:
    * Kinesis stream name
    * Consumer 
    * Batch size
    * Starting position 


When to use standard consumers:
* Total number of consuming appositions is low (<3)
* Consumers are not latency-sensitive
* Minimize cost

When to use enhanced fan-out consumers:
* Multiple consumer apps for the same Kinesis Data Stream
    * Default limit of 5 registered consuming apps
    * More can be supported with a service limit increase request.
* Low-latency requirements for data processing
    * Messages are typically delivered to a consumer in less than 70 ms

## Amazon Kinesis Data Firehose

Persistence layer store options:
* Amazon S3
* Amazon Redshift
* Amazon Elasticsearch Service 
* Splunk

Kinesis Data Firehose features:
* Enrich streaming data
* Filter streaming data
* Convert streaming data
* Record format conversion. 

Note: Amazon Kinesis Data Firehose can convert data using columnar schema: Parquet or ORC.

* Source Record S3 Backup
    * Raw data backup to your DataLake
    * You can filter, enrich, and convert records while maintaining the raw incoming records
![KDS](./img/kinesis-07.png)

Serverless Data Lake Ingestion Architecture 
* Kinesis Data Firehose conversion, aggregation, and persistence to you Data Lake
![KDS](./img/kinesis-08.png)￼


References:
[High Performance Data Streaming with Amazon Kinesis: Best Practices and Common Pitfalls, Jun 20, 2019](https://www.youtube.com/watch?v=MELPeni0p04)


## Data schemas 

* [Amazon Kinesis Analytics can now discover data schemas from sample S3 objects, Posted On: Oct 4, 2017](
https://aws.amazon.com/about-aws/whats-new/2017/10/amazon-kinesis-analytics-can-now-discover-data-schemas-from-sample-s3-objects/)

*How does Kinesis support Avro?*

Separately, writing lots of little Avro files, each with their own schema, for "gluing records together" in Kinesis is certainly not a very good use of storage space, so I think the Kinesis model combined with Avro isn't the right choice here.
https://stackoverflow.com/questions/50263992/how-does-kinesis-support-avro


## Kinesis vs. Kafka

References:
* [Kinesis vs. Kafka, Posted on: May 5, 2017](http://cloudurable.com/blog/kinesis-vs-kafka/index.html)
* [Apache Kafka VS AWS Kinesis. Amit Kumar Yadav, Posted on: 2019 Jun 10. 6 min read](https://medium.com/faun/apache-kafka-vs-apache-kinesis-57a3d585ef78)
* [GitHub - ingestion_benchmark. This project compares two ingestion technologies: Kafka and AWS Kinesis.](https://github.com/thomas-schreiter/ingestion_benchmark)


### Additional

References: 
* [kinesis-kafka-connector](https://github.com/awslabs/kinesis-kafka-connector)
* [awesome-aws#kinesis](https://github.com/donnemartin/awesome-aws#kinesis)

