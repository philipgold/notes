# Amazon Mechanical Turk

- A forum where **Requesters** post work as **Human Intelligence Tasks** (HITs). Workers complete HITs in exchange for a reward. Essentially crowdsourcing.
- You write, test, and publish your HIT using the Mechanical Turk developer sandbox, Amazon Mechanical Turk APIs, and AWS SDKs.
- Benefits
  - Optimize efficiency since MTurk is well-suited to take on simple and repetitive tasks in your workflows which need to be handled manually. 
  - Increase flexibility since MTurk lets you gain access to a global, on-demand,  24×7 workforce without the difficulty associated with dynamically  scaling.
  - Reduce cost by hiring and managing a temporary workforce. MTurk provides a pay-per-task model.
- Concepts
  - A **Requester** is a company, organization, or person that creates and submits tasks (HITs) to Amazon Mechanical Turk for Workers to perform.
  - A **Human Intelligence Task** (HIT) represents a single, self-contained task that a Requester submits to Amazon Mechanical Turk for Workers to perform.
    - Each HIT has a lifetime, specified by the Requester, that determines how long the HIT is available to Workers. 
    - A HIT also has an assignment duration, which is the amount of time a Worker has to complete a HIT after accepting it.
  - A **Worker** is a person who performs the tasks specified by a Requester in a HIT.
    - The Requester specifies how many Workers can work on a task. 
    - Amazon Mechanical Turk guarantees that a Worker can work on each task only one time.
  - **Developers** create the Mechanical Turk applications that Requesters and Workers use.
    - Requesters can create and advertise work using the Mechanical Turk command line interface or the Requester User Interface and thereby not need  developers
  - An **Assignment** specifies how many people can submit completed work for your HIT. When a Worker accepts a HIT, MTurk creates an assignment to track the work to  completion. The assignment belongs exclusively to the Worker and  guarantees that the Worker can submit results and be eligible for a  reward until the time the HIT or assignment expires.
  - A **reward** is the money a Requester pays to Workers for the satisfactory work they do on HITs.
  - A **Qualification** is an attribute assigned by you to a Worker. It includes a name and a  number value. A HIT can include Qualification requirements that a Worker must meet before they are allowed to accept the HIT.
    - A Qualification type may include a *Qualification test*. A Qualification test is a set of questions, similar to a HIT, that the Worker must answer to request the Qualification.

Sources:

* https://aws.amazon.com/premiumsupport/knowledge-center/mechanical-turk-use-cases/
* https://www.mturk.com/
* https://docs.aws.amazon.com/AWSMechTurk/latest/AWSMechanicalTurkRequester/Welcome.html