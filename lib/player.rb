class Player
  def initialize
    @x = Window.width / 2
    @y = Window.height - 20
    @x_velocity = 5
    @color = Color.new('red')
  end

  def display
    Square.new(x: @x, y: @y, size: 20, color: @color)
  end

  def move_left
    @x = @x + -@x_velocity
  end

  def move_right
    @x = @x + @x_velocity
  end
  def off_screen?
    @x < 0 || x > Window.width
  end

end