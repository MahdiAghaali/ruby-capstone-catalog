require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre_in, author_in, source_in, label_in, publish_date_in, publisher_in, cover_state_in)
    super(genre_in, author_in, source_in, label_in, publish_date_in)
    @publisher = publisher_in
    @cover_state = cover_state_in
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

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
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  def self.json_create(object)
    new(
      object['genre'],
      object['author'],
      object['source'],
      object['label'],
      object['publish_date'],
      object['publisher'],
      object['cover_state']
    )
  end
end
