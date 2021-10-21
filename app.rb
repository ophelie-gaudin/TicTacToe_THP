require'bundler'
require 'colorize'
Bundler.require
require_relative 'lib/player'
require_relative 'lib/boardcase'
require_relative 'lib/board'
require_relative 'lib/game'


def title_game()

  puts " "
  puts " "
  puts " "

  puts"  ████████╗██╗ ██████╗      ".blue
  puts"  ╚══██╔══╝██║██╔════╝      ".blue
  puts"     ██║   ██║██║           ".blue
  puts"     ██║   ██║██║           ".blue
  puts"     ██║   ██║╚██████╗      ".blue
  puts"     ╚═╝   ╚═╝ ╚═════╝      ".blue
  sleep 1
  puts"                            "
  puts"  ████████╗ █████╗  ██████╗ ".yellow
  puts"  ╚══██╔══╝██╔══██╗██╔════╝ ".yellow
  puts"     ██║   ███████║██║      ".yellow
  puts"     ██║   ██╔══██║██║      ".yellow
  puts"     ██║   ██║  ██║╚██████╗ ".yellow
  puts"     ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ".yellow
  sleep 1
  puts"                            "
  puts"  ████████╗ ██████╗ ███████╗".red
  puts"  ╚══██╔══╝██╔═══██╗██╔════╝".red
  puts"     ██║   ██║   ██║█████╗  ".red
  puts"     ██║   ██║   ██║██╔══╝  ".red
  puts"     ██║   ╚██████╔╝███████╗".red
  puts"     ╚═╝    ╚═════╝ ╚══════╝".red
  puts"                            ".red

  puts "Voici l'emblématique jeu qui déchaine les passions!".green
  puts "Trouve un adversaire et remporte la victoire !".green
  puts " "
  puts " "
end

def play_game
  game = Game.new
  puts "----------------------------------------------------------------"
  puts "C'est au tour de #{game.current_player.name} ! ".blue

  while game.turn_number <= 8 
      
    game.turn(game.board, game.current_player, game.current_style, game)
    
    
    if game.win_condition(game.board.boardcases_array, game.current_style) 
      puts "\nBravo, #{game.current_player.name} a gagné ! :D".red
      break 
    elsif game.turn_number == 9
        puts "\nMince, aucun de vous deux n'a gagné...".red 
      break 
    
    end
  
  end

end


# Rejouer ?
def try_again()
  puts "Voulez-vous refaire une partie ?"
  puts "Y : yes"
  puts "n : no"
  response = gets.chomp

  while (!["Y", "n"].include?(response))
    puts "Nous n'avons pas compris ta réponse..."
    response = gets.chomp
  end


  if response == "Y"
    return true
  else
    puts "\nA la prochaine ;)"
    return false
  end

end


def perform()
  title_game()
  play_game()

  puts " "
  puts " "
  puts " "

  while ( try_again() )
    play_game()
  end
  # cette boucle permet d'écraser les parties précédentes sans retenir les données des parties précédentes (permet de ne pas utiliser trop de rames)

end


perform