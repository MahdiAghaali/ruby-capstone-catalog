class Label
  attr_accessor :id, :items, :title, :color

  def initialize(title, color, id = SecureRandom.uuid, items = [])
    @id = id
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['title'],
      object['color'],
      object['id'],
      object['items']
    )
  end
end
