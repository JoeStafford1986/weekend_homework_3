require('minitest/autorun')
require('minitest/rg')

require_relative('../models/customer')
require_relative('../models/film')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new({'name' => 'Joe Stafford', 'funds' => 10})
    @film1 = Film.new({'title' => 'Dr Strangelove', 'price' => 2})
  end

  def test_get_funds
    assert_equal(10, @customer1.funds)
  end

  def test_pay_for_film
    @customer1.pay_for_film(@film1)
    assert_equal(8, @customer1.funds)
  end

end
