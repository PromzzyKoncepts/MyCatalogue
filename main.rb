require './classes/app'

def choose_options(input, app)
  case input
  when 1
    app.list_all_books
  when 2
    app.list_musicalbums
  when 3
    app.list_games
  when 4
    app.list_genre
  when 5
    app.list_labels
  when 6
    app.list_authors
  when 7
    app.add_book
  when 8
    app.add_musicalbum
  when 9
    app.add_game
    # when 10
    #   app.store_data
  end
end

def main
  app = App.new
  puts 'Welcome to My Catalogue  App'
  options = [
    'List all books',
    'List all music albums',
    'List of games',
    'List all genres (e.g Comedy)',
    'List all labels (e.g. Gift, New)',
    'List all authors (e.g. Stephen King)',
    'Add a book',
    'Add a music album',
    'Add a game',
    'Exit'
  ]

  loop do
    options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    input = gets.chomp.to_i
    choose_options(input, app)
    return if input == 10
  end
end

main
