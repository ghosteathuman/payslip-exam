class Payslip

  def generate_monthly_payslip (employee_name, annual_salary)
    if !employee_name.is_a?(String) && annual_salary.negative?
      puts "Invalid input. Please ensure that the name is a String and annual salary is not negative"
    end

    if annual_salary <= 20000
      annual_income_tax = 0
    elsif annual_salary >= 180001
      annual_income_tax = 40000 + ((annual_salary - 180000) * 0.4)
    elsif annual_salary <= 40000
      annual_income_tax = ((annual_salary - 20000) * 0.1)
    elsif annual_salary <= 80000
      annual_income_tax =  2000 + ((annual_salary - 40000) * 0.2)
    elsif annual_salary <= 180000
      annual_income_tax = 10000 + ((annual_salary - 80000) * 0.3)
    end

    gross_monthly_income = annual_salary / 12
    monthly_income_tax = annual_income_tax / 12
    net_monthly_income = gross_monthly_income - monthly_income_tax

    puts "Monthly Payslip for: \"#{employee_name}\""
    puts "Gross Monthly Income: $#{sprintf('%.2f', gross_monthly_income)}"
    puts "Monthly Income Tax: $#{sprintf('%.2f', monthly_income_tax)}"
    puts "Net Monthly Income: $#{sprintf('%.2f', net_monthly_income)}"
  end
end
