require_relative 'Game'
require_relative 'Guess'

# Begin game
Game = Game.new
# Show the welcom screen
Game.welcome_screen
# Take the user input and decide to start the game
intro_answer = gets.chomp

if intro_answer == 'p' || input == 'play'
  code = Game.generate_code
  puts Game.start_game_text
  Game.take_guess
elsif intro_answer == 'i' || input == 'instructions'
  puts Game.load_instructions
elsif intro_answer == 'q' || input == 'quit'
  puts "Exiting the game..."
else
  puts "That was not a valid letter. Exiting..."
end
