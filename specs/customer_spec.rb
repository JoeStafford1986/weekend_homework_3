require('minitest/autorun')
require('minitest/rg')

require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')
require_relative('../models/screening')

class CustomerTest < MiniTest::Test

  def setup

    Film.delete_all()
    Customer.delete_all()

    @customer1 = Customer.new({
      'name' => 'Joe Stafford',
      'funds' => 10
      })
    @customer2 = Customer.new({
      'name' => 'Joseph Stafford',
      'funds' => 1
      })

    @customer1.save()
    @customer2.save()

    @film1 = Film.new({
      'title' => 'Dr Strangelove',
      'price' => 2
      })
    @film2 = Film.new({
      'title' => 'The Ladykillers',
      'price' => 1
      })

    @film1.save()
    @film2.save()

    @screening1 = Screening.new({
      'show_time' => '12:00',
      'capacity' => 50,
      'film_id' => @film1.id
      })
    @screening2 = Screening.new({
      'show_time' => '18:00',
      'capacity' => 100,
      'film_id' => @film2.id
      })
    @screening3 = Screening.new({
      'show_time' => '00:00',
      'capacity' => 10,
      'film_id' => @film1.id
      })

    @screening1.save()
    @screening2.save()
    @screening3.save()
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
    Ticket.create(@customer1, @film1, @screening1)
    assert_equal(1, @customer1.films().count)
  end

  def test_get_film_count__no_tickets
    assert_equal(0, @customer1.films().count)
  end

  def test_get_ticket_count
    Ticket.create(@customer1, @film1, @screening1)
    Ticket.create(@customer1, @film1, @screening3)
    assert_equal(2, @customer1.tickets().count)
  end

end
