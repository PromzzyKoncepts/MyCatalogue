require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date, :author, :title

  def initialize(publisher, cover_state, publish_date, author, title)
    super(publish_date)
    @author = author
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (@cover_state == 'bad' || can_be_archived?)
  end
end
