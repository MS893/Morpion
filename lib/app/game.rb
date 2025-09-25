class Game
  require 'app/player'
  require 'app/board'

  attr_accessor :array_player, :board, :status, :current_player

  # créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  def initialize(player1_name, player2_name)
    @array_player = [Player.new(player1_name, "x"), Player.new(player2_name, "o")]
    @board = Board.new
    @status = "on going"    # en cours, nul ou le joueur qui a gagné
    @current_player = @player1
  end

  # le joueur courant a joué
  def turn(choice)
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end
