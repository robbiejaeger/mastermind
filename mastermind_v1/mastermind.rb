require_relative 'Game'
require_relative 'Guess'

# Begin game
CurrentGame = Game.new
# Show the welcom screen
CurrentGame.welcome_screen
# Take the user input and decide to start the game
CurrentGame.intro_decision(gets.chomp)
