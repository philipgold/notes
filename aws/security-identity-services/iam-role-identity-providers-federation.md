# IAM Role – Identity Providers and Federation – Certification

## IAM Role – Identity Providers and Federation

- Identity Provider can be used to grant external user identities permissions to AWS resources without having to be created within your AWS account.
- External user identities can be authenticated either through the organization’s authentication system or through a well-know identity provider such as login with Amazon, Google, etc.
- Identity providers help keep the AWS account secure without needing to distribute or embed long term in the application.
- To use an IdP, you create an IAM identity provider entity to establish a trust relationship between your AWS account and the IdP.
- IAM supports IdPs that are compatible with OpenID Connect (OIDC) or SAML 2.0 (Security Assertion Markup Language 2.0)



## Web Identity Federation

### Complete Process Flow

1. Mobile or Web Application needs to be configured with the IdP which gives each application a unique ID or client ID (also called *audience*)

2. Create an Identity Provider entity for OIDC compatible IdP in IAM.

3. Create an IAM role and define the

4. 1. Trust policy – specify the IdP (like Amazon) as the Principal (the trusted entity), and include a Condition that matches the IdP assigned app ID.
   2. Permission policy – specify the permissions the application can assume

5. The application calls the sign-in interface for the IdP to login.

6. IdP authenticates the user and returns an authentication token (OAuth access token or OIDC ID token) with information about the user to the application.

7. The application then makes an unsigned call to the STS service with the ***AssumeRoleWithWebIdentity*** action to request temporary security credentials.

8. The application passes the IdP’s authentication token along with the Amazon Resource Name (ARN) for the IAM role created for that IdP.

9. AWS verifies that the token is trusted and valid and, if so, returns temporary security credentials (access key, secret access key, session token, expiry time) to the application that has the permissions for the role that you name in the request.

10. STS response also includes metadata about the user from the IdP, such as the unique user ID that the IdP associates with the user.

11. Using the Temporary credentials, the application makes signed requests to AWS.

12. User ID information from the identity provider can distinguish users in the app *for e.g., and objects can be put into S3 folders that include the user ID as prefixes or suffixes*. This lets you create access control policies that lock the folder so only the user with that ID can access it.

13. The application can cache the temporary security credentials and refresh them before their expiry accordingly. Temporary credentials, by default, are right for an hour.

[Interactive Website](https://web-identity-federation-playground.s3.amazonaws.com/index.html) provides a perfect way to understand the flow.
