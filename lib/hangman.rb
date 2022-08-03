require "./lib/game.rb"
require "./lib/save_game.rb"
require "json"

possibe_words = File.readlines("google-10000-english-no-swears.txt")

the_game = Game.new(Game.find_random_word(5, 12, possibe_words))
if File.exist?("output/game.json")
  puts "Would you like to load the saved game? y/n"
  answer = gets.chomp.downcase
  if answer == "y"
    saved_object = SaveGame.load_it
    p saved_object
    p saved_object["word"]
    the_game = Game.new(saved_object["word"], saved_object["wrong_letters"], saved_object["correct_letters"])
  end
end

the_game.play
#new_game = Game.new(Game.find_random_word(5, 12, possibe_words))
#new_game.play
