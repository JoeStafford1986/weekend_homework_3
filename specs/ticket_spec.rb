require('minitest/autorun')
require('minitest/rg')

require_relative('../models/ticket')

class TicketTest < MiniTest::Test

  def setup
    @customer1 = Customer.new({'name' => 'Joe Stafford', 'funds' => 10})
    @film1 = Film.new({'title' => 'Dr Strangelove', 'price' => 2})
  end

  def test_create
    @customer1.save()
    @film1.save()
    Ticket.create(@customer1,@film1)
    assert_equal(1, Ticket.all().count)
  end

end
