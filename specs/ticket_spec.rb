require('minitest/autorun')
require('minitest/rg')

require_relative('../models/ticket')

class TicketTest < MiniTest::Test

  def setup

    Film.delete_all()
    Customer.delete_all()
    
    @customer1 = Customer.new({
      'name' => 'Joe Stafford',
      'funds' => 10
      })

    @customer1.save()

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

  def test_create
    # @customer1.save()
    # @film1.save()
    # @screening1.save()
    Ticket.create(@customer1, @film1, @screening1)
    assert_equal(1, Ticket.all().count)
  end

end
