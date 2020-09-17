# AWS IAM Role

- IAM role is very similar to a user, in  that it is an identity with permission policies that determine what the  identity can and cannot do in AWS.
- IAM role is not intended to be uniquely associated with a particular user, group or service and is intended to be assumable by anyone who  needs it.
- Role does not have any credentials (password or access keys)  associated with it and whoever assumes the role is provided with a  dynamic temporary credentials
- Role helps in access delegation to grant permissions to someone that allows access to resources that you control
- Roles can help to prevent accidental access to or modification of sensitive resources
- Modification of a Role can be done anytime and the changes are  reflected across all the entities associated with the Role immediately
- IAM Role plays a very important role in the following scenarios:
  - Services like EC2 instance running an application that needs to access other AWS services
  - Allowing users from different AWS accounts have access to AWS resources in different account, instead of having to create users
  - Company uses a Corporate Authentication mechanism and don’t want the User to authenticate twice or create duplicate users in AWS
  - Applications allowing login through external authentication mechanism *e.g. Amazon, Facebook, Google etc*
- Role can be assumed by
  - IAM user within the same AWS account
  - IAM user from a different AWS account
  - AWS service such as EC2, EMR to interact with other services
  - An external user authenticated by an external identity provider  (IdP) service that is compatible with SAML 2.0 or OpenID Connect (OIDC), or a custom-built identity broker.
- Role involves defining two policies
  - **Trust policy**
    - Trust policy defines – who can assume the role
    - Trust policy involves setting up a trust between the account that  owns the resource (trusting account) and the account who owns the user  that needs access to the resources (trusted account)
  - **Permissions policy**
    - Permissions policy defines – what they can access
    - Permissions policy determines authorization, which grants the user  of the role with the needed permissions to carry out the desired tasks  on the resource
- **Federation** is creating a trust relationship between an external Identity Provider (IdP) and AWS
  - Users can also sign in to an enterprise identity system that is compatible with SAML
  - Users can sign in to a web identity provider, such as Login with  Amazon, Facebook, Google, or any IdP that is compatible with OpenID  connect (OIDC).
  - When using OIDC and SAML 2.0 to configure a trust relationship  between these external identity providers and AWS, the user is assigned  to an IAM role and receives temporary credentials that enables the user  to access AWS resources
- **IAM Best Practice** – Use roles for applications running on EC2 instances
- **IAM Best Practice** – Delegate using roles instead of sharing credentials



## AWS STS & Temporary Credentials

- AWS Security Token Service (STS) helps create and provide  trusted users with temporary security credentials that control access to AWS resources
- STS is a global service with a single endpoint https://sts.amazonaws.com
- AWS STS API calls can be made either to a global endpoint or to one  of the regional endpoints. Regional endpoint can help reduce latency and improve the performance of the API calls
- Temporary Credentials are similar to Long Term Credentials except for
  - are short term and are regularly rotated
  - can be configured to last from few minutes to several hours
  - do not have to be embedded or distributed
  - are not stored or attached with the User, but are generated dynamically and provided to the user as and when requested

## Role types

### AWS Service Roles

- Some AWS services need to interact with other AWS services *for e.g. EC2 interacting with S3, SQS etc*
- Best practice is to assign these services with IAM roles instead  of embedding or passing IAM user credentials directly into an instance,  because distributing and rotating long-term credentials to multiple  instances is challenging to manage and a potential security risk.
- AWS automatically provides temporary security credentials for these services *e.g. Amazon EC2 instance* to use on behalf of its applications
- Deleting a role or instance profile that is associated with a  running EC2 instance will break any applications running on the instance

#### **Complete Process Flow**

1. Create a IAM role with services who would use it *for e.g. EC2* as trusted entity and define permission policies with the access the service needs
2. Associated a Role (actually an Instance profile) with the EC2 service when the instance is launched
3. Temporary security credentials are available on the instance and are automatically rotated before they expire so that a valid set is always  available
4. Application can retrieve the temporary credentials either using the [Instance metadata](https://jayendrapatil.com/aws-ec2-instance-metadata-userdata/) directly or through AWS SDK
5. Applications running on the EC2 instance can now use the permissions defined in the Role to access other AWS resources
6. Application, if caching the credentials, needs to make sure it uses the correct credentials before they expire

#### Instance Profile

- An instance profile is a container for an IAM role that you can  use to pass role information to an EC2 instance when the instance  starts.
- If a Role is created for EC2 instance or any other service that uses EC2 through AWS Management Console, AWS creates a Instance profile  automatically with the same name as the Role. However, if the Role is  created through CLI the instance profile needs to created as well
- An instance profile can contain only one IAM role. However, a role can be included in multiple instance profiles.

### Cross-Account access Roles

- IAM users can be granted permission to switch roles within the  same AWS account or to roles defined in other AWS accounts that you own.
- Roles can also be used to delegate permissions to IAM users from AWS accounts owned by Third parties
  - You must explicitly grant the users permission to assume the role.
  - Users must actively switch to the role using the AWS Management Console.
  - Multi-factor authentication (MFA) protection can be enabled for the  role so that only users who sign in with an MFA device can assume the  role
- However, only One set of permissions are applicable at a time. User who assumes a role temporarily gives up his or her own permissions and instead takes on the permissions of the role. When the user exits, or stops using the role, the original user permissions are restored.

#### Complete Process Flow

![IAM Role - Cross Account Access](https://docs.aws.amazon.com/IAM/latest/UserGuide/images/roles-usingroletodelegate.png)

1. Trusting account creates a IAM Role with a
   - Trust policy which defines the account (trusted account) as a principal who can access the resources and a
   - Permissions policy to define what resources can the user in the trusted account access
2. Trusting account provides the Account ID and the Role name (or the ARN) to the trusted account
3. If the Trusting account is own by Third Party it can optionally  provide an External ID (recommended for additional security), required  to uniquely identify the trusted account, which can be added to the  trust policy as a condition
4. Trusted account creates a IAM user who has permissions (Permission to call the AWS Security Token Service (AWS STS) ***AssumeRole*** API for the role) to assume the role/switch to the role.
5. IAM User in the Trusted account switches to the Role/assumes the role and passes the ARN of the role
6. Trusted account belonging to the Third party would also pass the External ID mapped to the Trusting account
7. *AWS STS verifies the request for the role ARN, External ID if any and if it is from the trusted resource  matching the roles’s trust policy and*
8. AWS STS upon successful verification returns temporary credentials
9. Temporary credentials allow the user to access the resources of the Trusting account
10. When the user exits the role, the user’s permissions revert to the original permissions held before switching to the role

#### External ID and Confused Deputy Problem

- External ID allows the user that is assuming the role to assert the circumstances in which they are operating.
- External ID provides a way for the account owner to permit the role  to be assumed only under specific circumstances and prevents  an unauthorized customer from gaining access to your resources
- Primary function of the external ID is to address and prevent the `confused deputy` problem.

##### **Confused Deputy Problem**

![Confused Deputy Problem](https://jayendrapatil.com/wp-content/uploads/2016/03/screen-shot-2016-03-31-at-2-54-24-pm.png)

1. Example Corp’s AWS Account provides the services (access,  analyze and process data and provide back reports) to multiple different AWS accounts
2. Preferred mechanism is to have each AWS account customer define a Role which Example Corp’s AWS Account users can assume and act upon
3. You provide Example Corp’s AWS Account access to your AWS account through Role and providing Role ARN
4. Example Corp when working on your account assumes the IAM role and provides the ARN with the request
5. As Example Corp is already trusted by your account it will received  the temporary security credentials and gain access to your resources
6. If an other AWS account is able to know or guess your ARN (Role with Account ID), it can provide the same to Example Corp
7. Example Corp’s would use the ARN (belonging to your AWS account) to  process the data but would provide the same data to the other AWS  account
8. This form of privilege escalation is known as the confused deputy problem

**Address Confused Deputy Problem using External ID**

![Address Confused Deputy Problem using External ID](https://jayendrapatil.com/wp-content/uploads/2016/03/screen-shot-2016-03-31-at-3-52-30-pm.png)

1. Using External ID, Example Corp’s generates a unique  External ID for each of its Customer which is known only to them and is  kept secret
2. Example Corp provides you an External ID which needs to added as a condition while defining the trust policy
3. You provide Example Corp’s AWS Account access to your AWS account through Role and providing Role ARN
4. Example Corp when working on your account uses the IAM role and  provides the ARN along with the External ID and as it is already trusted would be able to gain access
5. Other AWS account registered with Example Corp would have a Unique External ID assigned to it
6. If the Other AWS account is able to know or guess your ARN (Role with Account ID), it can provide the same to Example Corp
7. Example Corp’s would request access to your Account using the ARN  (belonging to your AWS account) but with the External ID belonging to  Other AWS account as the request was made on its behalf
8. As the External ID provided by Example Corp does not match the  condition defined in the Role trust policy, the authentication would  fail and hence denied access

### STS Important APIs
* **AssumeRole**: access a role within your account or cross-account
* **AssumeRoleWithSAML**: return credentials for users logged with SAML
* **AssumeRoleWithWebIdentity**: return creds for users logged with an IdP 
  *  Example providers include Amazon Cognito, Login with Amazon, Facebook, Google, or any OpenID Connect-compatible identity provider
  * **AWS recommends using Cognito instead**
* **GetSessionToken**: for MFA, from a user or AWS account root user
* **GetFederationToken**: obtain temporary creds for a federated user, usually a proxy app that will give the creds to a distributed app inside a corporate network

## Identity Providers and Federation

Refer to about [IAM Role – Identity Providers and Federation](./iam-role-identity-providers-federation.md)
