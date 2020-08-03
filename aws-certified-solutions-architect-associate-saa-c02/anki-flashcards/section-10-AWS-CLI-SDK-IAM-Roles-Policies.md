# Section 10: AWS CLI, SDK, IAM Roles & Policies

## AWS EC2 Instance Metadata

- AWS EC2 Instance Metadata is powerful but one of the least known features to developers
- It allows AWS EC2 instances to ”learn about themselves” **without using an IAM Role for that purpose.**

- The URL is http://169.254.169.254/latest/meta-data
- You can retrieve the IAM Role name from the metadata, but you CANNOT retrieve the IAM Policy.

- Metadata = Info about the EC2 instance
- Userdata = launch script of the EC2 instance



## AWS SDK Credentials Security

- It’s recommend to use the default credential provider chain

- The **default credential provider chain** works seamlessly with:

  * AWS credentials at ~/.aws/credentials (only on our computers or on premise) 
  * Instance Profile Credentials using IAM Roles (for EC2 machines, etc...)
  * Environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)

- **Overall, NEVER EVER STORE AWS CREDENTIALS IN YOUR CODE.**

- **Best practice is for credentials to be inherited from mechanisms above, and**

  **100% IAM Roles if working from within AWS Services**

## Exponential Backoff

* Any API that fails because of too many calls needs to be retried with Exponential Backoff

* These apply to rate limited API

* Retry mechanism included in SDK API calls

  ![image-20200712170930640](./images/image-20200712170930640.png)

