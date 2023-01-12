require('./Modules/game')

describe 'Testing Game functions' do
  before(:each) do
    @new_game = Game.new('genre', 'author', 'source', 'label', '2020-12-12', 'multiplayer', '2012-12-12')
  end

  it 'Returns the instance of class' do
    expect(@new_game).to be_instance_of Game
  end

  it 'Return the name of the Genre instance' do
    expect(@new_game.genre).to eql 'genre'
  end

  it 'Return true if result is more than 2 years' do
    expect(@new_game.can_be_archived?).to eql true
  end
end
