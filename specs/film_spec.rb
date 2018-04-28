require('minitest/autorun')
require('minitest/rg')

require_relative('../models/film')
require_relative('../models/customer')
require_relative('../models/ticket')


class FilmTest < MiniTest::Test

  def setup
    @film1 = Film.new({'title' => 'Dr Strangelove', 'price' => 2})
    @customer1 = Customer.new({'name' => 'Joe Stafford', 'funds' => 10})
  end

  def test_get_customer_count
    @film1.save()
    @customer1.save()
    Ticket.create(@customer1, @film1)
    assert_equal(1, @film1.customers().count)
  end

end
