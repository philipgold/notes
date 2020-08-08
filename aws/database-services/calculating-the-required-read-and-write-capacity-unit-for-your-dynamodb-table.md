# Calculating the Required Read and Write Capacity Unit for your DynamoDB Table

### Read Capacity Unit

#### On-Demand Mode

When you choose on-demand mode, DynamoDB instantly accommodates your  workloads as they ramp up or down to any previously reached traffic  level. If a workload’s traffic level hits a new peak, DynamoDB adapts  rapidly to accommodate the workload. The request rate is only limited by the DynamoDB throughput default table limits, but it can be raised upon request.

For on-demand  mode tables, you don’t need to specify how much read throughput you  expect your application to perform. DynamoDB charges you for the reads  that your application performs on your tables in terms of read request  units.

- 1 read request unit (RRU) = 1 strongly consistent read of up to 4 KB/s = 2 eventually consistent reads of up to 4 KB/s per read.
- 2 RRUs = 1 transactional read request (one read per second) for items up to 4 KB.
- For reads on items greater than 4 KB, total number of reads required = (total item size / 4 KB) rounded up.

#### Provisioned Mode

If you choose provisioned mode, you specify the number of reads and writes per second that you require for your application. You can use auto  scaling to adjust your table’s provisioned capacity automatically in  response to traffic changes.

For provisioned mode tables, you specify throughput capacity in terms of read capacity units (RCUs).

- 1 read capacity unit (RCU) = 1 strongly consistent read of up to 4 KB/s = 2 eventually consistent reads of up to 4 KB/s per read.
- 2 RCUs = 1 transactional read request (one read per second) for items up to 4 KB.
- For reads on items greater than 4 KB, total number of reads required = (total item size / 4 KB) rounded up.

### Write Capacity Unit

#### On-Demand Mode

For on-demand mode tables, you don’t need to specify how much write  throughput you expect your application to perform. DynamoDB charges you  for the writes that your application performs on your tables in terms of write request units.

- 1 write request unit (WRU) = 1 write of up to 1 KB/s.
- 2 WRUs = 1 transactional write request (one write per second) for items up to 1 KB.
- For writes greater than 1 KB, total number of writes required = (total item size / 1 KB) rounded up

#### Provisioned Mode

For provisioned mode tables, you specify throughput capacity in terms of write capacity units (WCUs).

- 1 write capacity unit (WCU) = 1 write of up to 1 KB/s.
- 2 WCUs = 1 transactional write request (one write per second) for items up to 1 KB.
- For writes greater than 1 KB, total number of writes required = (total item size / 1 KB) rounded up

### Examples

1. For 5 KB average item size:
   1. 1 read capacity unit needed to perform 1 eventually consistent read per second
   2. 2 read capacity units needed to perform 1 strongly consistent read per second
   3. 4 read capacity units needed to perform 1 transactional read per second
   4. 5 write capacity units needed to perform 1 standard write per second
   5. 10 write capacity units needed to perform 1 transactional write per second
2. For 9 KB average item size:
   1. 2 read capacity unit needed to perform 1 eventually consistent read per second
   2. 3 read capacity units needed to perform 1 strongly consistent read per second
   3. 6 read capacity units needed to perform 1 transactional read per second
   4. 9 write capacity units needed to perform 1 standard write per second
   5. 18 write capacity units needed to perform 1 transactional write per second
3. For 13 KB average item size:
   1. 2 read capacity unit needed to perform 1 eventually consistent read per second
   2. 4 read capacity units needed to perform 1 strongly consistent read per second
   3. 8 read capacity units needed to perform 1 transactional read per second
   4. 13 write capacity units needed to perform 1 standard write per second
   5. 26 write capacity units needed to perform 1 transactional write per second

 

Source:

https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html