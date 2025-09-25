class Show
  require 'app/game'

  # affiche le morpion et le prompt sur le terminal
  def show_board(game, array_avail)
    cases = game.board.board_cases
    ligne_A = " #{cases[0].value} | #{cases[1].value} | #{cases[2].value} "
    ligne_B = " #{cases[3].value} | #{cases[4].value} | #{cases[5].value} "
    ligne_C = " #{cases[6].value} | #{cases[7].value} | #{cases[8].value} "
    # dessine le morpion avec les cases remplies ou vides
    puts "\n"
    puts "   1   2   3" # Ajout des numéros de colonnes pour la lisibilité
    puts "A " + ligne_A
    puts "  ---+---+---"
    puts "B " + ligne_B
    puts "  ---+---+---"
    puts "C " + ligne_C
    puts "\n"
    if game.status == "on going"
      show_menu(game, array_avail)
    end
  end


  # affiche le menu sur le terminal
  def show_start
    puts "\n" + "=" * 40
    print "|" + " " * 16
    print "M"
    sleep 0.3 # tempo
    print "O"
    sleep 0.3 # tempo
    print "R"
    sleep 0.3 # tempo
    print "P"
    sleep 0.3 # tempo
    print "I"
    sleep 0.3 # tempo
    print "O"
    sleep 0.3 # tempo
    puts "N" + " " * 15 + "|"
    puts "=" * 40
    puts ""
  end

  # affiche les règles du jeu sur le terminal
  def show_rules(game)
    puts "\nVoici les règles du jeu :\n"
    puts "#{game.array_player[0].name} joue les X et #{game.array_player[1].name} les O"
    puts "#{game.array_player[0].name} commence, il est avantagé, la prochaine partie les roles seront inversés"
    puts "\nPour jouer, il faut renseigner la ligne à jouer (A, B ou C) et la colonne à jouer (1, 2 ou 3"
    print "\nEntrée pour commencer"
    gets
    clear_screen()
  end

  # efface l'écran
  def clear_screen
    system("clear")
  end

  private
  # affiche le menu sur le terminal
  def show_menu(game, array_avail)
    puts "\nChoisissez une case à cocher :"
    # on affiche uniquement celles qui sont encore disponibles.
    game.board.board_cases.each_with_index do |board_case, index|
      if board_case.value == " "
        puts "  #{index + 1}. #{board_case.case_ident}"
      end
    end
    puts "  q. Quitter"
    print "\nA #{game.current_player.name} de jouer > "
  end

end
