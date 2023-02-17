require_relative '../classes/app'
require 'json'

# Save Games
def save_game(games)
  File.write('./JSON/games.json', JSON.pretty_generate(games.map { |game| { name: game.name, multiplayer: game.multiplayer, last_played_at: game.last_played_at } }))
end

# Get Games
def fetch_games
  return if File.zero?('./JSON/games.json') || File.exist?('./JSON/games.json') == false

  JSON.parse(File.read('./JSON/games.json'))
    .map do |game|
    Game.new(game['name'], game['multiplayer'], game['last_played_at'])
  end
end

# Save Authors
def save_author(authors)
  File.write('./JSON/authors.json', JSON.pretty_generate(authors.map { |author| { first_name: author.first_name, last_name: author.last_name } }))
end

# Get Authors
def fetch_authors
  return if File.zero?('./JSON/authors.json') || File.exist?('./JSON/authors.json') == false

  JSON.parse(File.read('./JSON/authors.json'))
    .map do |author|
    Author.new(author['first_name'], author['last_name'])
  end
end
