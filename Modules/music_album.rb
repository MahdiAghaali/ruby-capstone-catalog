require_relative './item'
require 'securerandom'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :id

  def initialize(genre_in, author_in, source_in, label_in, publish_date_in, publish_date, on_spotify)
    super(genre_in, author_in, source_in, label_in, publish_date_in)
    @id = SecureRandom.uuid
    @on_spotify = on_spotify
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    true if super && on_spotify == true
    false
  end
end
