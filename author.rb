require './item'

class Author < Item
  def initialize(id, first_name, last_name)
    super()
    @id = id
    @first_name = first_name
    @last_name = last_name
    @item = []
  end
  attr_accessor :first_name, :last_name

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
