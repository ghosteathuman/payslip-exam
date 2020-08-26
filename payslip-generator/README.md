# README

## REQUIREMENTS 1

### Example Usage
```ruby
payslip = Payslip.new
payslip.generate_monthly_payslip "Ren", 60000
payslip.generate_monthly_payslip "Mid", 80150
payslip.generate_monthly_payslip "Rich", 200000
```

### How to run tests
```bash
$ ruby payslip_test.rb
```

### Bracket Calculation

- First 20000: 0
- Second 20000: 2000
- Third 40000: 8000
- Fourth 100000: 30000
- Above 100000: x * 0.4

### TODO
