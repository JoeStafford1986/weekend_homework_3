require_relative('../db/sql_runner')

require('pry')

class Screening

  attr_reader :id
  attr_accessor :show_time, :capacity, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @show_time = options['show_time']
    @capacity = options['capacity']
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (show_time, capacity, film_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@show_time, @capacity, @film_id]
    screening = SqlRunner.run( sql,values ).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings
    SET (show_time, capacity, film_id) = ($1, $2, $3)
    WHERE id = $4"
    values = [@show_time, @capacity, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def tickets()
    sql = "SELECT * FROM tickets
    WHERE screening_id = $1"
    values = [@id]
    ticket_data = SqlRunner.run(sql, values)
    return Ticket.map_items(ticket_data)
  end

  def self.most_popular()
    screenings = Screening.all()
    most_popular = screenings[0]
    screenings.each do |screening|
      screening_tickets = screening.tickets()
      if screening_tickets.count > most_popular.tickets.count
        most_popular = screening
      end
    end
    return most_popular.id
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    screening_data = SqlRunner.run(sql)
    return Screening.map_items(screening_data)
  end

  def self.map_items(screening_data)
    result = screening_data.map { |screening| Screening.new( screening ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

end
