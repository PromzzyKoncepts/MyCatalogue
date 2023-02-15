require './music'
require './genre'

class App
  def initialize
    @music_albums = []
    @genre = []
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
