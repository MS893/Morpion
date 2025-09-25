class Game
  require 'app/player'
  require 'app/board'

  attr_accessor :array_player, :board, :status, :current_player

  # créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  def initialize(player1_name, player2_name)
    @array_player = [Player.new(player1_name, "x"), Player.new(player2_name, "o")]
    @board = Board.new
    @status = "on going"    # en cours, nul ou le joueur qui a gagné
    @current_player = @array_player[0] # Le joueur 1 (x) commence
  end

  # le joueur courant a joué
  def turn(choice)
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    
  end

  # nouvelle partie en changeant celui qui commence
  def new_round
    # On inverse les symboles (valeurs) des deux joueurs
    if @array_player[0].value == 'x'
      @array_player[0].value = 'o'
      @array_player[1].value = 'x'
    else
    # On réinitialise le jeu
    @board = Board.new
    # On remet le statut de la partie à "en cours"
    @status = "on going"
    # Le joueur qui a maintenant les 'x' commence
    @current_player = @array_player.find { |player| player.value == 'x' }
    puts "\nC'est parti pour une nouvelle manche ! Les rôles ont été échangés."
    puts "Appuyez sur Entrée pour continuer..."
    gets
  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end
