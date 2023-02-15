
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

    puts "Enter the year of publication"
    publish_date = gets.chomp.to_i

    book = Book.new(publisher, cover_state, publish_date, author, title)
    @books.push(book) 

    puts 'Enter the color of the book'
    color = gets.chomp

    new_label = Label.new(title, color)
    new_label.add_item(book)
    @labels.push(new_label)
    puts "Book Successfully Added!!" 

  end

  def list_labels
    @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
  end

  def list_all_books
    @books.each { |book| puts "Title: #{book.title},  Author: #{book.author}, Publisher: #{book.publisher}, Date of Publication:#{book.publish_date}" }
  end
 end


