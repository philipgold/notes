# AWS Lambda

- A serverless compute service.
- Lambda executes your code only when needed and scales automatically.
- Lambda functions are stateless – no affinity to the underlying infrastructure.
- You choose the amount of memory you want to allocate to your functions and AWS Lambda allocates proportional CPU power, network bandwidth, and disk I/O.
- AWS Lambda is SOC, HIPAA, PCI, ISO compliant.
- Natively supports the following languages:
  - Node.js
  - Java
  - C#
  - Go
  - Python
  - Ruby
- You can also provide your own custom runtime.

### **Components of a Lambda Application**

- **Function** – a script or program that runs in Lambda. Lambda passes invocation events to your function. The function processes an event and returns a response.
- **Runtimes** – Lambda runtimes allow functions in different languages to run in the same base execution environment. The runtime sits in-between the Lambda service and your function code, relaying invocation events, context information, and responses between the two.
- **Layers** – Lambda layers are a distribution mechanism for libraries, custom runtimes, and other function dependencies. Layers let you manage your in-development function code independently from the unchanging code and resources that it uses.
- **Event source** – an AWS service or a custom service that triggers your function and executes its logic.
- **Downstream resources** – an AWS service that your Lambda function calls once it is triggered.
- **Log streams** – While Lambda automatically monitors your function invocations and reports metrics to CloudWatch, you can annotate your function code with custom logging statements that allow you to analyze the execution flow and performance of your Lambda function.
- AWS Serverless Application Model

**Introduction to AWS Lambda & Serverless Applications**

https://youtu.be/EBSdyoO3goc

### **Lambda Functions**

- You upload your application code in the form of one or more *Lambda functions*. Lambda stores code in Amazon S3 and encrypts it at rest.
- To create a Lambda function, you first package your code and dependencies in a deployment package. Then, you upload the deployment package to create your Lambda function.
- After your Lambda function is in production, Lambda automatically monitors functions on your behalf, reporting metrics through Amazon CloudWatch.
- Conﬁgure **basic function** **settings** including the description, memory usage, execution timeout, and role that the function will use to execute your code.
- **Environment variables** are always encrypted at rest, and can be encrypted in transit as well.
- **Versions and aliases** are secondary resources that you can create to manage function deployment and invocation.
- A **layer** is a ZIP archive that contains libraries, a custom runtime, or other dependencies. Use layers to manage your function’s dependencies independently and keep your deployment package small.
- You can configure a function to mount an Amazon EFS file system to a local directory. With Amazon EFS, your function code can access and modify shared resources securely and at high concurrency.

### **Invoking Functions**

- Lambda supports **synchronous** and **asynchronous invocation** of a Lambda function. You can control the invocation type only when you invoke a Lambda function (referred to as *on-demand invocation*).
- An **event source** is the entity that publishes events, and a Lambda function is the custom code that processes the events.
- *Event source mapping* maps an event source to a Lambda function. It enables automatic invocation of your Lambda function when events occur. 
- Lambda provides event source mappings for the following services.
  - Amazon Kinesis
  - Amazon DynamoDB
  - Amazon Simple Queue Service
- Your functions’ *concurrency* is the number of instances that serve requests at a given time. When your function is invoked, Lambda allocates an instance of it to process the event. When the function code finishes running, it can handle another request. If the function is invoked again while a request is still being processed, another instance is allocated, which increases the function’s concurrency.
- To ensure that a function can always reach a certain level of concurrency, you can configure the function with **reserved concurrency**. When a function has reserved concurrency, no other function can use that concurrency. Reserved concurrency also limits the maximum concurrency for the function.
- To enable your function to scale without fluctuations in latency, use **provisioned concurrency**. By allocating provisioned concurrency before an increase in invocations, you can ensure that all requests are served by initialized instances with very low latency.

### Configuring a Lambda Function to Access Resources in a VPC

In AWS Lambda, you can set up your function to establish a connection to your virtual private cloud (VPC). With this connection, your function can access the private resources of your VPC during execution like EC2, RDS and many others.

By default, AWS executes your Lambda function code securely within a VPC. Alternatively, you can enable your Lambda function to access resources inside your private VPC by providing additional VPC-specific configuration information such as VPC subnet IDs and security group IDs. It uses this information to set up elastic network interfaces which enable your Lambda function to connect securely to other resources within your VPC.

![img](./img/2019-04-03_03-53-45-3550f2ecbfad29ea60f49fd5ea8d2809.png)

 

### **Lambda@Edge**

- Lets you run Lambda functions to customize content that CloudFront delivers, executing the functions in AWS locations closer to the viewer. The functions run in response to CloudFront events, without provisioning or managing servers.
- You can use Lambda functions to change CloudFront requests and responses at the following points:
  - After CloudFront receives a request from a viewer (viewer request)
  - Before CloudFront forwards the request to the origin (origin request)
  - After CloudFront receives the response from the origin (origin response)
  - Before CloudFront forwards the response to the viewer (viewer response)

![AWS Training Lambda](./img/AWS-Lambda.png)

- You can automate your serverless application’s release process using AWS CodePipeline and AWS CodeDeploy.
- Lambda will automatically track the behavior of your Lambda function invocations and provide feedback that you can monitor. In addition, it provides metrics that allows you to analyze the full function invocation spectrum, including event source integration and whether downstream resources perform as expected.

### **Pricing**

- You are charged based on the total number of requests for your functions and the duration, the time it takes for your code to execute.

### **Limits**

| **Resource**                   | **Default Limit**                                            |
| ------------------------------ | ------------------------------------------------------------ |
| Concurrent executions          | 1000                                                         |
| Function and layer storage     | 75 GB                                                        |
| Function memory allocation     | 128 MB to 3008 MB, in 64 MB increments.                      |
| Function timeout               | 900 seconds (15 minutes)                                     |
| Function environment variables | 4 KB                                                         |
| Function layers                | 5 layers                                                     |
| Deployment package size        | 50 MB (zipped)250 MB (unzipped, including layers)3 MB (console editor) |

 

**Additional AWS Lambda-related Cheat Sheets:**

- [EC2 Container Service (ECS) vs Lambda](./comparison-of-aws-services/ec2-container-service-ecs-vs-lambda.md)
- [AWS Lambda Integration with Amazon DynamoDB Streams](https://tutorialsdojo.com/aws-lambda-integration-with-amazon-dynamodb-streams/)

 

**References:**

https://docs.aws.amazon.com/lambda/latest/dg/welcome.html

https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html 

Sources:
 https://docs.aws.amazon.com/lambda/latest/dg
 https://aws.amazon.com/lambda/features/
 https://aws.amazon.com/lambda/pricing/
 https://aws.amazon.com/lambda/faqs/