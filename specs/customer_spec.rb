require('minitest/autorun')
require('minitest/rg')

require_relative('../models/customer')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new({'name' => 'Joe Stafford', 'funds' => 10})
  end

  def test_get_funds
    assert_equal(10, @customer1.funds)
  end

end
