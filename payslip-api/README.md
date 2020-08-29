# Payslip API

Payslip generation using Ruby on Rails.

## Requirement 2

### Decisions
- Decided not to turn the code in requirement 1 to a Gem. Since use case is straightforward and there is no code duplication, inserting the code directly seems like the most straightforward thing to do.
- Initially used decimal for the salary columns in database to support calculation. After looking at Requirement 4, I decided to change it to string to support consistent output with other formats.

### Ruby on Rails Creation Command
```bash
rails new payslip-api -d postgresql --api --skip-action-cable --skip-action-mailbox --skip-action-mailer --skip-action-text --skip-active-job --skip-active-storage --skip-keeps
```