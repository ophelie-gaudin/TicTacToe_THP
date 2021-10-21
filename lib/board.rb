require_relative './boardcase'
require_relative './player'

class Board
  attr_accessor :available_cases_array, :boardcases_array

  def initialize
    
    @boardcases_array = []
    @available_cases_array = []

    index = 1
    9.times do 
      if index <= 3
        id_case = "A#{index}"
        current_case = BoardCase.new(id_case)
        @boardcases_array.push current_case
  
      elsif index > 3 && index <= 6
        id_case = "B#{index - 3}"
        current_case = BoardCase.new(id_case)
        @boardcases_array.push current_case
  
      else
        id_case = "C#{index - 6}"
        current_case = BoardCase.new(id_case)
        @boardcases_array.push current_case
         end
         
         index += 1
    end

    @available_cases_array = @boardcases_array.map(&:clone)
     
  end
 
  def show_board() 
    puts "       " + " 1 ".red + "   " + " 2 ".red + "   " + " 3 ".red + "   "
    puts "------------------------"
    puts "A    ".red + "|  " + "#{boardcases_array[0].value}".yellow + "  |  " + "#{boardcases_array[1].value}".yellow + "  |  " + "#{boardcases_array[2].value}".yellow + "  |"
    puts "------------------------"
    puts "B    ".red + "|  " + "#{boardcases_array[3].value}".yellow + "  |  " + "#{boardcases_array[4].value}".yellow + "  |  "  + "#{boardcases_array[5].value}".yellow + "  |"
    puts "------------------------"
    puts "C    ".red + "|  " + "#{boardcases_array[6].value}".yellow + "  |  " + "#{boardcases_array[7].value}".yellow + "  |  "  + "#{boardcases_array[8].value}".yellow + "  |"
    puts "------------------------"
  end

  def change_value_boardcases_array(array, chosen_case, current_style)
    array.each do |boardcase|

      if chosen_case == boardcase.id_case
        boardcase.value = current_style
      end

    end
  end 
  


end

