require 'test_helper'

class BaseballTest < ActiveSupport::TestCase
  def setup
    @reg = Baseball.new
  end

  test "payment_amount" do
    assert_nil(@reg.payment_amount)
    
    @reg.division = 'JrPinto'
    assert_equal(65, @reg.payment_amount)

    @reg.division = 'Pinto'
    assert_equal(75, @reg.payment_amount)

    @reg.division = 'Mustang'
    assert_equal(75, @reg.payment_amount)

    @reg.division = 'Bronco'
    assert_equal(80, @reg.payment_amount)

    @reg.division = 'Pony'
    assert_equal(80, @reg.payment_amount)

  end
end