require './item'

class Genre < Item
  attr_accessor :name
  attr_reader :items

  def initialize(name, _items)
    super(id)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
