require 'ruby2d'
require './lib/player.rb'
require './lib/enemy.rb'

set title: "Sky Fall"
set width: 1200
set height: 800
music = Music.new('./assets/bgm_0.mp3')
music.volume = 10
music.loop = true
music.play
score = 0
tick = 0
hit_count = 0
$enemies = Array.new
player = Player.new
game_over = Sound.new('./assets/gameover_loud.mp3')
game_over.volume = 4
hit = Sound.new('./assets/spike_2.mp3')
hit.volume = 4

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
  $enemies << Enemy.new if tick % 4 == 0
  $enemies = $enemies.last(75)
  $enemies.each do |enemy|
    enemy.move
    enemy.draw
    # enemy.off_screen? ? $enemies.delete(enemy) : enemy.draw
    if enemy.collision_detected?(player.get_body)
      if hit_count > 2
        # game over
        game_over.play
        clear
        close
      else
        hit.play
        hit_count += 1
      end
    end
  end
  tick += 1
  if tick % 60 == 0
    score += 1
  end
  Text.new(
    "Score: #{score}",
    x: (Window.width / 2) - 30, y: 15,
    style: 'bold',
    size: 25,
    color: 'white'
  )
end

show