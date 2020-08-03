# Section 7: Route 53



## AWS Route 53

* Route53 is a **Managed DNS** (Domain Name System)
* DNS is a collection of rules and records which helps clients understand how to reach a server through URLs.
* In AWS, the most common records are:
  * A: hostname to IPv4
  * AAAA: hostname to IPv6
  * CNAME: hostname to hostname
  * Alias: hostname to AWS resource.

* Route53 can use:
  * **public domain** names you own (or buy) application1.mypublicdomain.com
  * **private domain** names that can be resolved by your instances in your VPCs. application1.company.internal
* Route53 has advanced features such as:
  * Load balancing (through DNS – also called client load balancing)
  * Health checks (although limited...)
  * Routing policy: simple, failover, geolocation, latency, weighted, multi value
* You pay $0.50 per month per hosted zone

[#aws-saa]() [#Route-53]() 

## AWS Route 53: CNAME vs Alias

*  AWS Resources (Load Balancer, CloudFront...) expose an AWS hostname:

  `lb1-1234.us-east-2.elb.amazonaws.com` and you want `myapp.mydomain.com`

* CNAME:
  * Points a hostname to any other hostname. (app.mydomain.com => blabla.anything.com)
  * **<u>ONLY FOR NON ROOT DOMAIN (aka. something.mydomain.com)</u>**

* Alias:
  * Points a hostname to an AWS Resource (app.mydomain.com => blabla.amazonaws.com)
  * **<u>Works for ROOT DOMAIN and NON ROOT DOMAIN (aka mydomain.com)</u>**
  * Free of charge
  * Native health check

[#aws-saa]() [#Route-53]() 

## AWS Route 53: Simple Routing Policy

- Maps a hostname to another hostname

- Use when you need to redirect to a single resource

- You can’t attach health checks to simple routing policy

  

- **If multiple values are returned, a random one is chosen by the <u>client</u>**

[#aws-saa]() [#Route-53]() 

## AWS Route 53: Weighted Routing Policy

- Control the % of the requests that go to specific endpoint
- Helpful to test 1% of traffic on new app version for example
- Helpful to split traffic between two regions
- Can be associated with Health Checks

[#aws-saa]() [#Route-53]() 

## AWS Route 53: Latency Routing Policy

- Redirect to the server that has the least latency close to us
- Super helpful when latency of users is a priority
- **Latency is evaluated in terms of user to designated AWS Region**
- Germany may be directed to the US (if that’s the lowest latency)

[#aws-saa]() [#Route-53]() 

## AWS Route 53: Health Checks

* Have X health checks failed => unhealthy (default 3)
* After X health checks passed => health (default 3)
* Default Health Check Interval: 30s (can set to 10s – higher cost)
* **About 15 health checkers will check the endpoint health**
* => one request every 2 seconds on average
* Can have HTTP,TCP and HTTPS health checks (no SSL verification)
* Possibility of integrating the health check with CloudWatch



* **Health checks can be linked to Route53 DNS queries!**

[#aws-saa]() [#Route-53]() 

## Multi Value Routing Policy

* Use when routing traffic to multiple resources
* Want to associate a Route 53 health checks with records
* Up to 8 healthy records are returned for each MultiValue query
* **Multi Value is not a substitute for having an ELB**

[#aws-saa]() [#Route-53]() 



## 3rd Party Registrar with AWS Route 53

* If you buy your domain on 3rd party website, you can still use Route53. 

  

* 1) Create a Public Hosted Zone in Route 53

* 2) Update NS Records on 3rd party website to use Route 53 name servers 

  

* Domain Registrar != DNS

* (But each domain registrar usually comes with some DNS features)

[#aws-saa]() [#Route-53]() 