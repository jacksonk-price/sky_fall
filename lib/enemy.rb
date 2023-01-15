class Enemy
  def initialize
    @x = rand(Window.width)
    @y = 0
    @y_velocity = (5..7).to_a.sample
    @colors = %w[green lime]
    @color = @colors.sample
    @width = 5
    @height = 20
  end

  def draw
    @rect = Rectangle.new(x: @x, y: @y, width: @width, height: @height, color: @color)
  end

  def move
    @y = @y + @y_velocity
  end

  def off_screen?
    @y > 800
  end
end