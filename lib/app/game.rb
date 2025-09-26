require 'app/player'
require 'app/board'

class Game

  attr_accessor :array_player, :board, :status, :current_player

  # créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
  def initialize(player1_name, player2_name)
    @array_player = [Player.new(player1_name, "x"), Player.new(player2_name, "o")]
    @board = Board.new
    @status = "on going"    # en cours, nul ou le joueur qui a gagné
    @current_player = @array_player[0] # Le joueur 1 (x) commence
  end

  # le joueur courant a joué
  def turn(choice, array_avail)
    cases = board.board_cases
    case choice
    when '1'
      if cases[0].value == " "
        cases[0].value = @current_player.value
        array_avail[0] = " " 
      end
    when '2'
      if cases[1].value == " "
        cases[1].value = @current_player.value
        array_avail[1] = " " 
      end
    when '3'
      if cases[2].value == " "
        cases[2].value = @current_player.value
        array_avail[2] = " " 
      end
    when '4'
      if cases[3].value == " "
        cases[3].value = @current_player.value
        array_avail[3] = " " 
      end
    when '5'
      if cases[4].value == " "
        cases[4].value = @current_player.value
        array_avail[4] = " " 
      end
    when '6'
      if cases[5].value == " "
        cases[5].value = @current_player.value
        array_avail[5] = " " 
      end
    when '7'
      if cases[6].value == " "
        cases[6].value = @current_player.value
        array_avail[6] = " " 
      end
    when '8'
      if cases[7].value == " "
        cases[7].value = @current_player.value
        array_avail[7] = " " 
      end
    when '9'
      if cases[8].value == " "
        cases[8].value = @current_player.value
        array_avail[8] = " " 
      end
    end
    # Après avoir joué, on met à jour le statut du jeu.
    @status = @board.victory?
    # On change de joueur uniquement si la partie continue
    switch_player if @status == "on going"
    return array_avail
  end

  # nouveau round en changeant celui qui commence
  def new_round
    # On swap les 2 joueurs
    @array_player[0], @array_player[1] = @array_player[1], @array_player[0]
    # On réinitialise le jeu
    @board = Board.new
    # On remet le statut de la partie à "en cours"
    @status = "on going"
    # Le joueur qui a maintenant les 'x' commence
    @current_player = @array_player[0] # Le joueur qui commence est celui qui n'avait pas commencé la partie d'avant
    puts "\nC'est parti pour une nouvelle manche ! Les rôles ont été échangés."
    print "Appuyez sur Entrée pour continuer..."
    gets
  end

  def game_end
    print "\nEntrée pour recommencer une partie ou q pour quitter > "
    choice = gets.chomp.downcase
    if choice == 'q'
      puts "\nAu revoir !"
      puts ""
      return true
    else
      return false  # on continue
    end
  end    

  private
  def switch_player
    if @current_player == @array_player[0]
      @current_player = @array_player[1]
    else
      @current_player = @array_player[0]
    end
  end

end
