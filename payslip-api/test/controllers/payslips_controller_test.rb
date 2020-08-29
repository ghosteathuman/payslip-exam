require 'test_helper'

class PayslipsControllerTest < ActionDispatch::IntegrationTest
  test "will get salary computations" do
    get '/monthly_payslip', as: :json
    body = JSON.parse(response.body)

    assert_response :ok
    assert_equal 2, body["salary_computations"].length

    assert_equal "2020-08-28T20:00:00.000Z", body["salary_computations"][0]["timestamp"]
    assert_equal "Ren", body["salary_computations"][0]["employee_name"]
    assert_equal "$60000.00", body["salary_computations"][0]["annual_salary"]
    assert_equal "$500.00", body["salary_computations"][0]["monthly_income_tax"]

    assert_equal "2020-08-28T21:00:00.000Z", body["salary_computations"][1]["timestamp"]
    assert_equal "Ben", body["salary_computations"][1]["employee_name"]
    assert_equal "$200000.00", body["salary_computations"][1]["annual_salary"]
    assert_equal "$4000.00", body["salary_computations"][1]["monthly_income_tax"]
  end

  test "will generate and store monthly payslip" do
    assert_difference('Payslip.count') do
      post '/monthly_payslip', params: {
        employee_name: "Ren",
        annual_salary: 60000
      }, as: :json
    end
    body = JSON.parse(response.body)

    assert_response :ok
    assert_equal "Ren", body["employee_name"]
    assert_equal "$5000.00", body["gross_monthly_income"]
    assert_equal "$500.00", body["monthly_income_tax"]
    assert_equal "$4500.00", body["net_monthly_income"]
  end

  test "will fail when provided empty employee name" do
    post '/monthly_payslip', params: {
      employee_name: "",
      annual_salary: 60000
    }, as: :json

    assert_response :bad_request
  end

  test "will fail when provided negative annual salary" do
    post '/monthly_payslip', params: {
      employee_name: "Ren",
      annual_salary: -60000
    }, as: :json

    assert_response :bad_request
  end  
end
