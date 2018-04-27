require('pry-byebug')

require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

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

film1 = Film.new({
  'title' => 'Dr Strangelove',
  'price' => '2'
  })
film2 = Film.new({
  'title' => 'The Ladykillers',
  'price' => '1'
  })

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

binding.pry
nil
