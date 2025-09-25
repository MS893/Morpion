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
    
    loop do
  
      # Affiche le tableau et le menu
      Show.new.show_board(my_game)
  
      # Lit le choix de l'utilisateur
      choice = gets.chomp.downcase
      case choice
      when *('1'..'9').to_a # Accepte les chiffres de '1' à '9'
        my_game.turn(choice)
      when 'q'
        puts "\nAu revoir !"
        puts ""
        break
      else
        puts "\nErreur : Choix non valide. Veuillez réessayer."
      end
  
      # Pause pour que l'utilisateur puisse voir le résultat avant de ré-afficher le menu
      unless choice == 'q'
        Show.new.clear_screen()
        game_status = my_game.status
        if game_status == "nul"
          puts "Match nul !"
          my_game.game_end()
        elsif game_status == "x" || game_status == "o"
          puts "#{my_game.current_player.name} a gagné !"
          my_game.game_end()
        else # "on going"
          # la partie continue, on passe au joueur suivant
          if my_game.current_player == my_game.array_player[0]
            my_game.current_player = my_game.array_player[1]
          else
            my_game.current_player = my_game.array_player[0]
          end
          # nouveau round
          my_game.new_round()
        end
      end
  
    end
  
  end

end
