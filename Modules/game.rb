require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    now = Date.today
    before = Date.parse(@last_played_at)
    difference_in_days = (now - before).to_i
    return true if (difference_in_days / 365.25).to_i > 2

    false
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label,
      'publish_date' => @publish_date,
      'publisher' => @multiplayer,
      'cover_state' => @last_played_at
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['genre'],
      object['author'],
      object['source'],
      object['label'],
      object['publish_date'],
      object['multiplayer'],
      object['last_played_at']
    )
  end
end
