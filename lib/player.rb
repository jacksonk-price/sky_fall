class Player
  attr_reader :x, :y
  def initialize
    @x = Window.width / 2
    @y = Window.height - 30
    @x_velocity = 10
    @color = Color.new('red')
  end

  def display
    @player_body = Square.new(x: @x, y: @y, size: 25, color: @color)
  end

  def get_body
    @player_body
  end

  def move_left
    @x = (@x + -@x_velocity) % Window.width
  end

  def move_right
    @x = (@x + @x_velocity) % Window.width
  end

end