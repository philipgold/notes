# Global Secondary Index vs Local Secondary Index

A *secondary index* is a data structure that contains a subset of attributes from a table,  along with an alternate key to support Query operations. An Amazon  DynamoDB table can have multiple secondary indexes.

|                                           | **Global secondary index**                                   | **Local secondary index**                                    |
| ----------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Definition                                | An index with a partition key and a sort key that can be different from those on the base table. | An index that has the same partition key as the base table, but a different sort key. |
| Span of query                             | Queries on the index can span all of the data in the base table, across all partitions. | Every partition of a local secondary index is scoped to a base table partition that has the same partition key value. |
| Primary Key Schema                        | The partition key and, optionally, the sort key              | Must be both partition key and sort key                      |
| Partition Key Attributes                  | Any base table attribute of type string, number, or binary.  | Must have the same attribute as the partition key of the base table. |
| Sort Key Attributes                       | Any base table attribute of type string, number, or binary.  | Any base table attribute of type string, number, or binary.  |
| Key Values                                | Do not need to be unique                                     | The sort key value does not need to be unique for a given partition key value. |
| Size Restrictions Per Partition Key Value | No restriction.                                              | For each partition key value, the total size of all indexed items must be 10 GB or less. |
| Index Operations                          | Can be created during creation of a table.Can be created on an existing table.Can be deleted from an existing table. | Can be created during creation of a table.                   |
| Read Consistency for Queries              | Supports eventual consistency only from asynchronous updates and deletes | You can choose either eventual consistency or strong consistency. |
| Provisioned Throughput Consumption        | Every global secondary index has its own provisioned throughput settings for  read and write activity that you need to specify. Queries or scans on a  global secondary index consume capacity units from the index, not from  the base table. This is also the case for global secondary index updates due to table writes. | Queries or scans on a local secondary index consume read capacity units from  the base table. When you write to a table and its local secondary  indexes are updated, these updates consume write capacity units from the base table. |
| Projected Attributes                      | With global secondary index queries or scans, you can only request the attributes that are projected into the index. | If you query or scan a local secondary index, you can request attributes  that are not projected in to the index. DynamoDB will automatically  fetch those attributes from the table. |
| Index limit (default)                     | 20 indexes                                                   | 5 indexes per table                                          |

 

**Global Secondary Index Read/Write Capacity Calculation (Provisioned Throughput Mode)**

- **Eventually consistent reads consume ½ read capacity unit.** Therefore, each query can retrieve up to 8KB of data per capacity unit  (4KB x 2). The maximum size of the results returned by a Query operation is 1 MB.
- **The total provisioned throughput cost for a  write consists of the sum of write capacity units consumed by writing to the base table and those consumed by updating the global secondary  indexes. If a write to a table does not require a global secondary index update, then no write capacity is consumed from the index.**
- Cost of a write operation depends on the ff factors (assuming up to 1 KB item size):
  - If you write a new item to the table that defines an indexed attribute, or you update an existing item to define a previously undefined indexed  attribute, one write operation is required to put the item into the  index.
  - If an update to the table changes the value of an indexed key attribute,  two writes are required, one to delete the previous item from the index  and another write to put the new item into the index. 
  - If an item was present in the index, but a write to the table caused the  indexed attribute to be deleted, one write is required to delete the old item projection from the index.
  - If an item is not present in the index before or after the item is updated, there is no additional write cost for the index.
  - If an update to the table only changes the value of projected attributes  in the index key schema, but does not change the value of any indexed  key attribute, then one write is required to update the values of the  projected attributes into the index.

**Local Secondary Index Read/Write Capacity Calculation (Provisioned Throughput Mode)**

- An index query can use either eventually consistent or strongly consistent reads. **One strongly consistent read consumes one read capacity unit; an eventually consistent read consumes only half of that.** The number of read capacity units is the sum of all projected attribute  sizes across all of the items returned (from index and base table), and  the result is then rounded up to the next 4 KB multiple. The maximum  size of the results returned by a Query operation is 1 MB.
- **The total provisioned throughput cost for a write is the sum of write  capacity units consumed by writing to the table and those consumed by  updating the local secondary indexes.** 
- Cost of a write operation depends on the ff factors (assuming up to 1 KB item size):
  - If you write a new item to the table that defines an indexed attribute, or you update an existing item to define a previously undefined indexed  attribute, one write operation is required to put the item into the  index.
  - If an update to the table changes the value of an indexed key attribute,  two writes are required, one to delete the previous item from the index  and another write to put the new item into the index. 
  - If an item was present in the index, but a write to the table caused the  indexed attribute to be deleted, one write is required to delete the old item projection from the index.
  - If an item is not present in the index before or after the item is updated, there is no additional write cost for the index.

**Sources:
** https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SecondaryIndexes.html
 https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.html
 https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LSI.html