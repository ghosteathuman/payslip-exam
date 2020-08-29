class PayslipsController < ActionController::Base
  skip_forgery_protection

  def generate_monthly_payslip
    if request['employee_name'].blank? || request['annual_salary'].to_i.negative?
      render json: { "Error": "Invalid input. Please ensure that the name is not empty and annual salary is not negative" }, status: :bad_request and return
    end

    gross_monthly_income = request['annual_salary'].to_i / 12
    monthly_income_tax = calculate_income_tax(request['annual_salary'].to_i) / 12
    net_monthly_income = gross_monthly_income - monthly_income_tax

    payslip = Payslip.create(timestamp: DateTime.current, employee_name: request['employee_name'],\
                              annual_salary: "$#{sprintf('%.2f', request['annual_salary'])}",\
                              monthly_income_tax: "$#{sprintf('%.2f', monthly_income_tax)}")

    render json: {
      "employee_name": payslip.employee_name,
      "gross_monthly_income": "$#{sprintf('%.2f', gross_monthly_income)}",
      "monthly_income_tax": payslip.monthly_income_tax,
      "net_monthly_income": "$#{sprintf('%.2f', net_monthly_income)}"
    }
  end

  private
    def calculate_income_tax (annual_salary)
      if annual_salary <= 20000
        return 0
      elsif annual_salary >= 180001
        return 40000 + ((annual_salary - 180000) * 0.4)
      elsif annual_salary <= 40000
        return ((annual_salary - 20000) * 0.1)
      elsif annual_salary <= 80000
        return 2000 + ((annual_salary - 40000) * 0.2)
      elsif annual_salary <= 180000
        return 10000 + ((annual_salary - 80000) * 0.3)
      end
    end

    def payslip_params
      params.permit(:employee_name, :annual_salary)
    end
end
