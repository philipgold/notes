# AWS Shield

- A managed Distributed Denial of Service (DDoS) protection service that safeguards applications running on AWS.

### **Shield Tiers and Features**

- **Standard**
  - All AWS customers benefit from the automatic protections of Shield Standard.
  - Shield Standard provides always-on network flow monitoring which inspects  incoming traffic to AWS and detect malicious traffic in real-time.
  - Uses several techniques like deterministic packet filtering, and priority  based traffic shaping to automatically mitigate attacks without impact  to your applications. 
  - When you use Shield Standard with CloudFront and Route 53, you receive  comprehensive availability protection against all known infrastructure  attacks.
- **Advanced**
  - Shield Advanced provides enhanced detection, inspecting network flows and also monitoring application layer traffic to your Elastic IP address,  Elastic Load Balancing, CloudFront, or Route 53 resources. 
  - It handles the majority of DDoS protection and mitigation responsibilities for **layer 3**, **layer 4**, and **layer 7** attacks.
  - You have 24×7 access to the AWS DDoS Response Team. To contact the DDoS  Response Team, customers will need the Enterprise or Business Support  levels of AWS Premium Support.
  - It automatically provides additional mitigation capacity to protect  against larger DDoS attacks. The DDoS Response Team also applies manual  mitigations for more complex and sophisticated DDoS attacks.
  - It gives you complete visibility into DDoS attacks with near real-time  notification via CloudWatch and detailed diagnostics on the “AWS WAF and AWS Shield” Management Console.
  - Shield Advanced comes with “DDoS cost protection”, a safeguard from scaling  charges as a result of a DDoS attack that cause usage spikes on your AWS services. It does so by providing service credits for charges due to  usage spikes.
  - It is available globally on all CloudFront and Route 53 edge locations. 
  - With Shield Advanced you will be able to see the history of all incidents in the trailing 13 months.

### **Pricing**

- **Shield Standard** provides protection at no additional charge.
- **Shield Advanced**, however, is a paid service. It requires a 1-year subscription  commitment and charges a monthly fee, plus a usage fee based on data  transfer out from CloudFront, ELB, EC2, and AWS Global Accelerator.

### **Limits**

- You can monitor and protect up to 100 Elastic IP addresses, CloudFront  distributions, Route 53 hosted zones, Elastic Load Balancing load  balancers or Global Accelerator accelerators each per account with  Shield Advanced.

Sources:
 https://aws.amazon.com/shield/features/
 https://aws.amazon.com/shield/pricing/
 https://aws.amazon.com/shield/faqs/