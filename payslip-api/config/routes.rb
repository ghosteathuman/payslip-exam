Rails.application.routes.draw do
  get '/monthly_payslip', to:'payslips#index'
  post '/monthly_payslip', to:'payslips#generate_monthly_payslip'
end
