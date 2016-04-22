class Game

  # Welcome screen
  def welcome_screen
    puts "Welcome to Mastermind.\n\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end

  def load_instructions
    instructions_file = File.open("instructions.txt", "r")
    contents = instructions_file.read
    return contents
  end

  def generate_code
    # Generate random four color sequence
    a = []
    4.times {a << rand(1..4)}
    return a.join.to_s.tr('1234','rgby')
  end

  def start_game_text
    start_text = "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def take_guess
    # Take a guess from the user
    print "Your guess: "
    guess = gets.chomp
    eval_guess(guess)
  end

  def eval_guess(guess)
    if guess == 'q' || guess == 'quit'
      puts "Exiting the game..."
    elsif guess == 'c' || guess == 'cheat'
      # Print the code
      puts "The secret code is: __. Shhh...."
      take_guess
    elsif guess.length < 4
      puts "The guess you entered is too short. Guess again using four letters..."
      take_guess
    elsif guess.length > 4
      puts "The guess you entered is too long. Guess again using four letters..."
      take_guess
    else
      # Test the guess against the code...
    end
  end

# End class
end
