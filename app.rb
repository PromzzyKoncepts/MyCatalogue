require_relative './label'
require_relative './book'
require_relative './author'
require_relative './game'
require_relative './genre'
require_relative './music'

class App
  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genre = []
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
    @books.push(book)

    puts 'Enter the color of the book'
    color = gets.chomp

    new_label = Label.new(title, color)
    new_label.add_item(book)
    @labels.push(new_label)
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
end
