require './item'

class MusicAlbum < Item
  attr_accessor :name, :publish_date, :on_spotify, :genre

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @name = name
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def can_be_archived?
    can_be_archived? and on_spotify
  end
end
