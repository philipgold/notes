# Amazon CloudSearch

- A fully-managed service in the AWS Cloud that makes it easy to set up,  manage, and scale a search solution for your website or application.

### **Features**

- You can use CloudSearch to index and search both structured data and plain text.
- Full text search with language-specific text processing
- Boolean search
- Prefix searches
- Range searches
- Term boosting
- Faceting
- Highlighting
- Autocomplete Suggestions
- You can get search results in JSON or XML, sort and filter results based on field values, and sort results alphabetically, numerically, or  according to custom expressions.
- CloudSearch can scale to accommodate the amount of data uploaded to the domain and the volume and complexity of search requests.
- You can integrate CloudSearch with API Gateway.

To access the CloudSearch search and document services, you use separate domain-specific endpoints:

- http://doc-*domainname*–*domainid*.us-east-1.cloudsearch.amazonaws.com—a domain’s document service endpoint is used to upload documents.
- http://search-*domainname*–*domainid*.us-east-1.cloudsearch.amazonaws.com—a domain’s search endpoint is used to submit search requests.
- CloudSearch supports authentication using **AWS Signature Version 4**.
- To search your data with CloudSearch, the first thing you need to do is create a **search domain**. If you have multiple collections of data that you want to make searchable, you can create multiple search domains. 
- A **search partition** is the portion of your data which fits on a single search instance. A  search domain can have one or more search partitions, and the number of  search partitions can change as your documents are indexed.
- A **facet** is an index field that represents a category that you want to use to  refine and filter search results. When you submit search requests to  CloudSearch, you can request facet information to find out how many hits share the same value in a facet.
- During indexing, CloudSearch processes the contents of text and text-array fields according to the **language-specific analysis scheme** configured for the field. An analysis scheme controls how the text is  normalized, tokenized, and stemmed, and specifies any stopwords or  synonyms to take into account during indexing. CloudSearch provides  default analysis schemes for each supported language.
- You can customize how search results are ranked by defining expressions  that calculate custom values for every document that matches your search criteria.
- To make your data searchable, you need to format your data in JSON or XML.  Each item that you want to be able to receive as a search result is  represented as a document. Every document has a unique document ID and  one or more fields that contain the data that you want to search and  return in results.
- You can specify a variety of options to constrain your search, request  facet information, control ranking, and specify what you want to be  returned in the results. You can get search results in either JSON or  XML. By default, CloudSearch returns results in JSON.
- By default, CloudSearch returns search results ranked according to the hits’ *relevance _scores*. A document’s *relevance _score* indicates how relevant a particular search hit is to the search request.

### **Scaling**

- **Scaling for Traffic** (domain depth) – When a search instance nears its maximum load,  CloudSearch deploys a duplicate search instance to provide additional  processing power. When traffic drops, it removes search instances to  minimize costs. 
- **Scaling for Data** (domain width) – When the amount of data you add to your domain exceeds the capacity of the initial search instance type, CloudSearch scales  your search domain to a larger search instance type. After a domain  exceeds the capacity of the largest search instance type, CloudSearch  partitions the search index across multiple search instances. When the  volume of data in your domain shrinks, it scales down your domain to  fewer search instances or a smaller search instance type to minimize  costs.

### **Fault Tolerance**

- You can expand a CloudSearch domain to an additional AZ in the same region  to increase fault tolerance in the event of a service disruption.
- When you turn on the Multi-AZ option, CloudSearch provisions and maintains  extra instances for your search domain in a second AZ to ensure high  availability. The maximum number of AZs a domain can be deployed in is  two.

### **Monitoring**

- You can retrieve information about each of your search domains through CloudSearch Console, AWS CLI or SDK.
- Monitor a domain using CloudWatch.
- Log API calls made to CloudSearch using CloudTrail.

### **Pricing**

- Customers are billed according to their monthly usage across the following dimensions:
  - Search instances
  - Document batch uploads
  - IndexDocuments requests
  - Data transfer

Sources:
 https://docs.aws.amazon.com/cloudsearch/latest/developerguide/
 https://aws.amazon.com/cloudsearch/pricing/
 https://aws.amazon.com/cloudsearch/faqs/