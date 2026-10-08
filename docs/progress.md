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
