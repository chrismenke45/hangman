require "json"

module SaveGame
  def self.save_it(game_object)
    p game_object
    Dir.mkdir("output") unless Dir.exist?("output")
    filename = "output/game.json"
    File.open(filename, "w") { |file| file.write(game_object.to_json) }
  end

  def self.check_for_save
    File.exist?("output/game.json")
  end

  def self.load_it
    game_string = JSON.load_file("output/game.json")
    File.delete("output/game.json") if File.exist?("output/game.json")
    game_string
  end
end
