require "test_helper"

class DiagnosesControllerTest < ActionDispatch::IntegrationTest
  test "should get diagnose" do
    get diagnoses_diagnose_url
    assert_response :success
  end

  test "should get result" do
    get diagnoses_result_url
    assert_response :success
  end
end
