require('minitest/autorun')
require('minitest/rg')

require_relative('../models/film')
require_relative('../models/customer')
require_relative('../models/ticket')


class FilmTest < MiniTest::Test

  def setup

    Film.delete_all()
    Customer.delete_all()

    @film1 = Film.new({
      'title' => 'Dr Strangelove',
      'price' => 2
      })

    @film1.save()

    @customer1 = Customer.new({
      'name' => 'Joe Stafford',
      'funds' => 10
      })

    @customer1.save()

    @screening1 = Screening.new({
      'show_time' => '12:00',
      'capacity' => 50,
      'film_id' => @film1.id
      })

    @screening1.save()
  end

  def test_get_customer_count
    @film1.save()
    @customer1.save()
    Ticket.create(@customer1, @film1, @screening1)
    assert_equal(1, @film1.customers().count)
  end

  def test_get_customer_count__no_customers
    @film1.save()
    assert_equal(0, @film1.customers().count)
  end

end
