class Label
  attr_accessor :id, :items, :title, :color

  def initialize(title, color, id = SecureRandom.uuid, items = [])
    @id = id
    @title = title
    @color = color
    @items = items
  end

end
