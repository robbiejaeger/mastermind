require_relative 'engine'
require_relative 'code'

quit = false
GameEngine = Engine.new
GameCode = Code.new

while quit == false
  # Reinitialize Engine variables if playing again
  GameEngine.solved = false
  GameEngine.instructions = false

  # Generate a code
  GameCode.generate_code
  code = GameCode.code

  # Begin game
  GameEngine.welcome_screen
  GameEngine.code = code
  quit = GameEngine.play
end
