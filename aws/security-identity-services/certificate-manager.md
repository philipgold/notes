# AWS Certificate Manager

- A service that lets you easily provision, manage, and deploy public and private SSL/TLS certificates for use with AWS services and your internal connected resources. SSL/TLS certificates are used to secure network  communications and establish the identity of websites over the Internet as well as resources on private networks.
- ACM is integrated with the following services:
  - Elastic Load Balancing
  - Amazon CloudFront – To use an ACM certificate with CloudFront, you must  request or import the certificate in the US East (N. Virginia) region.
  - AWS Elastic Beanstalk
  - Amazon API Gateway
  - AWS CloudFormation
- AWS Certificate Manager manages the renewal process for the certificates managed in ACM and used with ACM-integrated services.
- You can import your own certificates into ACM, however you have to renew these yourself.

## Concepts

- ACM Certificate are X.509 version 3 certificates. Each is valid for **13 months**.
- When you request an ACM certificate, you must validate that you own or  control all of the domains that you specify in your request.
- **Each ACM Certificate must include at least one fully qualified domain name (FQDN)**. You can add additional names if you want to.
- You can create an ACM Certificate containing a wildcard name  (*.example.com) that can protect several sites in the same domain  (subdomains).
- You cannot download the private key for an ACM Certificate.
- The first time you request or import a certificate in an AWS region, ACM  creates an AWS-managed customer master key (CMK) in AWS KMS with the  alias aws/acm. This CMK is unique in each AWS account and each AWS  region. ACM uses this CMK to encrypt the certificate’s private key.
- You cannot add or remove domain names from an existing ACM Certificate.  Instead you must request a new certificate with the revised list of  domain names.
- You cannot delete an ACM Certificate that is being used by another AWS  service. To delete a certificate that is in use, you must first remove  the certificate association.
- Applications and browsers trust public certificates automatically by default,  whereas an administrator must explicitly configure applications to trust private certificates.

## Types of Certificates For Use With ACM

- **Public certificates** 
  - ACM manages the renewal and deployment of public certificates used with ACM-integrated services.
  - You cannot install public ACM certificates directly on your website or application, only for integrated services.
- **Private certificates**
  - ACM Private CA provides three ways to create and manage private  certificates. 1) You can choose to delegate private certificate  management to ACM. When used in this way, ACM can automatically renew  and deploy private certificates used with ACM-integrated services. 2)  You can export private certificates from ACM and use them with EC2  instances, containers, on-premises servers, and IoT devices. ACM Private CA automatically renews these certificates and sends an Amazon  CloudWatch notification when the renewal is completed. You can write  client-side code to download renewed certificates and private keys and  deploy them with your application. 3) ACM Private CA gives you the  flexibility to create your own private keys, generate a certificate  signing request (CSR), issue private certificates from your ACM Private  CA, and manage the keys and certificates yourself. You are responsible  for renewing and deploying these private certificates.
- **Imported certificates**
  - If you want to use a third-party certificate with ACM integrated services, you may import it into ACM using the AWS Management Console, AWS CLI,  or ACM APIs. ACM does not manage the renewal process for imported  certificates. You are responsible for monitoring the expiration date of  your imported certificates and for renewing them before they expire. You can use the AWS Management Console to monitor the expiration dates of  imported certificates and import a new third-party certificate to  replace an expiring one.
- **CA certificates**
  - ACM private CA can issue certificates to identify private certificate  authorities. These certificates allow CA administrators to create a  private CA hierarchy, which provides strong security and restrictive  access controls for the most-trusted root CA at the top of the trust  chain, while allowing more permissive access and bulk certificate  issuance for subordinate CAs lower in the chain.

## ACM Private Certificate Authority

- ACM PCA allows you to create a private certificate authority (CA) and then use ACM to issue private certificates.
- With ACM Private CA, you can create complete CA hierarchies, including root  and subordinate CAs. A CA hierarchy provides strong security and  restrictive access controls for the most-trusted root CA at the top of  the trust chain, while allowing more permissive access and bulk  certificate issuance for subordinate CAs lower in the chain.
- A private CA handles the issuance, validation, and revocation of private  certificates within a private network. It is comprised of two major  components: The first is the **CA certificate**, a cryptographic building block upon which certificates can be issued. The second is **a set of run-time services** for maintaining revocation information through the **Certificate Revocation List** (CRL).
- Benefits of a Private CA
  - Create certificates with any subject name you want.
  - Create certificates with any expiration date you want.
  - Use any supported private key algorithm and key length.
  - Use any supported signing algorithm.
  - Configure certificates in bulk using templates.
- Automatic renewal is not available for ACM Private CA certificates for which ACM  does not create the private key and certificate signing request (CSR).
- You cannot copy private CAs between Regions. To use private CAs in more  than one Region, you must create your CAs in those Regions.

## Domain Verification for Certificates

- Before the Amazon certificate authority can issue a certificate for your site, AWS Certificate Manager must verify that you own or control all of the  domain names that you specified in your request. You can choose either **email validation** or **DNS validation** when you request a certificate.
- For DNS validation, ACM uses **CNAME (Canonical Name) records to validate** that you own or control a domain.
- In the DNS validation console page, ACM will provide you a CNAME record  that you must add to your DNS database, whether it be Route 53 or other  hosts.
- For email validation, ACM sends email to the 3 contact addresses listed in  WHOIS and to 5 common system addresses for each domain that you specify. To validate it, one of the recipients must click on the approval link.

## Pricing

- There is no additional charge for provisioning public or private SSL/TLS  certificates you use with ACM-integrated services, such as Elastic Load  Balancing and API Gateway.
- You are billed for each active ACM Private CA per month pro-rated
- For private certificates, ACM Private CA allows you to pay monthly for the  service and certificates you create. You pay less per certificate as you create more private certificates.

## Limits

| Number of ACM Certificates                                   | 1000                     |
| ------------------------------------------------------------ | ------------------------ |
| New AWS accounts may start with a quota lower than the maximum. |                          |
| Number of imported certificates                              | 1000                     |
| Number of ACM Certificates per year (last 365 days)          | Twice your account quota |
| Number of domain names per ACM Certificate (default)         | 10                       |
| Number of Private CAs                                        | 10                       |

 

## Sources

 https://aws.amazon.com/certificate-manager/
 https://aws.amazon.com/certificate-manager/faqs/
 https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html
 https://docs.aws.amazon.com/acm-pca/latest/userguide/PcaWelcome.html