# Morpion
# Ruby Tic-Tac-Toe (Morpion)

A classic Tic-Tac-Toe game built with Ruby, designed to be played directly in your terminal. This project is a demonstration of object-oriented programming principles in Ruby.

## Features

*   **Two-Player Mode**: Play against a friend on the same computer.
*   **Interactive CLI**: A clear and simple command-line interface for gameplay.
*   **Win & Draw Detection**: The game automatically detects when a player has won or when the game ends in a draw.
*   **Multiple Rounds**: After a game concludes, players have the option to start a new round or quit.
*   **Fair Play**: To ensure fairness, player roles (X and O) and the starting player are swapped after each round.

## Project Structure

The project follows an object-oriented design, separating different concerns into their own classes:

*   `lib/views/application.rb`: This is the main application class that controls the overall game flow, from setup to the main game loop.
*   `lib/app/game.rb`: The core game engine. It manages the players, the board, the game status (`@status`), and whose turn it is (`@current_player`).
*   `lib/app/board.rb`: Represents the 3x3 game board. It holds the `BoardCase` objects and contains the logic to check for victory or draw conditions (`victory?`).
*   `lib/app/boardcase.rb`: Represents a single square on the board, holding its value (`"x"`, `"o"`, or `" "`).
*   `lib/app/player.rb`: Represents a player, storing their name and their assigned symbol (value).
*   `lib/views/show.rb`: This class is responsible for all output to the console. It handles displaying the board, menus, rules, and other game messages.

## How to Play

### Prerequisites

*   You need to have Ruby installed on your system (the project was developed with Ruby 3.4.2).
*   If you have development gems, you might need to run `bundle install`.

### Running the Game

1.  Clone or download the project files to your local machine.
2.  Navigate to the project's root directory in your terminal.
3.  Create an entry file named `app.rb` in the root directory with the following content:

    ```ruby
    require_relative 'lib/views/application'

    # Launch the game
    Application.new.perform
    ```

4.  Run the game by executing the following command in your terminal:

    ```sh
    ruby app.rb
    ```

5.  Follow the on-screen prompts to enter player names and start playing!

## Author

*   **MS893**

---

*This project was created as part of The Hacking Project curriculum.*
