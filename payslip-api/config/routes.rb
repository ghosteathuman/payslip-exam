Rails.application.routes.draw do
  post '/monthly_payslip', to:'payslips#generate_monthly_payslip'
end
