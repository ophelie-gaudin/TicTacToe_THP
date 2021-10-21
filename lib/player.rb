class Player 
  attr_accessor :name, :player_style 

  def initialize(player_style)
    puts "Hey, voilà un nouveau joueur! comment t'appelles-tu ? "
    print ">"
    @name= gets.chomp
    @player_style = player_style
    # @choose_a_case = choose_a_case
  end
  
  
  def choose_a_case(board, game)
    puts "Choisis une case :"
    chosen_case = gets.chomp.to_s.upcase
    
    board.boardcases_array.each do |boardcase|
      if boardcase.id_case == chosen_case

        if boardcase.value == "#"
          boardcase.is_chosen(@player_style)
          game.turn_number += 1

        elsif boardcase.value == "O" || "X"
          puts "Désolé mais cette case est déjà utilisée... "
          puts "et comme tu ne sembles pas très concentré, tu as perdu ton tour !"
        end

      end
    end
    
  end
  
end
