require 'json'

# Store music albums
def store_albums(albums)
  File.write('./JSON/music_albums.json', JSON.pretty_generate(albums.map { |album| { name: album['album'].name, publish_date: album['album'].publish_date, on_spotify: album['album'].on_spotify, genre: album['genre'] } }, mode: 'a'))
end

# Get music albums
def fetch_music_albums
  return if File.zero?('./JSON/music_albums.json') || File.exist?('./JSON/music_albums.json') == false


  JSON.parse(File.read('./JSON/music_albums.json'))
    .map do |album|
    {
      'album' => MusicAlbum.new(album['name'], album['publish_date'], album['on_spotify']),
      'genre' => album['genre']
    }
  end
end

# Store Genre
def store_genre(genres)
  File.write('./JSON/genre.json', JSON.pretty_generate(genres.map { |genre| { name: genre.name } }))
end

# Get genre
def fetch_genres
  return if File.zero?('./JSON/genre.json') || File.exist?('./JSON/genre.json') == false


  JSON.parse(File.read('./JSON/genre.json'))
    .map do |genre|
    Genre.new(genre['name'])
  end
end
