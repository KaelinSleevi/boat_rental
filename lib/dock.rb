class Dock
  attr_reader :name,
              :max_rental_time,
              :boats,
              :renters,
              :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @boats = []
    @renters = []
    @rental_log = {}
  end

  def add_boat(boat)
    @boats << boat
  end

  def add_renters(renter)
    @renters << renter
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end
end
