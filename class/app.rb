require_relative './label'
require_relative './book'
require_relative './author'
require_relative './game'
require_relative './genre'
require_relative './music'
require_relative '../preserve/game_author_preserve'
require_relative '../preserve/save_music_genre'
require_relative '../preserve/data'
require 'json'

class App
  def initialize
    @get_albums = fetch_music_albums
    @get_genre = fetch_genres
    @get_games = fetch_games
    @get_authors = fetch_authors
    @music_albums = @get_albums || []
    @genres = @get_genre || []
    @games = @get_games || []
    @authors = @get_authors || []
    @books = []
    @labels = []
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
    label_file = './JSON/labels.json'

    file = File.read(label_file)
    puts 'No books Added, Kindly Add a book' if file.empty?

    puts 'List of all available books:'
    puts ''

    labels = JSON.parse(File.read(label_file))
    labels.each_with_index do |label, i|
      puts "#{i + 1} Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  def list_all_books
    book_file = './JSON/books.json'

    file = File.read(book_file)
    puts 'No books Added, Kindly Add a book' if file.empty?

    puts 'List of all available books:'
    puts ''

    booklist = JSON.parse(File.read(book_file))
    booklist.each_with_index do |book, i|
      puts "#{i + 1} Author: #{book['author']}, Publisher: #{book['publisher']}, Year of Publication: #{book['publish_date']}"
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

    musicalbum = {
      'album' => MusicAlbum.new(new_music, publish_date, on_spotify),
      'genre' => music_genre
    }

    @music_albums << musicalbum

    new_genre = Genre.new(musicalbum['genre'])
    new_genre.add_item(musicalbum['album'])
    @genres << new_genre

    store_albums(@music_albums)
    store_genre(@genres)

    puts 'Music Album succesfully added'
  end

  def list_musicalbums
    @music_albums.each { |album| puts "Name: #{album['album'].name}, Publish date: #{album['album'].publish_date}, On spotity: #{album['album'].on_spotify}" }
  end

  def list_genre
    @genres.each { |item| puts item.name.to_s }
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
    puts 'Succesfully added the game'
    puts "\n"

    # save to json file

    save_game(@games)

    puts 'Add the author information please'

    print 'Add the first name: '
    first_name = gets.chomp
    print 'Add the last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
    author.add_item(game)
    # save to json file
    save_author(@authors)

    puts "\n"
  end

  def list_games
    game_file = './JSON/games.json'

    file = File.read(game_file)
    puts 'No books Added, Kindly Add a book' if file.empty?
    # read from the json to display games
    games = JSON.parse(File.read(game_file))
    games.each_with_index do |game, index|
      puts " #{index + 1} Name: #{game['name']}, Multiplayer: #{game['multiplayer']}, Last_played_at: #{game['last_played_at']} "
    end

    puts "\n"
  end

  def list_authors
    game_file = './JSON/authors.json'

    file = File.read(game_file)
    puts 'No author Added, Kindly Add a author' if file.empty?
    # read from the json to display authors
    authors = JSON.parse(File.read(game_file))
    authors.each_with_index do |author, index|
      puts " #{index + 1} Author: #{author['first_name']} #{author['last_name']} "
    end

    puts "\n"
  end
end
