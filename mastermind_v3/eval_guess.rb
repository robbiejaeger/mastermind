def test_guess(code,guess)
  if guess == code
    puts "Congratulations! You guessed the sequence #{code.upcase} in 8 guesses over 8 minutes,
          5 seconds."
  else
    # Find how many colors are correct
    num_colors_correct = get_number_of_correct_colors(code,guess)
    # Find if positions are correct
    num_pos_correct = get_number_of_correct_positions(code,guess)
    return puts "'#{guess.upcase}' has #{num_colors_correct} of the correct elements with #{num_pos_correct} in the correct positions."
  end
end

def get_number_of_correct_colors(code,guess)
  num_colors_correct = 0
  # Copy guess string so as not to alter it as we loop through
  guess_to_remove_letters = guess.dup
  code.each_char do |letter|
    # There is a match and need to increase counter and remove it
    if guess_to_remove_letters.include?(letter) == true
      num_colors_correct += 1
      guess_to_remove_letters.sub!(letter,"")
      puts guess_to_remove_letters
    end
  end
  return num_colors_correct
end

def get_number_of_correct_positions(code,guess)
  num_pos_correct = 0
  guess.chars.each_index do |index|
    num_pos_correct += 1 if guess[index] == code[index]
  end
  return num_pos_correct
end

# possible colors: rgby
code = 'byyr'
guess = 'rggy'

test_guess(code,guess)
