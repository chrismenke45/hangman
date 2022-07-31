require "./lib/game.rb"

possibe_words = File.readlines("google-10000-english-no-swears.txt")

new_game = Game.new(Game.find_random_word(5, 12, possibe_words))
new_game.play
