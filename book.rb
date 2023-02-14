require './item'
class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date

  def initialize(id, publisher, cover_state, publish_date)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (@cover_state == 'bad' || self == true)
  end
end