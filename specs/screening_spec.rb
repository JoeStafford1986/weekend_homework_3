require('minitest/autorun')
require('minitest/rg')

require_relative('../models/screening')

class ScreeningTest < MiniTest::Test

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

    @film1.save()
  end

  # def test_most_popular
  #   @customer1.save()
  #   @film1.save()
  #   Ticket.create(@customer1,@film1)
  #   Ticket.create(@customer2,@film1)
  #   Ticket.create(@customer1,@film1)
  #   assert_equal(@film1, Screening.most_popular())
  # end

end
