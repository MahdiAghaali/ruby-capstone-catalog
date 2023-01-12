require('./Modules/label')

describe 'Testing Label functions' do
  before(:each) do
    @new_label = Label.new('label', 'red')
    @new_book = Book.new('genre', 'author', 'source', 'label', '2020-12-12', 'publisher', 'bad')
  end

  it 'Returns the instance of class' do
    expect(@new_label).to be_instance_of Label
  end

  it 'check properties' do
    expect(@new_label.color).to eql 'red'
  end
end
