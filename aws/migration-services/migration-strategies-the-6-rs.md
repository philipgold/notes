# AWS Migration Strategies – The 6 R’s

![AWS Cloud Migration](https://k2y3h8q6.stackpathcdn.com/wp-content/uploads/2019/05/AWS-Cloud-Migration.jpg)

- The 6 R’s
  - **Rehost** (“lift and shift”)
    - Move applications to AWS without changes. In large-scale, legacy migrations, organizations are looking to move quickly to meet business objectives.
    - Applications may become easier to re-architect once they are already running in the  cloud. This happens because the hard part, which is migrating the application, data, and traffic, has already been accomplished.
  - **Replatform** (“lift, tinker and shift”)
    - You are making a few cloud optimizations in order to achieve some tangible  benefit without changing the core architecture of the application.
    - Replatforming Tools
      1. Amazon Relational Database Service (RDS) for relational databases – AWS  manages the database application for you, so you can focus on the  application of the database itself
      2. AWS Elastic Beanstalk – a fully managed platform where you can simply  deploy your code, and AWS will handle scaling, load balancing,  monitoring, database and compute provisioning for you
  - **Repurchase** (“drop and shop”)
    - Move from perpetual licenses to a software-as-a-service model. For workloads that can easily be upgraded to newer versions, this strategy might  allow a feature set upgrade and smoother implementation.
    - For example, you will discontinue using your local VPN solution and instead purchase a commercial VPN software from AWS Marketplace such as OpenVPN for AWS.
  - **Refactor / Re-architect**
    - Re-imagine how the application is architected and developed using cloud-native features.
    - Typically, this is driven by a strong business need to add features, scale, or  performance that would otherwise be difficult to achieve in the  application’s existing environment. 
    - This migration strategy is often the most expensive solution.
  - **Retire**
    - Identify IT assets that are no longer useful and can be turned off. This will  help boost your business case and direct your attention towards  maintaining the resources that are widely used.
  - **Retain**
    - Retain portions of your IT portfolio if there are some applications that are  not ready to be migrated and will produce more benefits when kept  on-premises, or you are not ready to prioritize an application that was  recently upgraded and then make changes to it again.

- The following strategies are arranged in increasing order of complexity —  this means that the time and cost required to enact the migration will  be proportional to the increase, but will provide greater opportunity  for optimization
  - Retire(simples) < Retain < Rehost < Repurchase < Replatform < Re-architect/Refactor (most complex)

- Consider a phased approach to migrating applications, prioritizing business  functionality in the first phase, rather than attempting to do it all in one step.
- General Migration Tools
  - **AWS Migration Hub** – provides a single location to track the progress of application  migrations across multiple AWS and partner solutions. Using Migration  Hub allows you to choose the AWS and partner migration tools that best  fit your needs, while providing visibility into the status of migrations across your portfolio of applications.
  - **AWS Application Discovery Service** – collects and presents configuration, usage, and behavior data from your servers to help you plan your migration.
  - **AWS Server Migration Service (SMS)** – an agentless service for migrating thousands of on-premises workloads to AWS.
  - **AWS Database Migration Service (DMS)** – helps you migrate databases to AWS. The source database remains fully operational during the migration.
  - **AWS Snowball** – a petabyte-scale data transport solution that uses secure appliances to transfer large amounts of data into and out of AWS.
  - **AWS Snowmobile** – an exabyte-scale data transfer service used to move extremely large amounts of data to AWS.
  - **AWS Direct Connect** – lets you establish a dedicated network connection line between your network and one of the AWS Direct Connect locations.
  - **Amazon Kinesis Firehose** – a fully managed service for loading streaming data into AWS.
  - **AWS Marketplace** – where you can purchase different types of softwares and licenses offered by AWS Partners and other AWS Users.

Sources:
 https://aws.amazon.com/cloud-migration/
 https://aws.amazon.com/blogs/enterprise-strategy/6-strategies-for-migrating-applications-to-the-cloud/
 https://d1.awsstatic.com/whitepapers/Migration/aws-migration-whitepaper.pdf

