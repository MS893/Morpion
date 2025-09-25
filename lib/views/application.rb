class Application
  require 'app/game'
  require 'app/board'
  require 'views/show'
  
  # initialise le jeu puis fait tourner le jeu tant que la partie n'est pas terminée.
  def perform

    Show.new.clear_screen
    Show.new.show_start 

    # paramètres à saisir
    print "Nom du premier joueur (jouera les x): "
    player1_name = gets.chomp.to_s

    print "Nom du second joueur  (jouera les o): "
    player2_name = gets.chomp.to_s
    
    my_game = Game.new(player1_name, player2_name)
    cases = my_game.board.board_cases
    
    # on affiche les règles du jeu
    Show.new.show_rules(my_game)

    # liste des choix possibles
    array_avail = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

    loop do
  
      # liste des choix possibles
      array_avail = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
      # Affiche le tableau et le menu
      Show.new.show_board(my_game, array_avail)

      # Lit le choix de l'utilisateur
      choice = gets.chomp.downcase
      case choice
      when *('1'..'9').to_a # Accepte les chiffres de '1' à '9'
        array_avail = my_game.turn(choice, array_avail)
      when 'q'
        puts "\nAu revoir !"
        puts ""
        break
      else
        puts "\nErreur : Choix non valide. Veuillez réessayer."
      end
  
      # Pause pour que l'utilisateur puisse voir le résultat avant de ré-afficher le menu
      unless choice == 'q'
        game_status = my_game.status
        if game_status == "nul"
          puts "Match nul !"
          my_game.game_end()
        elsif game_status == "x" || game_status == "o"
          puts "#{my_game.current_player.name} a gagné !"
          my_game.game_end()
        else
          Show.new.clear_screen()
        end
      end
  
    end
  
  end

end
