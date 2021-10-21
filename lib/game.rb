require_relative './boardcase'
require_relative './player'
require_relative './board'


class Game  
  # la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :players , :board , :current_player, :current_style ,:turn_number
  
  def initialize
    # créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    player1 = Player.new('Pierre' , "X" )
    player2 = Player.new('michel' , "O" )
    @player1 = player1
    @player2 = player2
    @players= [player1, player2]
    @board = Board.new
    @current_player = @current_player == @player1 ? @player2 : @player1
    @current_style = @current_player.player_style
    @turn_number = 0
  end
  

  def turn(board, current_player, current_style, game)
    #méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    board.show_board()
    chosen_case = current_player.choose_a_case(board, game)
    cases_array = board.boardcases_array
    board.change_value_boardcases_array(cases_array, chosen_case, current_style)

    players_array = @players
    switch_player(@current_player, players_array[0], players_array[1])  
  end



   def win_condition(boardcases_array, current_style)
    if boardcases_array[0].value == boardcases_array[1].value && boardcases_array[1].value == boardcases_array[2].value && boardcases_array[2].value == current_style
      return true
    elsif boardcases_array[3].value == boardcases_array[4].value && boardcases_array[4].value == boardcases_array[5].value && boardcases_array[5].value == current_style
      return true
    elsif boardcases_array[6].value == boardcases_array[7].value && boardcases_array[7].value == boardcases_array[8].value && boardcases_array[8].value == current_style
      return true
    elsif boardcases_array[0].value == boardcases_array[3].value && boardcases_array[3].value == boardcases_array[6].value && boardcases_array[6].value == current_style
      return true
    elsif boardcases_array[1].value == boardcases_array[4].value && boardcases_array[4].value == boardcases_array[7].value && boardcases_array[7].value == current_style
      return true
    elsif boardcases_array[2].value == boardcases_array[5].value && boardcases_array[5].value == boardcases_array[8].value && boardcases_array[8].value == current_style
      return true
    elsif boardcases_array[0].value == boardcases_array[4].value && boardcases_array[4].value == boardcases_array[8].value && boardcases_array[8].value == current_style
      return true
    elsif boardcases_array[2].value == boardcases_array[4].value && boardcases_array[4].value == boardcases_array[6].value && boardcases_array[6].value == current_style
      return true
    else 
      return false 
    end
    
  end
  
   
  def switch_player(current_player,player1,player2)
    @current_player = @current_player == @player1 ? @player2 : @player1
    @current_style = @current_player.player_style  
    puts" "
    puts "----------------------------------------------------------------"   
    puts "C'est au tour de #{@current_player.name} ! ".blue
    sleep 1
   
  end

end
