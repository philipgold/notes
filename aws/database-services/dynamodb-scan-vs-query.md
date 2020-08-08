# DynamoDB Scan vs Query

### **Scan**

The *Scan* operation returns one or more items and item attributes by accessing every item  in a table or a secondary index. The total number of scanned items has a maximum size limit of 1 MB.

*Scan* operations proceed sequentially; however, for faster performance on a large table  or secondary index, applications can request a parallel Scan operation.

*Scan* uses eventually consistent reads when accessing the data in a table;  therefore, the result set might not include the changes to data in the  table immediately before the operation began. If you need a consistent  copy of the data, as of the time that the *Scan* begins, you can set the ConsistentRead parameter to true when you submit a scan request.

In general, Scan operations are less efficient than other operations in  DynamoDB. If possible, avoid using a Scan operation on a large table or  index with a filter that removes many results. Using Scan over large  data sets may use up the provisioned throughput for a large table or  index in a single operation. 

Instead of using a large Scan operation, you can apply the following techniques to minimize the impact of a scan on a table’s provisioned throughput:

1. **Reduce page size** – because a Scan operation reads an entire page (by default, 1 MB), you can reduce the impact of the scan operation by setting a smaller page  size.
2. **Isolate scan operations** – perform scans on a table that is not taking “mission-critical”  traffic. You can configure applications to handle this load by rotating  traffic periodically between two tables, whose data is replicated with  one another.

### **Query**

The *Query* operation finds items based on primary key values. You can query any table or  secondary index that has a composite primary key (a partition key and a  sort key). A *Query* operation will return all of the items from the table or index with the partition key value you provided.

A *Query* operation always returns a result set. If no matching items are found, the result set will be empty. Query results are always sorted by the sort key  value. If the data type of the sort key is Number, the results are  returned in numeric order; otherwise, the results are returned in order  of UTF-8 bytes.

A single *Query* operation can retrieve items up to a maximum data size of 1MB. You can  query a table, a local secondary index, or a global secondary index. For a query on a table or on a local secondary index, you can set the ConsistentRead parameter to true and obtain a strongly consistent result. Global secondary  indexes support eventually consistent reads only, so do not specify ConsistentRead when querying a global secondary index.

For faster response times, design your tables and indexes so that your applications can use Query instead of Scan.

### **Parallel Scans**

With a parallel scan, your application has multiple workers that are all running Scan operations concurrently. Using parallel scan can sometimes provide more benefits  to your applications compared to sequential scan. Since DynamoDB stores  your data across multiple physical storage partitions for rapid access,  you are not constrained by the maximum throughput of a single partition. Although, this can quickly consume all of your table’s provisioned read capacity. In that case, other applications that need to access the  table might be throttled. 

A parallel scan can be the right choice if the following conditions are met:

- The table size is 20 GB or larger.
- The table’s provisioned read throughput is not being fully used.
- Sequential Scan operations are too slow.

Monitor your parallel scans to optimize your provisioned throughput use, while  also making sure that your other applications aren’t starved of  resources. In which case, DynamoDB’s Scan function accepts the following additional parameters:

- **TotalSegments** denotes the number of workers that will access the table concurrently.
- **Segment** denotes the segment of table to be accessed by the calling worker.

Sources:

https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_Scan.html
https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_Query.html
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-query-scan.html

***