class Enemy
  attr_reader :x, :y
  def initialize
    @x = rand(Window.width)
    @y = 0
    @y_velocity = (10..20).to_a.sample
    @colors = %w[green lime purple]
    @color = @colors.sample
    @width = 20
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

  def collision_detected?(player)
    @rect.contains?(player.x1, player.y1) ||
    @rect.contains?(player.x2, player.y2) ||
    @rect.contains?(player.x3, player.y3) ||
    @rect.contains?(player.x4, player.y4)
  end
end