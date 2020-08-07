# Kinesis Scaling, Resharding and Parallel Processing

- **Kinesis Resharding** enables you to increase or decrease the number of shards in a stream in order to adapt to changes in the rate of data flowing through the  stream.

- Resharding is always pairwise. You cannot split into more than two shards in a  single operation, and you cannot merge more than two shards in a single  operation.

- The Kinesis Client Library (KCL) tracks the shards in the stream using an  Amazon DynamoDB table, and adapts to changes in the number of shards  that result from resharding. When new shards are created as a result of  resharding, the KCL discovers the new shards and populates new rows in  the table. 

- The workers automatically discover the new shards and create processors to  handle the data from them. The KCL also distributes the shards in the  stream across all the available workers and record processors.

- When you use the KCL, you should ensure that

   the number of instances does not exceed the number of shards (except for failure standby purposes). 

  - **Each shard is processed by exactly one KCL worker and has exactly one corresponding record processor**. 
  - **One worker can process any number of shards**.

- You can scale your application to use more than one EC2 instance when  processing a stream. By doing so, you allow the record processors in  each instance to work in parallel. When the KCL worker starts up on the  scaled instance, it load-balances with the existing instances, so now  each instance handles the same amount of shards.

- To scale up processing in your application:

  - Increase the instance size (because all record processors run in parallel within a process)
  - Increase the number of instances up to the maximum number of open shards (because shards can be processed independently)
  - Increase the number of shards (which increases the level of parallelism)

Source:

https://docs.aws.amazon.com/streams/latest/dev/kinesis-record-processor-scaling.html

