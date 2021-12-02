class Train
  attr_reader :number, :type, :route
  attr_accessor :station, :speed, :count

  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
    @speed = 0
  end
  
  def raise_speed(speed)
    self.speed += speed
  end
  def stop
    self.speed = 0
  end
  def add_carriage
    if self.speed == 0
      self.count += 1
    else
      puts "Stop before"
    end
  end
  def delete_carriage
      if self.speed == 0
        self.count -= 1
      else
        puts "Stop before"
      end
    end
    
  def route=(route)
    @route = route
    self.station = self.route.stations.first
  end
  def next_station
    self.route.stations[self.route.stations.index(self.station) + 1]
  end
  def previous_station
    self.route.stations[self.route.stations.index(self.station) - 1]
  end
  def move_next_station
    self.station = next_station if next_station
  end
  def move_back_station
    self.station = back_station if back_station
  end
end

class Route
  attr_reader :stations
  
  def initialize(start_station, finish_station)
    @stations = []
    @stations << start_station
    @stations << finish_station
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end
end

class Station
  attr_reader :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end
  
  def get_train(train)
    self.trains << train
  end
  
  def send_train(train)
    self.trains.delete(train)
  end
  
  def trains_by_type(type)
    self.trains.filter { |train| train.type == type }
  end
end
