require './game'
require './author'
class App
  def initialize
    @games = []
    @authors = []
  end

  def add_game
    print 'Enter the name of the game: '
    name = gets.chomp
    print 'Does the game has multiplayer [y/n] :'
    multiplayer = gets.chomp.capitalize
    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    else
      puts 'Invalid input'
    end

    print 'Add the last played year :'
    last_played_at = gets.chomp
    game = Game.new(name, multiplayer, last_played_at)
    @games.push(game)

    print 'Add the first name: '
    first_name = gets.chomp
    print 'Add the last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)

    author.add_item(game)
    puts 'Succesfully added the game'
  end

  def list_games
    @games.each do |game|
      puts " Name: #{game.name}, Multiplayer: #{game.multiplayer}, Last_played_at: #{game.last_played_at} "
    end
  end

  def list_authors
    @authors.each { |author| puts " Name: #{author.first_name} #{author.last_name} " }
  end
end
