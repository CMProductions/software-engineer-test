# Pizzeria Challenge

TeamCmp serves the best pizza in town, and we want now to digitalize our 
business.

You are in charge of designing and implementing an API to manage our reservation 
system which will be used to track the available seats in the tables. 

We really like to make new friends, so group of people can share the same table.

A table can have a different amount of seats available, they can accommodate 
groups of up to 4, 5 or 6 people.

People requests tables in groups of 1 to 6. People in the same group want to sit
in the same table. You can take any group at any table that has enough empty 
seats for them. If it's not possible to accommodate them, they're willing to 
wait until there's a table available for them. Once a table is available for a 
group that is waiting, they should seat. 

Once they get a table assigned, you cannot ask them to sit in another table
(i.e. you cannot swap them to another table to make space for another group).

In terms of fairness of queue order: groups should be served as fast as possible,
but the arrival order should be kept when possible.
If group B arrives later than group A, it can only be sit before group A
if no table is available for group A.

For example: a group of 6 is waiting for a table and there are 4 empty seats at
a table for 6; if a group of 2 requests a table you may take them in the table.
This may mean that the group of 6 waits a long time, possibly until they become 
frustrated and leave.

## API

To simplify the challenge and remove language restrictions, this service must
provide a REST API which will be used to interact with it.

However, these are 
the languages we prefer to use in-house:
- PHP
- GoLang
- NodeJs

This API must comply with the following contract:

### GET /status

Indicate the service has started up correctly and is ready to accept requests.

Responses:

* **200 OK** When the service is ready to receive requests.

### PUT /tables

Load the list of available tables in the service and remove all previous data
(existing reservations and tables). This method may be called more than once 
during the life cycle of the service.

**Body** _required_ The list of tables to load.

**Content Type** `application/json`

Sample:

```json
[
  {
    "id": 1,
    "seats": 4
  },
  {
    "id": 2,
    "seats": 6
  }
]
```

Responses:

* **200 OK** When the list is registered correctly.
* **400 Bad Request** When there is a failure in the request format, expected
  headers, or the payload can't be unmarshalled.

### POST /reservation

A group of people requests to perform a reservation.

**Body** _required_ The group of people that wants to perform the reservation

**Content Type** `application/json`

Sample:

```json
{
  "id": 1,
  "people": 4
}
```

Responses:

* **200 OK** or **202 Accepted** When the group is registered correctly
* **400 Bad Request** When there is a failure in the request format or the
  payload can't be unmarshalled.

### POST /leave

A group of people requests to leave. Whether they are sit or not.

**Body** _required_ A form with the group ID, such that `ID=X`

**Content Type** `application/x-www-form-urlencoded`

Responses:

* **200 OK** or **204 No Content** When the group is unregistered correctly.
* **404 Not Found** When the group is not to be found.
* **400 Bad Request** When there is a failure in the request format or the
  payload can't be unmarshalled.

### POST /locate

Given a group ID such that `ID=X`, return the table the group is assigned to,
 or empty if they are still waiting to be sit.

**Body** _required_ A url encoded form with the group ID such that `ID=X`

**Content Type** `application/x-www-form-urlencoded`

**Accept** `application/json`

Responses:

* **200 OK** With the table as the payload when the group is assigned to a table.
* **204 No Content** When the group is waiting to be assigned to a table.
* **404 Not Found** When the group is not to be found.
* **400 Bad Request** When there is a failure in the request format or the
  payload can't be unmarshalled.

Sample:
```
{
  "id": 2,
  "seats": 6
}
```
## Evaluation criteria
### Working solution

We prioritize working solutions.

### Documentation

Documentation is very important. Please modify the SUMMARY.md with all the 
useful info about the project. Structure it in the way you would do for a real
 project.

### Tests

Add some test to the code. Unit tests are a must, integration, E2E or others
 are a plus.

### Delivery

Please squash your commits into one, create a git patch 
(https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/) 
and email your completed test to us.

**Before send the patch, please double check it's working cloning again
 the repo and applying it.**

## Tooling

### Dockerfile or Docker-compose

Add a simple Dockerfile or a Docker Compose to run your project. 

### Makefile

Add to the Makefile any recipe you need in order to make your or our life
 easier. 
Can you automate the spin up of the project? 
Run the tests? This is the right place for your commands.

## Thanks

Your participation is really important. Thanks for your contribution!

Buon Appetito!
