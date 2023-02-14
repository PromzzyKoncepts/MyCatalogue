class Item
  attr_accessor :genre, :author, :label, :archived, :publish_date

  def initialize(id, publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_achive
    if Item.can_be_archived? 
      @archived = true
    else
      return
    end
  end

  private
  def can_be_archived?
    current_year = Time.new.year 
    if (current_year - @publish_date.to_i) > 10
      true
    else
      false
    end
  end

end