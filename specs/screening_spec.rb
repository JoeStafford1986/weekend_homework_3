require('minitest/autorun')
require('minitest/rg')

require_relative('../models/screening')
require_relative('../models/film')
require_relative('../models/customer')
require_relative('../models/ticket')


class ScreeningTest < MiniTest::Test

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
      'title' => 'Dr Strangelove',
      'price' => 2
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
      'capacity' => 2,
      'film_id' => @film1.id
      })

    @screening1.save()
    @screening2.save()
    @screening3.save()

  end

  def test_most_popular
    Ticket.create(@customer1,@film1, @screening1)
    Ticket.create(@customer2,@film1, @screening1)
    Ticket.create(@customer1,@film2, @screening2)
    assert_equal(@screening1.id, Screening.most_popular())
  end

end
