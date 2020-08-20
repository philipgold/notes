# AWS Directory Service

## For Microsoft Active Directory

- Also known as **AWS Managed Microsoft AD**, the service enables your directory-aware workloads and AWS resources to use **managed Active Directory** in the AWS Cloud.
- The service is built on actual Microsoft Active Directory and powered by Windows Server 2012 R2.
- AWS Managed Microsoft AD is your best choice if you need actual Active  Directory features to support AWS applications or Windows workloads, including Amazon RDS for Microsoft SQL Server. It’s also best if you want a standalone AD in the Cloud that supports Office 365 or you need an LDAP directory to support your Linux applications.
- Concepts:
  - AWS Managed Microsoft AD provides multiple directory choices for customers who want to use existing Microsoft AD or Lightweight Directory Access  Protocol (LDAP)–aware applications in the cloud.
  - When you create a directory, AWS Directory Service creates two domain controllers and adds the DNS service on your behalf. The domain controllers are created in different subnets in a VPC
  - When creating a directory, you need to provide some basic information such  as a fully qualified domain name (FQDN) for your directory,  Administrator account name and password, and the VPC you want the  directory to be attached to.
  - AWS does not provide Windows PowerShell access to directory instances, and  it restricts access to directory objects, roles, and groups that require elevated privileges. 
  - AWS Managed Microsoft AD does not allow direct host access to domain controllers via Telnet, Secure Shell (SSH), or Windows Remote Desktop  Connection. 
  - When you create an AWS Managed Microsoft AD directory, you are assigned an organizational unit (OU) and an administrative account with delegated administrative rights for the OU.
  - AWS Managed Microsoft AD directories are deployed across **two Availability Zones in a region** by default and connected to your Amazon VPC.
  - You cannot configure the storage, CPU, or memory parameters of your AWS Managed Microsoft AD directory.
- Active Directory Schema
  - A **schema** is the definition of attributes and classes that are part of a  distributed directory and is similar to fields and tables in a database. Schemas include a set of rules which determine the type and format of  data that can be added or included in the database.
  - Attributes, classes and objects are the basic elements that are used to build object definitions in the schema.
    - Each schema attribute, which is similar to a field in a database, has  several properties that define the characteristics of the attribute.
    - The classes are analogous to tables in a database and also have several properties to be defined.
    - Each class and attribute must have an Object ID that is unique for all of  your objects. Software vendors must obtain their own Object ID to ensure uniqueness.
    - Some attributes are linked between two classes with forward and back links,  such as groups. A group shows you the members of the group; while a  member shows what groups it belongs to.
- Features
  - AWS Managed Microsoft AD is deployed in HA and across multiple Availability Zones. You can also scale out your directory by deploying additional  domain controllers.
  - AWS Managed Microsoft AD runs on AWS managed infrastructure with monitoring that automatically detects and replaces domain controllers that fail.
  - Data replication and automated daily snapshots are configured for you. 
  - You can integrate AWS Managed Microsoft AD easily with your existing Active Directory by using **Active Directory trust relationships**.
  - Allows seamless domain join for new and existing Amazon EC2 for Windows Server instances.
  - AWS Managed Microsoft AD can also provide a single directory for all kinds of workloads (EC2, RDS, WorkSpaces, etc).
  - The service supports schema extensions that you submit to the service in the form of a LDAP Data Interchange Format (LDIF) file.
  - You can configure Amazon SNS to receive email and text messages when the status of your AWS Directory Service changes.
  - You can configure SAML 2.0–based authentication with cloud applications using AWS Directory Service.
  - You can use AWS Managed Microsoft AD as a resource forest that contains  primarily computers and groups with trust relationships to your  on-premises directory. This enables your users to access AWS  applications and resources with their on-premises AD credentials.
- Microsoft AD Prerequisites
  - A VPC with at least two subnets. Each of the subnets must be in a different Availability Zone.
  - The necessary ports for the domain controllers that AWS Directory Service  creates for you should be open to allow them to communicate with each  other.
  - The VPC must have default hardware tenancy.
  - AWS Directory Service does not support using NAT with Active Directory.
- Two Editions of AWS Managed Microsoft AD
  - Both Standard Edition and Enterprise Edition can be used as your organization’s primary directory to manage users, devices, and  computers. 
  - You also can use both editions to create resource forests and extend your on-premises AD to the AWS Cloud. **Resource forests** use a trust relationship with your on-premises AD to enable you to  access AWS applications and resources with your on-premises AD  credentials.
  - Both editions also support the creation of additional domain controllers to improve the redundancy and performance of your managed directory.
  - Unique to Standard Edition
    - Optimized to be a primary directory for small and midsize businesses with up to 5,000 employees. 
    - Provides you enough storage capacity to support up to approximately 30,000  directory objects, such as users, groups, and computers.
  - Unique to Enterprise Edition
    - Designed to support enterprise organizations with up to approximately 500,000 directory objects.
- Seamless Domain Joins
  - **Seamless domain join** is a feature that allows you to join your Amazon EC2 for Windows Server instances seamlessly to a domain, at the time of launch and from the  AWS Management Console. You can join instances to AWS Managed Microsoft  AD that you launch in the AWS Cloud.
  - You cannot use the seamless domain join feature from the AWS Management Console for **existing EC2 for Windows Server** instances, but you can join existing instances to a domain using the EC2 API or by using PowerShell on the instance.
- Security and Monitoring
  - AWS Managed Microsoft AD is both HIPAA and PCI DSS compliant.
  - Manage users and devices by using native Active Directory Group Policy objects (GPOs).
  - AWS Managed Microsoft AD uses the same Kerberos-based authentication as Active Directory to deliver Single Sign-On (SSO).
  - AWS Managed Microsoft AD supports federation access for users and groups to the AWS Management Console.
  - Amazon EBS volumes used in the directory service are encrypted.
- Pricing
  - You pay only for the type and size of the managed directory that you use.
  - AWS Managed Microsoft AD allows you to use a directory in one account and  share it with multiple accounts and VPCs. There is an hourly sharing  charge for each additional account to which you share a directory.

 

## Active Directory Connector

- A **proxy service** that provides an easy way to connect compatible AWS applications, such  as Amazon WorkSpaces, Amazon QuickSight, and Amazon EC2 for Windows Server instances, to your existing on-premises Microsoft Active Directory.
- AD Connector is your best choice when you want to use your existing on-premises directory with compatible AWS services.
- Features
  - When users log in to the AWS applications, AD Connector forwards sign-in requests to your on-premises Active Directory domain controllers for  authentication.
  - You can also join your EC2 Windows instances to your on-premises Active  Directory domain through AD Connector using seamless domain join.
  - AD Connector is NOT compatible with RDS SQL Server.
  - AD Connector comes in two sizes, small and large. 
  - You can spread application loads across multiple AD Connectors to scale to  your performance needs. There are no enforced user or connection limits.
- AD Connector Prerequisites
  - You need to have a VPC with at least two subnets. Each of the subnets must be in a different Availability Zone.
  - The VPC must be connected to your existing network through a virtual private network (VPN) connection or AWS Direct Connect.
  - The VPC must have default hardware tenancy.
  - Your user accounts must have Kerberos pre-authentication enabled.

 

## Simple AD

- A **standalone Microsoft Active Directory–compatible** directory from AWS Directory Service that is powered by **Samba 4**. 
- You can use Simple AD as a standalone directory in the cloud to support Windows workloads that need basic AD features, compatible AWS  applications, or to support Linux workloads that need LDAP service.
- Features
  - Simple AD supports basic Active Directory features such as user accounts, group memberships, joining a Linux domain or Windows based EC2  instances, Kerberos-based SSO, and group policies. 
  - AWS provides monitoring, daily snapshots, and recovery as part of the service.
  - Simple AD is compatible with the following AWS applications: Amazon WorkSpaces, Amazon WorkDocs, Amazon QuickSight, and Amazon WorkMail.
  - You can also sign in to the AWS Management Console with Simple AD user accounts.
  - Simple AD does NOT support multi-factor authentication, trust relationships, DNS dynamic update, schema extensions, communication over LDAPS, PowerShell AD cmdlets, or FSMO role transfer. 
  - Simple AD is NOT compatible with RDS SQL Server.
  - Simple AD is available in two sizes:
    - Small – Supports up to 500 users
    - Large – Supports up to 5,000 users
- Simple AD Prerequisites
  - Your VPC should have at least two subnets. For Simple AD to install  correctly, you must install your two domain controllers in separate  subnets that must be in a different Availability Zone. In addition, the  subnets must be in the same Classless Inter-Domain Routing (CIDR) range.
  - The necessary ports for the domain controllers that AWS Directory Service  creates for you should be open to allow them to communicate with each  other.
  - The VPC must have default hardware tenancy.
- When you create a directory with Simple AD, AWS Directory Service performs the following tasks on your behalf:
  - Sets up a Samba-based directory within the VPC.
  - Creates a directory administrator account with the user name ‘*Administrator*’ and the specified password. You use this account to manage your directory.
  - Creates a security group for the directory controllers.
  - Creates an account that has domain admin privileges.
- Simple AD forwards DNS requests to the IP address of the Amazon-provided DNS  servers for your VPC. These DNS servers will resolve names configured in your Route 53 private hosted zones

 

## Amazon Cloud Directory

- A **cloud-native directory** that can store hundreds of millions of application-specific objects  with multiple relationships and schemas. Use Amazon Cloud Directory if  you need a **highly scalable directory store** for your application’s **hierarchical data**.
- You can organize directory objects into multiple hierarchies to support  many organizational pivots and relationships across directory  information.
- Concepts
  - A schema is a collection of facets that define what objects can be created in a directory and how they are organized. 
  - A schema also enforces data integrity and interoperability. 
  - A single schema can be applied to more than one directory at a time. 
  - Amazon Cloud Directory supports uploading of a compliant **JSON file for schema creation**. 
  - A directory is a schema-based data store that contains specific types of objects organized in a multi-hierarchical structure.
  - Before you can create a directory in Amazon Cloud Directory, AWS Directory  Service requires that you first apply a schema to it. A directory cannot be created without a schema and typically has one schema applied to it.

Sources:

* https://aws.amazon.com/directoryservice/features/?nc=sn&loc=2
* https://aws.amazon.com/directoryservice/pricing/?nc=sn&loc=3
* https://aws.amazon.com/directoryservice/faqs/?nc=sn&loc=5
* https://docs.aws.amazon.com/clouddirectory/latest/developerguide/what_is_cloud_directory.html
* https://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html
* https://docs.aws.amazon.com/clouddirectory/latest/developerguide/what_is_cloud_directory.html