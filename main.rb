class Main
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
  loop do
    options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    input = gets.chomp.to_i
    return if input == 12
  end
end

main = Main.new
main
