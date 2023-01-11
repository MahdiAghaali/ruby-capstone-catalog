require ('./Modules/music_album')
require 'date'

describe 'Testing the Music album methods' do
  before (:each) do
    @new_music = MusicAlbum.new('15-08-2022', 'y')
  end

  it 'Returns the instance of class' do
    expect(@new_music).to be_instance_of MusicAlbum
  end

  it 'Return the publish date' do
    expect(@new_music.publish_date.strftime('%d-%m-%Y')).to eql '15-08-2022'
  end

  it 'Return the on_spotify status' do
    expect(@new_music.on_spotify).to eql 'y'
  end

  it 'Return length od id' do
    expect(@new_music.id.length).to eql 36
  end
end