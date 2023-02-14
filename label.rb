require_relative './item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :items

  def initialize(id, title, color, _items)
    super(id)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
