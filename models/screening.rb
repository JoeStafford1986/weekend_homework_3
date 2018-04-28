require_relative('../db/sql_runner')

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

  def self.all()
    sql = "SELECT * FROM screenings"
    screening_data = SqlRunner.run(sql)
    return Screening.map_items(screening_data)
  end

  def self.map_items(screening_data)
    result = screening_data.map { |screening| Screening.new( screening ) }
    return result
  end

end
