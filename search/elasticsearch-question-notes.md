# Elasticsearch Questionnaire

This document contains questions to ask customers about Elasticsearch



## General 

* ES Version?

  * Are you planning to upgrade to a new version?  If so, what version better to support? 

* Plugins used?

* Indexes size?

  *sample:*

  * normal days: 2TB/index (not including replica)

  * peak: 5TB/index(not including replica)

* Do you have customer's data retention? 

  

## Architecture

* Explain the current architecture and data flow for the application.



## Schema

* Is it Schema Free or User-Defined Schemas? 
  * Where can we see the current schema? Explain the current schema.
* Does using multiple Types in an index?



## Data Questions

* What kind of searches are using in ES? 

  *e.g. “simple search”, “fuzzy search”, “aggregating”*

* 

* Do using time-based indices?

  *e.g. indices are created on daily basis, E.g, a typical index name is sessions<orgcode>2019_01_01*

  * If the indices are created on daily basis. How long should keep indices in ES? *(7 days or more)*

* Do there Hot/Warm architecture of nodes?



## Cluster Questions

* Number of Nodes
* Number of CPU per node
* Amount of RAM per node
* Amount of storage per node
* Amount of storage available for Elasticsearch per node
* Components installed on ES cluster



## Elasticsearch writer and reader

* Applicatation that produce and consume data from elastic search? 
* Monitoring Tools
* Logging
* Should be supported by ElasticSearch service compression?
  
* If so, is HTTP request compression supported by the endpoint provided? 
  
* Can it be supported by  configuration change? inline script Groovy supporting,

  *E.g. As we currently use Groovy scripts extensively to  update ElasticSearch documents*

  

## Datamigration questions

* Should we migrate data from existing Elasticsearch cluster to a new Amazon Elasticsearch Service domain? 

* Should we migrate with ZERO downtime?

* Should we use same `number_of_replicas` and `number_of_shards` as have existing Elasticsearch cluster?

  *Perhaps this was done on purpose. Or we can apply based our recommendations.*




## Useful links

1. [Uses of Elasticsearch, and Things to Learn](https://www.elastic.co/blog/found-uses-of-elasticsearch), by elastic
2. [Elasticsearch Pre Implementation Questionnaire](https://www.codercrunch.com/post/717150570/elasticsearch-pre-implementation-questionnaire), by manpreetvohra in codercrunch

