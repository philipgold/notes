# Analytics - EMR Performance Tuning & Testing

# EMR Performance Tuning

When tuning EMR you have to think about tuning in a number of different ways. 

- Virtual System Sizing 
- Software System Tuning
- JVM tuning
- Workload/application tuning

First there is the system itself, how to optimize EMR based on best practices. Also consider the underlying components of Hadoop, Spark, HBase, Tez, etc, whichever components you are using. To make sure you are up to date on the latest just do a google search for ‘EMR Performance Tuning’ with only gathering results from the last year (some are older). Examples of some of the results are below. Don’t forget that a general search from Hadoop Tuning , Spark tuning, Java Tuning, etc. would aid in the endeavor. 

- https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-spark-performance.html
- https://aws.amazon.com/blogs/big-data/best-practices-for-successfully-managing-memory-for-apache-spark-applications-on-amazon-emr/
- https://cloud.netapp.com/blog/optimizing-aws-emr-best-practices
- https://medium.com/finbox/easy-steps-to-optimise-your-aws-emr-performance-and-reduce-cost-ba4bd115973
- https://unraveldata.com/amazon-emr
- https://aws.amazon.com/blogs/big-data/performance-updates-to-apache-spark-in-amazon-emr-5-24-up-to-13x-better-performance-compared-to-amazon-emr-5-16/
- https://aws.amazon.com/blogs/big-data/tune-hadoop-and-spark-performance-with-dr-elephant-and-sparklens-on-amazon-emr/



The above writeups tackle many of the issues of the various tuning areas and are the best general guidelines. I will discuss the specifics of the areas below for TLDR; but in reality doing multiple detailed searches and researching the responses is much better than the short list below. Especially if you can define what areas are in the most dire 

# Tuning Process

Performance tuning for EMR is much like doing Performance tuning anywhere. First off you need to make sure you have a test suite to run. A given test suite should give you coverage of the full application lifecycle as well as subsets where you can test various applications/processes/components to drill into them individually - especially as you narrow in on bottle necks - instead of just the system of the whole. This will mean you need good data with the ability to rollback to a known state to be able to retest again again. 

The next thing you will need is a good set of monitoring and metrics tools to get measurements. Ideally this is something that is stored over time so you can always go back and compare various runs. 

Then of course you will need to document what exact changes you made, and high level results you achieved with time frames of when the tests were run. You should be able to cross reference this with the metrics from above so again you can drill in and showcase results in detail. 

Be prepared to spend time on this as you will have to run tests again and again with various configuration changes to be able to truly optimize. Save yourself some time by initially grouping some changes into a large group that follows best recommended practices for your software versions and the components/job sizes you run, but be prepared to dial them in where you are changing one item at a time at the lowest level. There is nothing worse in performance tuning where you make one change that gives you a 5 time boost, but then another that negatively affects your performance making it 8 times slower. Without individual comparison you would assume all changes make you slower missing the 5x improvement. 

## Virtual System Sizing

With all else being equal what is the optimal workload for your applications as a whole that will be running on the cluster? If you start out saying our workloads need 8 TB of memory, 256 CPUs and 20TB of local disk space, how do you translate to sizing correctly? HA and fault tolerance aside. Do things work better at 1 huge machine? If you took that same requirement and broke it off into 20 machines with 4 GB of memory, 12 CPUs, and 1TB of disk space, would you get a performance gain or decrease? What if it was 10 machines? 

- Then where is your bottleneck, is it in the CPU, the disk or the memory? Maybe your initial requirements were wrong?
- Would more memory, less cpu optimize? 
- Different types of disks optimize (Fast SSD, SSD, spinning)? What about costs associated with the changes? 
-  2 options where one gives you a 2% performance increase but at twice the cost, is it worth it, especially if you tossed in another cheaper virtual machine?



Recommendation here is to take your first best guess, try a few modifications and tests, saving the terraform scripts to build these different systems, and then revisiting as a close to final check when you have done optimization in other areas. This will be a common theme, optimize in one area, then recheck area’s you already did initial optimization in to see if further changes invalidated some of your results. 

## Software System Tuning

This is many of your configuration settings of the underlying systems. This is looking at documentation for the system and understanding what configuration nobs turn one. Look at best practices for given versions of software, considering all individual components. Some primary examples could be?

- What components are running and how much CPU and memory are you giving each?

- Where are you bottlenecks and where are there overhead? This is where looking at metrics is key and seeing memory, cpu, context switching, I/O, etc and which have overhead and which are struggling.

- Can you pin CPUs to some components or do they all need to switch?

- Are you over allocating memory to some components and starving others?

- Are you starving the OS from memory?

- What about time outs, and are they consistent between components that interact

- What about I/O? For instance with EMRFS you use an underlying Dynamo table, do you have reads and writes tuned for the throughput that is required?

- Are all ports open to communication from one component to another? On the same machine? On different machines in the cluster?

- Is security in place with valid id’s, passwords and certificates as required?

- How many cores for spark executors

- - Test fewer cores more executors vs more cores fewer executors

- How much memory per spark executor

- - Again test larger memory fewer cores vs smaller memory more cores

- How large is the driver? Does it need to be that size? Does changing code affect?

## JVM Tuning

Since EMR is reliant on Java, tuning your JVM is one of the areas that can have a drastic effect. Most tuning will be around the garbage collector and choosing which one.. Once general recommendation is do not overtune. Use some of the common short list of recommendations with common parameters rather than trying to test all 800+ tuning parameters. This is an area you can spend a lot of time with little return.

Recall that G1GC was developed due to the nature of larger JVM’s and avoiding as many stop the world pauses. First developed in Java 1.7 and startinging Java 1.9 it is the default garbage collector for a reason. Compared to CuncurrentMarkSweep, developed for smaller JVM’s making a switch could be the easiest change to get a performance boost. No matter which you choose, do define some of the common tweaks for the given garbage collector. 

- Listing all Java flags

- - java -XX:+PrintGCDetails -XX:+UnlockDiagnosticVMOptions 

- What are the min and max settings for JVM

- - Test setting -Xmn and -Xmx to the same for memory contingency
  - Are you starving the JVM
  - Are you starving the OS
  - Are you over allocating memory across multiple JVMs
  - Can you increase memory with headroom and what is the effect on performance

- Getting GC info

- - -XX:+PrintGC
  - -XX:+PrintGCDetails
  - -XX:+PrintGCTimeStamps
  - -XX:+PrintGCDateStamps 
  - -Xloggc:/var/log/hbase/gc.log
  - -XX:+UseGCLogFileRotation 
  - -XX:NumberOfGCLogFiles=5

- What garbage collector are you using?

- If using G1GC

- - -XX:MaxGCPauseMillis=200 
  - -XX:+ParallelRefProcEnabled
  - -XX:ConcGCThreads=<dependant on cores>
  - See [https://docs.oracle.com/javase/9/gctuning/garbage-first-garbage-collector-tuning.htm](https://docs.oracle.com/javase/9/gctuning/garbage-first-garbage-collector-tuning.htm#JSGCT-GUID-70E3F150-B68E-4787-BBF1-F91315AC9AB9)l

- If using ConcurrentMarkSweep

- - Set thread stack size appropriately -Xss 

  - - Default is 1 meg which can waste a lot of memory if you have a lot of threads
    - Usually 256M is safe, if you receive thread stack space error increase

  - -Xmn to tune new gen size

## Application Tuning

In apps are you doing all your filtering before doing calculations minimizing the data to manipulate before manipulating

- How many partitions on job and does going up or down change performance

- - Where appropriate are you using a sequence or number for data key so jobs can be partitioned easily and not have to rely on one executor for all data to flow through. For example previously there was a spark job that was pulling data from oracle and then processing, because the oracle table did not have a numeric key to be able to pull data and track on multiple machines (a pulls rows 1 - 10, b 11 -20, etc) all the data had to be pulled by one executor and sent to others, by simplify adding a sequence and using that to partition jobs a 4.5 hour job went down to 23 minutes. 
  - Thus think of strategies on how to effectively partition jobs. On a like note if you are setting the number of partitions, think of changing that. Smaller partitions that execute faster for rollup affect total job run time (smaller data transfers), or do fewer partitions working on larger scale (fewer transfers for rollups) make the total job
  - Remember this is now a distributed system and you have to think on how data is broken up logically and tracked for processing across multiple nodes

- Are you caching and if so how?

- - Caching to disk, if so how much data and how fast is your disk?
  - Caching to memory but using up all your memory causing memory to spill to disk?
  - Again partition sizes may help

- Are you check-pointing jobs so if a task fails due to a component loss another component can redo the task without having to restart the job from the beginning

- - Can have a huge impact on long running jobs
  - For short running jobs the act of check-pointing may cause more delays in total job run time than if it failed and had to restart

- Are you setting up property files for params when submitting a job, that way you can easily change and resubmit versus re-configuring servers

- - Not all jobs are the same, setting parameters such as memory, number of executors, number of cores, etc per job to optimize the individual job can help the system overall. 
  - Maybe work one needs 8 cores and 24 gig of memory per task executor, but job two is optimized at 2 cores and 2 gig of memory
  - By setting each job individually they each get optimized for your system allowing more jobs to run concurrently and/or minimizing run time for single jobs

- Are you looking at the DAG with its execution plans and timing to determine where tasks are slow and adjust code in that targeted area

- - Zone in on bottle neck components and optimize algorithms
  - Do code reviews
  - Look for anti patterns
  - Check if code is using older java constructs that can be optimized with some of the new java features such as lambda and streams

- Are you filtering data and then processing, or is the opposite true?

- - Pulling a full data set and then dropping some consumes network and I/O
  - Make sure you select only the data needed to process
  - Again go back to strategy for selection so it can be partitioned out for distributed computing