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

end
