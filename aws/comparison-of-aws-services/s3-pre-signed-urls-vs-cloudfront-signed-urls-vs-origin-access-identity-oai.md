# S3 Pre-signed URLs vs CloudFront Signed URLs vs Origin Access Identity (OAI)

# S3 Pre-signed URLs

* All S3 buckets and objects by default are **private**. Only the object owner has permission to access these objects. Pre-signed URLs use the owner’s security credentials to grant others  time-limited permission to download or upload objects.
* When creating a pre-signed URL, you (as the owner) need to provide the following:  
  * Your security credentials
  * An S3 bucket name
  * An object key
  * Specify the HTTP method (GET to download the object or PUT to upload an object)
  * Expiration date and time of the URL.

# CloudFront Signed URLs

* You can control user access to your private content in two ways
  * Restrict access to files in CloudFront edge caches
  * Restrict access to files in your Amazon S3 bucket (unless you’ve configured it as a website endpoint)
* You can configure CloudFront to require that users access your files using either **signed URLs** or **signed cookies**. You then develop your application either to create and distribute signed URLs to authenticated users or to send Set-Cookie headers that set signed cookies on the viewers for authenticated users.
* When you create signed URLs or signed cookies to control access to your files, you can specify the following restrictions:
  * An expiration date and time for the URL
  * (Optional) The date and time the URL becomes valid
  * (Optional) The IP address or range of addresses of the computers that can be used to access your content
* You can use signed URLs or signed cookies for any CloudFront distribution, regardless of whether the origin is an Amazon S3 bucket or an HTTP  server.

# Origin Access Identity (OAI)

* You can configure an S3 bucket as the origin of a CloudFront distribution. OAI prevents users from viewing your S3 files by simply using the direct URL for the file. Instead, they would need to access it through a CloudFront URL.
* To require that users access your content through CloudFront URLs, you perform the following tasks:
  * Create a special CloudFront user called an **origin access identity**.
  * Give the origin access identity permission to read the files in your bucket.
  * Remove permission for anyone else to use Amazon S3 URLs to read the files (through bucket policies or ACLs).
* You cannot set OAI if your S3 bucket is configured as a website endpoint.



 

**References:**

* https://docs.aws.amazon.com/AmazonS3/latest/dev/PresignedUrlUploadObject.html
* https://docs.aws.amazon.com/AmazonS3/latest/dev/ShareObjectPreSignedURL.html
* https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html
* https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html