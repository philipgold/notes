# Service Control Policies (SCP) vs IAM Policies



## Service Control Policies (SCP)

* SCPs are mainly used along with AWS Organizations' organizational units (OUs).

* SCPs do not replace IAM Policies such that they do not provide actual permissions. To perform an action, you would still need to grant appropriate IAM Policy permissions.

* Even if a Principal is allowed to perform a certain action (granted through IAM Policies), an attached SCP will override that capability if it enforces a Deny on that action.

* SCP takes precedence over IAM Policies.

* SCPs can be applied to the root of an organization or to individual accounts in an OU.

* When you apply an SCP to an OU or an individual AWS account, you choose to either enable (whitelist) or disable (blacklist) the specified AWS service. 

  Access to any service that isn't explicitly allowed by the SCPs associated with an account, its parent OUs, or the master account is denied to the AWS account or OUs associated with the SCP.

* Any account has only those permissions permitted by every parent above it. If permission is blocked at any level above the account, either implicitly (by not being included in an Allow policy statement) or explicitly (by being included in a Deny policy statement), a user or role in the affected account can't use that permission, even if there is an attached IAM policy granting Administrator permissions to the user.

* SCPs affect only principals that are managed by accounts that are part of the organization.



## IAM Policies

* IAM Policies operate at the Principal level. There are two types of IAM policies:

  * Identity-based policies-attached to an IAM user, group, or role.
  * Resource-based policies - attached to an AWS resource such as an S3 bucket.

* IAM Policies can grant/deny Principal permission to perform certain actions to certain resources. This can be used together with SCP to ensure stricter controls in AWS Organizations.

  An IAM policy can be applied only to IAM users, groups, or roles, and it can never restrict the root identity of the AWS account. 

* IAM Policies cannot be attached to OUs.

* An IAM Policy can allow or deny actions. An explicit allow overrides an implicit deny. An explicit deny overrides an explicit allow. 



**References:**

https://aws.amazon.com/premiumsupport/knowledge-center/iam-policy-service-control-policy/