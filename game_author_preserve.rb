require_relative './app'
require 'json'

def save_game(games)
  file = File.open('./JSON/game.json', 'w')
  file.write(JSON.pretty_generate(games.map { |game| { name: game.name, multiplayer: game.multiplayer, last_played_at: game.last_played_at } }))
  file.close
end

def save_author(authors)
  file = File.open('./JSON/author.json', 'w')
  file.write(JSON.pretty_generate(authors.map { |author| { first_name: author.first_name, last_name: author.last_name } }))
  file.close
end
