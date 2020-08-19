# Latency Routing vs Geoproximity Routing vs Geolocation Routing

## Latency Routing

#### Definition

Lets Route 53 serve user requests from the AWS Region the provides the lowest latency. It does not, however, guarantee that users in the same geographic region will be served from the same location.

Latency-based routing is based on latency measurements performed over a period of time, and the measurements reflect changes in network connectivity and routing.

#### How it works

To use latency-based routing, you create **latency records** for your resources in multiple AWS Regions. When Route 53 receives a DNS query for your domain or subdomain, it determines which AWS Regions you've created latency records for, determines which region gives the user the lowest latency, and then selects a latency record for that region. Route 53 responds with the value from the selected record, such as the IP address for a web server.

Record sets can be created using any record type supported by Route 53, except NS or SOA records. 

#### Use Case

Use when you have resources in multiple AWS Regions and you want to route traffic to the region that provides the best latency. 

## Geoproximity Routing

#### Definition

Lets Amazon Route 53 route traffic to your resources based on the geographic location of your users and your resources. 

You can also optionally choose to route more traffic or less to a given resource by specifying a value, known as bias. A bias expands or shrinks the size of the geographic region from which traffic is routed to a resource. 

#### How it works

To use geoproximity routing, you must use Route 53 traffic flow. 

You create traffic flow policies for your resources and specify one of the following values for each policy:

- If you're using AWS resources, you can set the AWS Region where your resource is created. 
- If you're using non-AWS resources, you can enter the latitude and longitude of the resource.



#### Use Case

Use when you want to route traffic based on the location of your resources and optionally, shift traffic from resources in one location to resources in another.

## Geolocation Routing

#### Definition

Resources serve traffic based on the geographic location of your users, meaning the location that DNS queries originate from.

#### How it works

Geolocation works by mapping IP addresses to locations. Some IP addresses aren't mapped to geographic locations, so Amazon Route 53 will receive some DNS queries from locations that it can't identify. 

You can create a default record that handles both queries from IP addresses that aren't mapped to any location and queries that come from locations that you haven't created geolocation records for. If you don't create a default record, Route 53 returns a "no answer" response for queries from those locations.

No two records should specify the same geographic location.

#### Use Case

Use when you want to route traffic based on the location of your users.
- You can localize your content and present some or all of your website in the language of your users.
- You can restrict distribution of content to only the locations in which you have distribution rights. 
- Useful for balancing load across endpoints in a predictable, easy-to-manage way, so that each user location is consistently routed to the same endpoint. 

 

**References:**

https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html