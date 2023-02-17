require_relative './item'

class Author
  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
  attr_accessor :first_name, :last_name

  def add_item(item)
    @items << item
    item.author = self
  end
end
