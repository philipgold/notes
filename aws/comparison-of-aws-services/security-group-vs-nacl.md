# Security Group vs NACL

![Security Group vs NACL](../img/SGNCL-latest.png)

 

**Your VPC has a default security group with the following rules:**

1. Allow inbound traffic from instances assigned to the same security group.
2. Allow all outbound IPv4 traffic and IPv6 traffic if you have allocated an IPv6 CIDR block.

**Your VPC has a default network ACL with the following rules:**

1. Allows all inbound and outbound IPv4 traffic and, if applicable, IPv6 traffic.
2. Each network ACL also includes a non modifiable and non removable rule whose rule number is an asterisk. This rule ensures that if a packet doesn’t  match any of the other numbered rules, it’s denied.