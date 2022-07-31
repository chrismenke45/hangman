require "./lib/save_game.rb"

class Game
  extend SaveGame

  def initialize(word)
    @word = word
    @show_word = "_" * word.length
    @wrong_letters = []
    @correct_letters = []
    #puts word
  end

  def play
    while @wrong_letters.length < 8 && @show_word.include?("_")
      puts "*" * 30
      make_visual
      puts "Guess a letter!"
      letter = gets.chomp
      check_letter(letter)
    end
    if @show_word == @word
      puts "You got it: #{@word}"
    else
      puts "So close! It was: #{@word} Try again later"
    end
  end

  def Game.find_random_word(min_length, max_length, words_array)
    if min_length >= max_length
      return "Min length must be smaller than max length"
    end
    word = ""
    while word.length < min_length || word.length > max_length
      word = words_array[rand(0...9999)].gsub("\n", "")
    end
    word
  end

  private

  def update_show_word
    @show_word = @word.chars.map { |letter| @correct_letters.include?(letter) ? letter : "_" }.join("")
  end

  def make_visual
    puts @show_word
    @wrong_letters.length != 0 && (puts "Incorrect guesses: #{@wrong_letters}")
    @wrong_letters.length != 0 && (puts "you have #{8 - @wrong_letters.length} more tr#{@wrong_letters.length == 7 ? "y" : "ies"}")
  end

  def check_letter(letter)
    letter = letter.downcase.strip
    valid_input = false
    until valid_input
      if letter.match?(/\A[a-z]{1,1}\z/)
        unless @wrong_letters.include?(letter) || @correct_letters.include?(letter)
          valid_input = true
          if @word.include?(letter)
            @correct_letters.push(letter)
            update_show_word
          else
            @wrong_letters.push(letter)
          end
        else
          puts "You already guessed that letter, try another one"
          letter = gets.chomp
        end
      else
        puts "Oops! Please enter a single letter"
        letter = gets.chomp
      end
    end
  end
end
