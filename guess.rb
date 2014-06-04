class Guess
  def initialize
    @answer = rand(100) + 1 # Added one because the random is between 0 and 99
    @guesses_left = 5
    puts "I've already chosen a number between 1 and 100..." \
      " let's see if you can guess it"
    # puts @answer  line for testing
  end

  def ask_user_number
    puts 'Which is my number?'
    gets.chomp.to_i
  end

  def user_guess_correct?
    if @user_number == @answer
      puts "Good job! My number was #{@answer}!"
      return true
    elsif @user_number < @answer
      puts 'Mmmm nope, my number is higher...'
      return false
    elsif @user_number > @answer
      puts "I'm sorry, my number is lower..."
      return false
    end
  end

  def play
    while @guesses_left != 0
      @user_number = ask_user_number
      if !user_guess_correct?
        @guesses_left -= 1
        if @guesses_left != 0
          puts "Try again! You still have #{@guesses_left} guesses"
        end
      else
        return
      end
    end
    puts "You lost! My number was #{@answer}"
  end
end

game = Guess.new
game.play
