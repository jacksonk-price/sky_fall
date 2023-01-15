require 'ruby2d'
require './lib/player.rb'
require './lib/enemy.rb'

set title: "Sky Fall"
set width: 1200
set height: 800
music = Music.new('./assets/RhytmicBounceB.mp3')
music.volume = 10
music.loop = true
music.play
score = 0
tick = 0
$enemies = Array.new
player = Player.new

score_text = Text.new(
  "Score: #{score}",
  x: Window.width / 2, y: 15,
  style: 'bold',
  size: 20,
  color: 'white'
)

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
  player.display
  $enemies << Enemy.new if tick % 5 == 0
  $enemies.each do |enemy|
    enemy.move
    enemy.draw
    enemy.off_screen? ? $enemies.delete(enemy) : enemy.draw
  end
  tick += 1
  if tick % 60 == 0
    score += 1
    score_text.text = "Score: #{score}"
  end
end

show