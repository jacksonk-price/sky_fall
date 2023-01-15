require 'ruby2d'

set background: 'black'
set width: 1200
set height: 800

class Box
  def initialize
    @x = rand(Window.width)
    @y = 0
    @y_velocity = (3..5).to_a.sample
    @color = Color.new('white')
  end

  def draw
    @square = Square.new(x: @x, y: @y, size: 15, color: @color)
  end

  def move
    @y = @y + @y_velocity
  end

  def off_screen?
    @y > 800
  end
end

tick = 0
$boxes = Array.new

update do
  clear
  $boxes << Box.new if tick % 5 == 0
  $boxes.each do |box|
    box.move
    if box.off_screen?
      $boxes.delete(box)
    else
      box.draw
    end
  end
  tick += 1
end

show