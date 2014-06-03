class ComputerGuess
  def initialize
    @number_of_guesses = 5
    @high_ans = 100
    @low_ans = 1
    puts "Think a number between 1 and 100, I'm going to try to guess it"
    guess
  end

  def check_answer_with_user
    puts "I think your number is #{@guessed_number}!"
    puts 'If thats correct, enter Y.'
    puts 'If your number is higher, enter H'
    puts 'If your number is lower, enter L'
    gets.chomp.upcase!
  end

  def check_answer
    check = check_answer_with_user
    if check == 'Y'
      puts 'YES! I knew it!'
      return 0
    elsif check == 'H'
      puts 'Mmm... so your number is higher... let me think...'
      return 1
    elsif check == 'L'
      puts "Lower than that!? Ok... let's see..."
      return -1
    else
      puts "I don't understand what you say... try again..."
      check_answer
    end
  end

  def guess
    while @number_of_guesses != 0
      @guessed_number = ((@high_ans - @low_ans) / 2) + @low_ans
      check = check_answer
      if check == 1 # answer is higher
        @low_ans = @guessed_number
      elsif check == -1 # answer is lower
        @high_ans = @guessed_number
      else
        break
      end
      @number_of_guesses -= 1
      puts "Ok, you win... I don't know your number." if @number_of_guesses == 0
    end
  end
end

ComputerGuess.new
