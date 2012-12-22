require 'test_helper'

class BaseballRegistrationFlowsTest < ActionDispatch::IntegrationTest
  test "Baseball" do
    https!
    get '/'
    assert_response :success
    
    get '/baseballs/new'
    assert_response :success
  end

  test "Post valid baseball registration" do
    post '/baseballs', :baseball => {
      "type"=>"Baseball",
      "player_first_name"=>"First",
      "player_last_name"=>"Last",
      "player_nickname"=>"Nickname",
      "father_first_name"=>"Father",
      "father_last_name"=>"FLast",
      "mother_first_name"=>"Mother",
      "mother_last_name"=>"MLast",
      "address_line_1"=>"1234 Main Street",
      "address_line_2"=>"Apt I",
      "city"=>"Honlulu",
      "state"=>"HI",
      "zip_code"=>"96819",
      "email_address"=>"test.user@nowhere.com",
      "home_phone"=>"(808) 123-4567",
      "father_cell_phone"=>"(808) 456-9876",
      "father_work_phone"=>"(808) 555-6666 x1234",
      "mother_cell_phone"=>"(808) 654-1234",
      "mother_work_phone"=>"(808) 839-7777 x2",
      "emergency_name"=>"emergency name",
      "emergency_phone"=>"(808) 123-4567",
      "birth_date(2i)"=>"2",
      "birth_date(3i)"=>"29",
      "birth_date(1i)"=>"2000",
      "age"=>"12",
      "gender"=>"M",
      "grade"=>"7",
      "school"=>"Moanalua Elementary School",
      "shirt_size"=>"AS",
      "pants_size"=>"YXS",
      "division"=>"Bronco",
      "special_requests"=>"Special...",
      "has_medical_insurance"=>"true",
      "medical_insurance_name"=>"HMSA",
      "practice_days"=>["M", "Tu", "W", "Th", "F", ""],
      "volunteer_type"=>"Head Coach",
      "parent_name_for_agreement"=>"Parent agreement"
  }

   assert_redirected_to polymorphic_path(assigns(:registration))+"/thankyou"
   assert_equal("Father", assigns(:registration).father_first_name)
   assert_equal(false, assigns(:registration).new_record?)
   assert_equal(true, assigns(:registration).valid?)
   assert_equal("POST", assigns(:registration).method)
   assert_equal("/baseballs", assigns(:registration).request_fullpath)

  end

  test "Post invalid baseball registration" do
    post '/baseballs', :baseball => {}
    
    assert_response :success
    assert_equal(nil, assigns(:registration).id)
    assert_equal(false, assigns(:registration).valid?)
  end
end