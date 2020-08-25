require 'minitest/autorun'
require_relative 'payslip'

class PayslipTest < Minitest::Test
  def setup
    @payslip = Payslip.new
  end

  def test_generate_monthly_payslip
    assert_output("Monthly Payslip for: \"Ren\"\nGross Monthly Income: $5000.00\nMonthly Income Tax: $500.00\nNet Monthly Income: $4500.00\n") \
    { @payslip.generate_monthly_payslip "Ren", 60000}
  end
end