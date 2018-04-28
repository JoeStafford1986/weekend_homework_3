require('pry-byebug')

require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')
require_relative('../models/screening')

customer1 = Customer.new({
  'name' => 'Joe Stafford',
  'funds' => '10'
  })
customer2 = Customer.new({
  'name' => 'Euan Bell',
  'funds' => '5'
  })
customer3 = Customer.new({
  'name' => 'Ruairidh Grass',
  'funds' => '20'
  })
customer4 = Customer.new({
  'name' => 'Paul Stevenson',
  'funds' => '10'
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()


film1 = Film.new({
  'title' => 'Dr Strangelove',
  'price' => '2'
  })
film2 = Film.new({
  'title' => 'The Ladykillers',
  'price' => '1'
  })

film1.save()
film2.save()

screening1 = Screening.new({
  'show_time' => '12:00',
  'capacity' => 50,
  'film_id' => film1.id
  })
screening2 = Screening.new({
  'show_time' => '18:00',
  'capacity' => 100,
  'film_id' => film2.id
  })
screening3 = Screening.new({
  'show_time' => '00:00',
  'capacity' => 10,
  'film_id' => film1.id
  })
screening1.save()
screening2.save()
screening3.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })
ticket3 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film2.id
  })
ticket4 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film1.id
  })
ticket5 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

binding.pry
nil
