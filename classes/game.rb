require_relative './item'

class Game < Item
  def initialize(name, multiplayer, last_played_at)
    super(publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at.to_i
  end
  attr_accessor :multiplayer, :last_played_at, :name

  def can_be_archived?
    super() && (Time.new.year - @last_played_at) > 2
  end
end
