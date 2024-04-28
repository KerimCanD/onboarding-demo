require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @company = companies(:one)
    login(@user)
  end
  
  teardown do
    assert_response :success
  end

  test "should set lead time" do
    lead_time = 10
    post update_lead_time_url, params: { lead_time: lead_time }, headers: { "Authorization" => "Bearer #{@token}" }, as: :json
    assert_equal lead_time, @company.reload.lead_time
    assert_equal lead_time, response.parsed_body["lead_time"]
  end

  test "should set days_of_stock" do
    days_of_stock = 30
    post update_days_of_stock_url, params: { days_of_stock: days_of_stock }, headers: { "Authorization" => "Bearer #{@token}" }, as: :json
    assert_equal days_of_stock, @company.reload.days_of_stock
    assert_equal days_of_stock, response.parsed_body["days_of_stock"]
  end

  test "should set forecasting_days" do
    forecasting_days = 20
    post update_forecasting_days_url, params: { forecasting_days: forecasting_days }, headers: { "Authorization" => "Bearer #{@token}" }, as: :json
    assert_equal forecasting_days, @company.reload.forecasting_days
    assert_equal forecasting_days, response.parsed_body["forecasting_days"]
  end

end
