class Show
  require 'app/game'

  # affiche le morpion et le prompt sur le terminal
  def show_board(game)
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
    show_menu(game)
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
  def show_menu(game)
    puts "\nChoisissez une case à cocher :"
    puts "  1. A1"
    puts "  2. A2"
    puts "  3. A3"
    puts "  4. B1"
    puts "  5. B2"
    puts "  6. B3"
    puts "  7. C1"
    puts "  8. C2"
    puts "  9. C3"
    puts "  q. Quitter"
    print "\nA #{game.current_player.name} de jouer > "
  end

end
