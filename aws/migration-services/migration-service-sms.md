# AWS Server Migration Service (SMS)

- An **agentless service for migrating** thousands of on-premises workloads to AWS. This is the enhanced replacement of Amazon EC2 VM Import service.
- SMS orchestrates server migrations by:
  - automating incremental replication of live server volumes to the AWS cloud
  - allowing customers to schedule replications 
  - track the replication progress of a group of servers via Management Console
- Each server volume replicated is saved as **a new Amazon Machine Image (AMI)**, which can be launched as an EC2 instance in the AWS cloud. If you are  using application groupings, Server Migration Service will launch the  servers in **a CloudFormation stack** using an auto-generated CloudFormation template.
- AWS SMS creates **a new EBS snapshot** with every replication.  It replicates server volumes from your  on-premises environment to S3 temporarily and purges them from S3 right  after creating EBS snapshots.
- You can migrate virtual machines from VMware vSphere and Windows Hyper-V to AWS.
- You can replicate your on-premises servers to AWS for up to 90 days (per  server). After that, your replication job will be automatically  terminated. This duration can be increased by submitting a request to  AWS.
- Customers are able to migrate large volumes up to 16 TB.
- AWS Server Migration Service Connector
  - A pre-configured FreeBSD virtual machine (in OVA format). You need to  first deploy the SMS Connector virtual appliance on each of your  on-premises VMware vCenter environment to use AWS SMS.
  - The AWS Server Migration Service Connector supports password-based proxy, but not NTLM-based proxy.
  - The SMS Connector can be configured to use SCVMM or standalone Hyper-V VMs.
  - You need two separate SMS Connectors to simultaneously migrate VMs from both VMware and Hyper-V environments.

- AWS Server Migration Service offers **multi-server migration support** as well. You can migrate entire application stacks rather than migrating  each server individually. This is done through an auto-generated  CloudFormation template (non-modifiable).
- AWS Server Migration Service has the ability to resume failed replication  jobs, allowing you to take remedial action and resume the replication  from the point it failed, as opposed to restarting the job. This adds  resiliency to the migration process and allows you to complete  large-scale server migrations in an efficient and timely manner.
- Security
  - Replicated server volumes are encrypted in transit by TLS.
  - AWS SMS Connector only captures **basic VM inventory information and snapshots of server volumes** from VMware vCenter and does not gather any sensitive information.
- Pricing
  - You incur charges with every S3 usage and EBS snapshot created by AWS SMS.

Sources:
 https://aws.amazon.com/server-migration-service/
 https://aws.amazon.com/server-migration-service/pricing/?nc=sn&loc=2
 https://aws.amazon.com/server-migration-service/faqs/?nc=sn&loc=5