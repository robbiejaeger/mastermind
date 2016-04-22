class Engine

  attr_accessor :code, :solved, :instructions

  def initialize
    # Initialize the game as unsolved with zero guesses
    @solved = false
    @num_guesses = 0
    @instructions = false
    @quit = false
  end

  def play
    # Decide what to do from the welcome screen
    intro_answer(gets.chomp)

    # guard clause - new method - plays_game?
    return false if @instructions == true
    return true if @quit == true


    # Continue playing until the guess matches the code
    # Start the game clock

    # instead of an ivar -> pass the value as an argument to the method where it's being used
    t_start = Time.now
    while @solved != true
      eval_guess
      return true if @quit
    end
    puts "Congratulations! You guessed the sequence #{@code.upcase} in #{@num_guesses}"\
         " guesses over #{get_total_time(t_start,@t_end)}."\
         "\n\n"\
         "Do you want to (p)lay again or (q)uit?"

    final_answer = gets.chomp
    if final_answer == 'q' || final_answer == 'quit'
      return true
    elsif final_answer == 'p' || final_answer == 'play'
      return false
    end
  end

  # Welcome screen
  def welcome_screen
    puts "Welcome to MASTERMIND\n\n"
    print "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end

  def intro_answer(answer)
    #W Welcome screen input
    if answer == 'p' || answer == 'play'
      puts start_game_text
    elsif answer == 'i' || answer == 'instructions'
      @solved = true
      puts load_instructions
      return @instructions = true
    elsif answer == 'q' || answer == 'quit'
      puts "Exiting the game..."
      return @quit = true
    else
      puts "That was not a valid letter. Exiting..."
      return @quit = true
    end
  end

  def load_instructions
    instructions_file = File.open("instructions.txt", "r")
    contents = instructions_file.read
    return contents
  end

  def start_game_text
     "I have generated a beginner sequence with four elements made up of: (r)ed, "\
     "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. "\
     "What's your guess?"
  end

  def eval_guess
    # Evaluate guess to solve the code
    @num_guesses += 1
    print "Your guess: "
    guess = gets.chomp.downcase
    if guess == 'q' || guess == 'quit'
      @solved = true
      @quit = true
      puts "Exiting the game..."
    elsif guess == 'c' || guess == 'cheat'
      @num_guesses -= 1
      puts "The secret code is: #{@code}. Shhh...."
    elsif guess.length < @code.length
      puts "The guess you entered is too short. Guess again using four letters..."
    elsif guess.length > @code.length
      puts "The guess you entered is too long. Guess again using four letters..."
    elsif guess == @code
      # Record the time after code is solved
      @t_end = Time.now
      @solved = true
    else
      # Find how many colors are correct
      num_colors_correct = get_number_of_correct_colors(@code,guess)
      # Find if positions are correct
      num_pos_correct = get_number_of_correct_positions(@code,guess)
      #time = get_total_time(@@t_start, @@t_end)
      return puts "'#{guess.upcase}' has #{num_colors_correct} of the correct elements with "\
                  "#{num_pos_correct} in the correct positions.\n"\
                  "You've taken #{@num_guesses} guess."
    end
  end

  def get_number_of_correct_colors(code, guess)
    num_colors_correct = 0
    # Copy guess string so as not to alter it as we loop through
    guess_to_remove_letters = guess.dup
    code.each_char do |letter|
      # calling another method that checks if it exists in the code...

      # There is a match: need to increase counter and remove letter
      if guess_to_remove_letters.include?(letter)
        num_colors_correct += 1
        guess_to_remove_letters.sub!(letter, "")
      end
    end
    return num_colors_correct
  end

  def get_number_of_correct_positions(code, guess)
    # map/reduce
      # what do I start with? Can we represent this in an array?
      # what do I want to return? When do I want to return?
        # should every iteration have a return value? ---> no, reduce/inject

    num_pos_correct = 0
    guess.chars.each_index do |index|
      num_pos_correct += 1 if guess[index] == code[index]
    end
    return num_pos_correct
  end

  # break the Time concept to another class
  def get_total_time(start, finish)
    # Get total elapsed seconds
    elapsed_seconds = finish.to_i - start.to_i
    mins, secs = elapsed_seconds.divmod(60)
    time_text = "#{mins} minutes, #{secs} seconds"
  end

# End class
end
