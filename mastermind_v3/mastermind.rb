require_relative 'Engine'
require_relative 'Code'

# Generate a code
GameCode = Code.new
GameCode.generate_code
code = GameCode.code

# Begin game
GameEngine = Engine.new(code)
GameEngine.play
