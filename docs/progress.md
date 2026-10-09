# Development log

## 2026-10-08

### Airtable setup
- Created the core tables: Klientët, Shoferët and Udhëtimet.
- Linked the test trip to an existing customer and driver.
- Added the I përfunduar formula:
  IF({Statusi}="PËRFUNDUAR",1,0)
- Configured Numri total i udhëtimeve as a Rollup
  of I përfunduar using SUM(values).

### Manual test
Changing the linked test trip to PËRFUNDUAR changed
the customer's total from 0 to 1.
Restoring the previous status returned the total to 0.

This verifies the Airtable calculation.
The automated completion workflow is still pending.

### Next step
Connect n8n Cloud to Airtable and test database access.

## Request workflow progress

- Tested the customer form with all six required fields.
- Tested phone normalization and rejection of an invalid phone.
- Verified that invalid input displays an error message.
- Verified existing-customer lookup and routing.
- Created a test trip with status KËRKUAR and a linked customer.

Driver assignment, notifications and duplicate-request protection
are not implemented yet.

## Assignment and notification tests
- Linked a test trip to an available driver.
- Updated the driver to I ZËNË and the trip to CAKTUAR.
- Verified Gmail sending with a separate test workflow;
  the test email arrived.
- Tested a request while no driver was available:
  the new trip remained KËRKUAR without a driver,
  and the customer form displayed an availability message.

Assignment emails with PRANO / REFUZO actions are still pending.
Concurrent assignment protection is unresolved.

## Reservation coordination
- Selected Neon PostgreSQL for reservation coordination,
  with trainer approval. Airtable remains the central database.
- Verified the n8n connection to Neon.
- Verified that a reserved driver cannot be reserved
  for another trip.
- Verified that a reserved trip cannot receive
  a second driver reservation.
- Removed the synthetic reservation and confirmed zero rows.

These tests ran sequentially. Concurrent execution,
workflow integration and recovery are still pending.

## 2026-10-09

### Assignment and driver decisions

- Integrated Neon reservations into driver assignment and reassignment.
- Added hashed action tokens for PRANO and REFUZO.
- Tested acceptance: the decision operation completed and the customer received an email.
- Tested refusal with an available replacement: the request was sent to another driver.
- Tested refusal without a replacement: the trip remained KËRKUAR and the customer received a waiting notification.
- Verified that both refusal operations completed and no reservation remained for that test trip.

### Trip start

- Added GET confirmation and POST decision webhooks.
- Tested JO: the trip start was not recorded.
- Tested PO: the trip changed to NË UDHËTIM.
- Added generation and delivery of the trip completion link.

## 2026-10-10

### Trip completion

- Added completion confirmation and decision handling.
- Handled trailing whitespace in trip status comparisons.
- Tested JO: completion was not recorded.
- Tested PO: the trip changed to PËRFUNDUAR and the completion date was recorded.
- Verified that the driver returned to I LIRË.
- Verified that the customer's completed-trip total increased from 1 to 2.

### Remaining work

- Build the Botpress agent with verified customer and driver identity.
- Restrict queries and actions to the authenticated user's own records.
- Test a fresh request through acceptance, start and completion, including all automatic emails.
- Test concurrent requests and repeated submissions of used action links.
- Save the current workflows and remaining Neon schema in GitHub.
- Finish documentation and demonstration videos.
