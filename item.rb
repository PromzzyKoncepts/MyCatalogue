class Item
  attr_accessor :genre, :author, :label, :archived, :publish_date

  def initialize(id, publish_date, archived)
  @id = Random.rand(1...1000)
  @publish_date = publish_date
  @archived = archived
  end
end