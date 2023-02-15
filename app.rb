require_relative './label'
require_relative './book'
require_relative './author'
require_relative './game'
require_relative './genre'
require_relative './music'
require_relative './data'

class App
  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genre = []
    @games = []
    @authors = []
  end

  def add_book
    puts 'Enter the title of the book'
    title = gets.chomp

    puts 'Enter the name of the Author'
    author = gets.chomp

    puts 'Enter the name of the Publisher'
    publisher = gets.chomp

    puts 'Enter cover state'
    cover_state = gets.chomp

    puts 'Enter the year of publication'
    publish_date = gets.chomp.to_i

    book = Book.new(publisher, cover_state, publish_date, author, title)

    puts 'Enter the color of the book'
    color = gets.chomp

    new_label = Label.new(title, color)
    new_label.add_item(book)

    @books.push(book)
    save_book(publisher, cover_state, publish_date, author, title)

    @labels.push(new_label)
    save_label(title, color)

    puts 'Book Successfully Added!!'
  end

  def list_labels
    @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title},  Author: #{book.author}, Publisher: #{book.publisher}, Date of Publication:#{book.publish_date}"
    end
  end

  def add_musicalbum
    print 'Enter Name of music album: '
    new_music = gets.chomp

    print 'Is music Album on Spotify?[Y/N]: '
    on_spotify = gets.chomp.capitalize

    case on_spotify
    when 'Y'
      on_spotify = true
    when 'N'
      on_spotify = false
    else
      puts 'Invalid input'
    end

    print 'Enter Publish Year: '
    publish_date = gets.chomp

    print 'Enter Genre of music: '
    music_genre = gets.chomp

    musicalbum = MusicAlbum.new(new_music, publish_date, on_spotify)
    @music_albums << musicalbum
    puts 'Music Album succesfully added'

    new_genre = Genre.new(music_genre)
    new_genre.add_item(musicalbum)
    @genre << new_genre
  end

  def list_musicalbums
    @music_albums.each { |album| puts "Name: #{album.name}, Publish date: #{album.publish_date}" }
  end

  def list_genre
    @genre.each { |item| puts item.name.to_s }
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
