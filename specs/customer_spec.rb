require('minitest/autorun')
require('minitest/rg')

require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new({'name' => 'Joe Stafford', 'funds' => 10})
    @customer2 = Customer.new({'name' => 'Joseph Stafford', 'funds' => 1})
    @film1 = Film.new({'title' => 'Dr Strangelove', 'price' => 2})
    @film2 = Film.new({'title' => 'The Ladykillers','price' => 1})
  end

  def test_get_funds
    assert_equal(10, @customer1.funds)
  end

  def test_pay_for_film
    @customer1.pay_for_film(@film1)
    assert_equal(8, @customer1.funds)
  end

  def test_pay_for_film__not_enough_funds
    @customer2.pay_for_film(@film1)
    assert_equal(1, @customer2.funds)
  end

  def test_get_film_count
    @customer1.save()
    @film1.save()
    Ticket.create(@customer1, @film1)
    assert_equal(1, @customer1.films().count)
  end

  def test_get_film_count__no_tickets
    @customer1.save()
    assert_equal(0, @customer1.films().count)
  end

  def test_get_ticket_count
    @customer1.save()
    @film1.save()
    Ticket.create(@customer1, @film1)
    Ticket.create(@customer1, @film1)
    assert_equal(2, @customer1.tickets().count)
  end

end
