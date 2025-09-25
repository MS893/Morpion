class Board
  require 'app/boardcase'

  attr_accessor :board_cases

  def initialize
    @board_cases = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3].map { |id| BoardCase.new(id) }
  end

  def play_turn
    #TO DO : une méthode qui :<
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  end

  # teste si un joueur a gagné ou match nul
  def victory?
    # combinaisons gagnantes
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Lignes
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Colonnes
      [0, 4, 8], [2, 4, 6]             # Diagonales
    ]
    # on vérifie s'il y a un gagnant (ce qui écrasera la valeur de status si modifié ci-dessus)
    winning_combinations.each do |combo|
      val1 = @board_cases[combo[0]].value
      val2 = @board_cases[combo[1]].value
      val3 = @board_cases[combo[2]].value
      if val1 != " " && val1 == val2 && val2 == val3
        return val1 # Renvoie le symbole du gagnant ('x' ou 'o')
      end
    end
    # on vérifie s'il y a match nul (morpion plein)
    if @board_cases.all? { |board_case| board_case.value != " " }
      return "nul"
    else
      # la partie continue
      return "on going"
    end
  end

end
