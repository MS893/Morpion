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
    cases = board.board_cases
    case choice
    when '1'
      cases[0].value = @current_player.value
    when '2'
      cases[1].value = @current_player.value
    when '3'
      cases[2].value = @current_player.value
    when '4'
      cases[3].value = @current_player.value
    when '5'
      cases[4].value = @current_player.value
    when '6'
      cases[5].value = @current_player.value
    when '7'
      cases[6].value = @current_player.value
    when '8'
      cases[7].value = @current_player.value
    when '9'
      cases[8].value = @current_player.value
    end

    # Après avoir joué, on met à jour le statut du jeu.
    @status = @board.victory?
  end

  # nouvelle partie en changeant celui qui commence
  def new_round
    # On inverse les symboles (valeurs) des deux joueurs
    if @array_player[0].value == 'x'
      @array_player[0].value = 'o'
      @array_player[1].value = 'x'
    end
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
    puts "\nEntrée pour recommencer une partie ou q pour quitter"
    choice = gets.chomp.downcase
    if choice == 'q'
      puts "\nAu revoir !"
      puts ""
    else
      Game.new.perform
    end
  end    

end
