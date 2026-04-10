Overview

This project is focused on building a simple but realistic approval flow in Business Central, combining sales logic with the idea of production-related decisions.

The goal wasn’t just to add buttons, but to simulate how a real process might work — where actions depend on validation and approval, not just user input.

What’s implemented
Custom approval actions:
Send for approval
Approve
Reject
Basic customer validation logic (credit check concept)
Custom data structure using AL:
tables
pages
codeunits
permissions
Separation of logic from UI (business logic handled in codeunits)
How it works (concept)
User creates or selects a record
Sends it for approval
System evaluates basic conditions (e.g. customer-related logic)
Record can be approved or rejected based on workflow

The idea is to simulate controlled decision-making instead of direct processing.

Technical notes
AL extension developed in VS Code
Focus on modular structure (not putting logic directly into pages)
Initial use of event-driven approach where applicable
Version controlled with Git
Current limitations

There are still parts being improved, especially around:

customer data handling
credit check logic
data consistency between custom and standard tables
Next steps
Improve credit validation logic
Stabilize data flow with Customer records
Extend towards production features:
production orders
BOM
routing
planning logic
Why this project

I built this to move beyond basic examples and get closer to real Business Central scenarios — where workflows, validation, and business rules are connected.
