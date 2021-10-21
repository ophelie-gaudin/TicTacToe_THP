require 'colorize'
class BoardCase
  attr_accessor :value, :id_case, :player_style ,:current_player
  
  def initialize(id_case)
    @value = "#"
    @id_case = id_case 
    
  end


  def is_chosen(player_style)
    @value = player_style
  end
   
end