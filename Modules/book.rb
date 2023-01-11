require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre_in, author_in, source_in, label_in, publish_date_in, publisher_in, cover_state_in)
    super(genre_in, author_in, source_in, label_in, publish_date_in)
    @publisher = publisher_in
    @cover_state = cover_state_in
    puts genre_in, author_in, source_in, label_in, publish_date_in, publisher_in, cover_state_in
  end

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
