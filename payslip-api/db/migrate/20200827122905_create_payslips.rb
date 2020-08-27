class CreatePayslips < ActiveRecord::Migration[6.0]
  def change
    create_table :payslips do |t|
      t.datetime :timestamp
      t.string :employee_name
      t.decimal :annual_salary
      t.decimal :monthly_income_tax
    end
  end
end
