require './app'

class Main
  app = App.new
  puts 'Welcome to My Catalogue  App'
  options = [
    'List all books',
    'List all music albums',
    'List all movies',
    'List of games',
    'List all genres (e.g Comedy)',
    'List all labels (e.g. Gift, New)',
    'List all authors (e.g. Stephen King)',
    'Add a book',
    'Add a music album',
    'Add a movie',
    'Add a game',
    'Exit'
  ]

  def choose_options(input, app)
    case input
    when 1
      app.list_all_books
    end
  end

  loop do
    options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    input = gets.chomp.to_i
    choose_options(input, app)
    return if input == 12
  end
end

main = Main.new
main
