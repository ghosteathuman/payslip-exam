class ChangePayslipsDecimalToString < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      change_table :payslips do |t|
        dir.up  do
          t.change :annual_salary, :string
          t.change :monthly_income_tax, :string
        end
        dir.down do
          t.change :annual_salary, :decimal
          t.change :monthly_income_tax, :decimal
        end
      end
    end
  end
end
