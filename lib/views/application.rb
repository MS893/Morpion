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
    
    game = Game.new(player1_name, player2_name)
    cases = game.board.board_cases
    
    # on affiche les règles du jeu
    Show.new.show_rules(game)
    
    loop do
  
      # Affiche le tableau et le menu
      Show.new.show_board(game.board)
  
      # Lit le choix de l'utilisateur
      choice = gets.chomp.downcase
      case choice
      when *('1'..'9').to_a # Accepte les chiffres de '1' à '9'
        game.turn(choice)
      when 'q'
        puts "\nAu revoir !"
        puts ""
        break
      else
        puts "\nErreur : Choix non valide. Veuillez réessayer."
      end
  
      # Pause pour que l'utilisateur puisse voir le résultat avant de ré-afficher le menu
      unless choice == 'q'
        Show.new.clear_screen
        if game.victory? == "nul"
          puts "Match nul !"
          game.new_round
        elsif game.victory? == "x" || game.victory? == "o"
          puts "#{game.current_player.name} a gagné !"
          game.new_round
        else # "on going"
          # la partie continue, on passe au joueur suivant
          if game.current_player == game.array_player[0]
            game.current_player = game.array_player[1]
          else
            game.current_player = game.array_player[0]
          end
        end
      end
  
    end
  
  end

end
