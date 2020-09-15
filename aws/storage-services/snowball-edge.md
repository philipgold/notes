# AWS Snowball Edge

- A type of Snowball device with on-board storage and compute power for  select AWS capabilities. It can undertake local processing and  edge-computing workloads in addition to transferring data between your  local environment and the AWS Cloud.
- Has on-board S3-compatible storage and compute to support running Lambda functions and EC2 instances.
- Options for device configurations
  - **Storage optimized – this option has the most storage capacity at up to 80 TB of useable  storage space, 24 vCPUs, and 32 GiB of memory for compute functionality. You can transfer up to 100 TB with a single Snowball Edge Storage Optimized device.**
  - **Compute optimized – this option has the most compute functionality with 52 vCPUs, 208 GiB of memory, and 7.68 TB of dedicated NVMe SSD storage for instances.  This option also comes with 42 TB of additional storage space.**
  - Compute Optimized with GPU – identical to the compute optimized option, save for an installed GPU, equivalent to the one available in the P3 Amazon EC2 instance type.

- ### Features

  - Network adapters with transfer speeds of up to 100 GB/second.
  - Encryption is enforced, protecting your data at rest and in physical transit.
  - You can import or export data between your local environments and S3.
  - Snowball Edge devices come with an on-board LCD display that can be used to  manage network connections and get service status information.
  - You can cluster Snowball Edge devices for local storage and compute jobs to achieve 99.999 percent data durability across 5–10 devices, and to  locally grow and shrink storage on demand.
  - You can use the file interface to read and write data to a Snowball Edge  device through a file share or Network File System (NFS) mount point.
  - You can write Python-language Lambda functions and associate them with S3 buckets when you create a Snowball Edge  device job. Each function triggers whenever there’s a local S3 *PUT* object action executed on the associated bucket on the appliance.
  - Snowball Edge devices have S3 and EC2 compatible endpoints available, enabling programmatic use cases.
  - Customers who need to run Amazon EC2 workloads on AWS Snowball Edge devices can  attach multiple persistent block storage volumes to their Amazon EC2  instances.
  - For latency-sensitive applications such as machine learning, you can deploy a **performance-optimized SSD volume (sbp1)**. Performance optimized volumes on the Snowball Edge Compute Optimized  device use NVMe SSD, and on the Snowball Edge Storage Optimized device  they use SATA SSD. Alternatively, you can use capacity-optimized **HDD volumes (sbg1)** on any Snowball Edge.

- ### Snowball vs Snowball Edge

  - (View AWS Migration CheatSheet: Snowball: Snowball vs Snowball Edge section)

- ### Job Types

  - **Import To S3** – transfer of 80 TB or less of your local data copied onto a single device, and then moved into S3.
    - Snowball Edge devices and jobs have a one-to-one relationship. Each job has  exactly one device associated with it. If you need to import more data,  you can create new import jobs or clone existing ones.
  - **Export From S3** – transfer of any amount of data located in S3, copied onto any number  of Snowball Edge devices, and then move one Snowball Edge device at a  time into your on-premises data destination. 
    - When you create an export job, it’s split into job parts. Each job part is  no more than 100 TB in size, and each job part has exactly one Snowball  Edge device associated with it.
  - **Local Compute and Storage Only** – these jobs involve one Snowball Edge device, or multiple devices used in a cluster. This job type is only for local use. 
    - A **cluster job** is for those workloads that require increased data durability and  storage capacity. Clusters have anywhere from 5 to 10 Snowball Edge  devices, called **nodes**. 
    - A cluster offers increased durability and increased storage  over a standalone Snowball Edge for local storage and compute.

- ### Recommendations

  - Files should be in a static state while being written to the device.
  - The *Job created* status is the only status in which you can cancel a job. When a job changes to a different status, it can’t be canceled.
  - All files transferred to a Snowball be no smaller than 1 MB in size.
  - Perform multiple write operations at one time by running each command from  multiple terminal windows on a computer with a network connection to a  single Snowball Edge device.
  - Transfer small files in batches.

- ### Security

  - All data transferred to a device is protected by SSL encryption over the network. 
  - To protect data at rest, Snowball Edge uses server side-encryption.
  - Access to Snowball Edge requires credentials that AWS can use to authenticate  your requests. Those credentials must have permissions to access AWS  resources, such an Amazon S3 bucket or an AWS Lambda function.

- ### Pricing

  - You are charged depending on the type of Snowball Edge machine you choose (storage optimized or compute optimized).
  - You are charged based on what you select for your term of use: On demand, a 1-year commitment, or a 3-year commitment.
  - For on-demand use, you pay a service fee per data transfer job, which  includes 10 days of on-site Snowball Edge device usage. Shipping days,  including the day the device is received and the day it is shipped back  to AWS, are not counted toward the 10 days. If the device is kept for  more than 10 days, you will incur an additional fee for each day beyond  10 days.
  - There is a one-time setup fee per job ordered through the console.

- ### Limits

  - Each data transferred must have a maximum size of 5 terabytes.
  - Jobs must be completed within 120 days of the Snowball Edge device being prepared.
  - The default service limit for the number of AWS Snowball Edge devices you can have at one time is 1.
  - If you allocate the minimum recommendation of 128 MB of memory for each of your functions, you can have up to seven Lambda functions in a single  job. (Limited because of physical limits)

Sources: 

* https://aws.amazon.com/snowball-edge/features/
* https://aws.amazon.com/snowball-edge/pricing/
* https://aws.amazon.com/snowball-edge/faqs/