require "json"

module SaveGame
  def save_it(game_object)
    Dir.mkdir("output") unless Dir.exist?("output")
    filename = "output/game.json"
    File.open(filename, "w") do |file|
      file.puts JSON.dump(game_object)
    end
  end

  def load_it
    game_object = File.read("output/game.json")
    game_object
  end
end
