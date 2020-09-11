class PizzaBot
  REGEX_VALID_INPUT = /^(\d+x\d+)( (\(\d+, \d+\)))+$/
  attr_reader :input_string

  def initialize(args)
    if args[0].match REGEX_VALID_INPUT
      @input_string = (args[0].delete '(,)').split
    else
      puts "Input argument must be in the form of '1x1 (1, 1)...'"
      exit
    end
  end

  def instructions
    result = ''
    current_location_x = 0
    current_location_y = 0
    xy_directions(result, current_location_x, current_location_y)
  end

  private

  def xy_directions(result, current_location_x, current_location_y)
    return 'Location is out of grid!' unless valid_location?

    (0..locations.length - 1).step(2).each do |i|
      starting_location_x = current_location_x
      starting_location_y = current_location_y

      current_location_x = locations[i]
      current_location_y = locations[i + 1]

      result += x_direction(current_location_x, starting_location_x)
      result += y_direction(current_location_y, starting_location_y)
      result += 'D'
    end
    result
  end

  def x_direction(current_location_x, starting_location_x)
    result_x = ''
    if (current_location_x - starting_location_x).positive?
      result_x = ('E' * (current_location_x - starting_location_x))
    elsif (current_location_x - starting_location_x).negative?
      result_x = ('W' * (current_location_x - starting_location_x).abs)
    end
    result_x
  end

  def y_direction(current_location_y, starting_location_y)
    result_y = ''
    if (current_location_y - starting_location_y).positive?
      result_y = ('N' * (current_location_y - starting_location_y))
    elsif (current_location_y - starting_location_y).negative?
      result_y = ('S' * (current_location_y - starting_location_y).abs)
    end
    result_y
  end

  def grid
    input_string[0].split('x').map(&:to_i)
  end

  def grid_x
    (0..grid[0])
  end

  def grid_y
    (0..grid[1])
  end

  def locations
    input_string[1..-1].map(&:to_i)
  end

  def valid_location?
    (0..locations.length - 1).step(2).each do |i|
      return false unless grid_x.include?(locations[i]) && grid_y.include?(locations[i + 1])
    end
    true
  end
end

