require 'ruby2d'

set background: 'black'
set width: 1200
set height: 800

class Star
  def initialize
    @x = rand(Window.width)
    @y = rand(Window.height)
    @color = Color.new('white')
    @radius = 2
  end

  def draw
    @star = Circle.new(x: @x, y: @y, radius: @radius, color: 'white')
  end

  def twinkle

  end
end

class Box
  def initialize
    @x = rand(Window.width)
    @y = 0
    @y_velocity = (3..5).to_a.sample
    @color = Color.new('green')
  end

  def draw
    @rect = Rectangle.new(x: @x, y: @y, width: 5, height: 20, color: @color)
  end

  def move
    @y = @y + @y_velocity
  end

  def off_screen?
    @y > 800
  end
end

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

tick = 0
$stars = Array.new(100) { Star.new}
$boxes = Array.new
player = Player.new

on :key do |e|
  if e.type == :held
    # Here we check the bounds of the screen so the player can't trespass them.
    case e.key
    when 'left'
      player.move_left
    when 'right'
      player.move_right
    end
  end
end

update do
  clear
  $stars.each do |star|
    star.draw
  end
  player.display
  $boxes << Box.new if tick % 5 == 0
  $boxes.each do |box|
    box.move
    box.draw
    if box.off_screen?
      $boxes.delete(box)
    else
      box.draw
    end
  end
  tick += 1
end

show