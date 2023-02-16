require_relative './book'
require_relative './app'

# This part is to save book in json files
def save_book(publisher, cover_state, publish_date, author, title)
  book_file = './JSON/books.json'

  obj = {
    publisher: publisher,
    cover_state: cover_state,
    publish_date: publish_date,
    author: author,
    title: title
  }

  return unless File.exist?(book_file)

  file = File.open(book_file)
  if file.empty?
    book = [obj]
  else
    book = JSON.parse(File.read(book_file))
    book << obj
  end

  file.close

  add_to_file = File.open(book_file, 'w')
  add_to_file.write(JSON.generate(book))
  add_to_file.close
end

# This part is to save label in json files
def save_label(title, color)
  label_file = './JSON/labels.json'

  obj = {
    title: title,
    color: color
  }

  return unless File.exist?(label_file)

  file = File.open(label_file)
  if file.empty?
    book = [obj]
  else
    book = JSON.parse(File.read(label_file))
    book << obj
  end

  file.close

  add_to_file = File.open(label_file, 'w')
  add_to_file.write(JSON.generate(book))
  add_to_file.close
end
