require_relative './item'
require 'securerandom'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :id

  def initialize(publish_date,archived:false,on_spotify:true)
    super(publish_date)
    @id = SecureRandom.uuid
    @on_spotify= on_spotify
  end

  def can_be_archived?
    true if super() && on_spotify==true
    false
  end
end