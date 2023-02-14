require './item'

class MusicAlbum < Item
  def initialize(on_spotify)
    super(id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    can_be_archived? and on_spotify
  end
end
