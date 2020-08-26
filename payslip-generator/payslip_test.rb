require 'minitest/autorun'
require_relative 'payslip'

class PayslipTest < Minitest::Test
  def setup
    @payslip = Payslip.new
  end

  def test_tax_salary_first_bracket
    assert @payslip.calculate_income_tax(0) == 0
  end

  def test_tax_salary_10_bracket
    assert @payslip.calculate_income_tax(35000) == 1500
  end

  def test_tax_salary_20_bracket
    assert @payslip.calculate_income_tax(60000) == 6000
  end

  def test_tax_salary_30_bracket
    assert @payslip.calculate_income_tax(80150) == 10045
  end

  def test_tax_salary_max_bracket
    assert @payslip.calculate_income_tax(200000) == 48000
  end

  def test_generate_monthly_payslip
    assert_output("Monthly Payslip for: \"Ren\"\nGross Monthly Income: $5000.00\nMonthly Income Tax: $500.00\nNet Monthly Income: $4500.00\n") \
    { @payslip.generate_monthly_payslip "Ren", 60000}
  end
end