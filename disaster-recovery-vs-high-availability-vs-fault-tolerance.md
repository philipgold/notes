# Disaster Recovery vs. High Availability vs. Fault Tolerance

## High Availability

[*High availability*](https://en.wikipedia.org/wiki/High_availability) *is a characteristic of a system, which aims to ensure an agreed level of operational performance, usually uptime, for a higher than normal period.*

HA is a concept that only manifests itself through technology. The goal of an HA design is to deliver 99.999% of operational uptime. Nevertheless, it is important to emphasize that HA is not expected to deliver 100% uptime, and that downtime (up to 5.26 minutes/year) is acceptable.

## How does high availability work?

The objective of the “five nines” is achieved through the elimination of a single point of failure in a system. For this, you can implement redundancy and failover components that are configured to handle the workloads without human intervention, in case a primary component fails.

In virtualization, high availability can be designed with the help of clustering technologies. For example, when one of your hosts or virtual machines (VM) within a cluster fails, another VM takes over and mainta

ins the proper performance of the system.

## When is high availability important?

A well-thought out HA architecture is important for any business that strives to minimize downtime. According to statistics, in 2017, the cost of an hourly downtime accounted for between 301 and 400 thousand USD for a big number (24%) of businesses worldwide. This means that even the acceptable amount of downtime — 5.26 minutes — costs businesses up to 35 thousand USD.

Besides significant financial losses, downtime may have other serious implications such as productivity loss, an inability to deliver services in a timely manner, damaged business reputation, and so on. Highly available systems help avoid such scenarios by handling failures automatically, and in a timely manner.

## What makes a system highly available?

While having redundancy components is an ultimate condition for ensuring high availability, just having these components in place is not enough for the system to be considered highly available. A highly available system is the one that includes both redundant components and mechanisms for failure detection, as well as workload redirection. These can either be a load balancer or a hypervisor.

## Fault Tolerance 

[*Fault tolerance*](https://en.wikipedia.org/wiki/Fault_tolerance) *is the property that enables a system to continue operating properly in the event of the failure of some (one or more faults within) of its components.*

In simple terms, fault tolerance is a stricter version of high availability. HA focuses on delivering the minimal possible downtimes, while FT goes further by delivering *zero* downtime. However, in the fault tolerant model, the ability of a system to deliver high performance in the event of failure is not a top priority. In contrast, it is expected that a system can maintain operational performance, but at a reduced level.

## How does fault tolerance work?

Similarly to high availability, fault tolerance also works on the principle of redundancy. Such redundancy can be achieved through simultaneously running one application on two servers, which enables one server to be able to instantly take over another if one were to fail.

In virtualization, redundancy is achieved through keeping and running identical copies of a given virtual machine on a separate host. Any change or input that takes place on the primary VM is duplicated on a secondary VM. This way, in the event that the VM is corrupted, fault tolerance is ensured through the instant transfer of workloads from one VM to its copy.

## When is fault tolerance important?

Fault tolerant design is crucial to implement if your IT system cannot tolerate any downtime. If there are critical applications that support your business operations, and even a slightest downtime can translate into irrevocable losses, you should consider configuring your IT components with FT in mind.

## What is a fault tolerant system?

A fault tolerant system is a system that includes two tightly coupled components that mirror each other, providing redundancy. This way, if a primary component goes down, the secondary one is always set and immediately ready to take over.

## Disaster Recovery

[*Disaster recovery* ](https://en.wikipedia.org/wiki/Disaster_recovery)*involves a set of policies, tools and procedures to enable the recovery or continuation of vital technology infrastructure and systems following a natural or human-induced disaster.*

## What is disaster recovery?

Unlike high availability and fault tolerance, disaster recovery deals with catastrophic consequences that render entire IT infrastructures unavailable rather than single component failures. Since DR is both data- and technology-centric, its main objective is to recover data as well as get infrastructure components up and running within the shortest time frame after an unpredicted event.

## How does disaster recovery work?

Normally, DR requires having a secondary location where you can restore your critical data and workloads (whether entirely or partially) in order to resume sufficient business operation following a disruptive event. To transfer the workloads to a remote location, it is necessary to incorporate a proper disaster recovery solution. Such a solution can take care of the failover operation in a timely manner and with little to no input on your part, which allows you to achieve your designated recovery time objectives.

## What are the components of disaster recovery?

Unlike HA and FT, disaster recovery is a much broader and more complex concept that refers to a strategy with a comprehensive set of components including: risk assessment, planning, dependencies analysis, remote site configuration, staff training, testing, automation setup, and so on. Disaster recovery goes beyond high availability and fault tolerance, but can and should include these factors in its technological design.

## When is disaster recovery important?

The term disaster not only refers to a natural catastrophe, but to any kind of disruptive event that leads to significant downtimes such as cyber-attacks, power outages, human errors, software failures, and other incidents. This means that such events can take place anywhere at any time, making organizations of all types and sizes their potential victims. While in most cases disasters are impossible to predict or avoid, organizations can and should take measures to strengthen their disaster recovery preparedness, as well as optimize their DR strategies on a regular basis.



# Conclusion

While high availability and fault tolerance are exclusively technology-centric, disaster recovery encompasses much more than just software/hardware elements. HA and FT focus on addressing the isolated failures in an IT system. DR, on the contrary, deals with failures of a much bigger scope, as well as the consequences of such failures. Incorporating high availability or fault tolerance cannot ensure protection from disasters, but both of them can complement disaster recovery strategies in an efficient manner.