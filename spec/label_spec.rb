require_relative './helper_spec'

describe Book do
  context 'adding a label' do
    label = Label.new('Macmillian', 'red')
    book = Book.new('Macmillian', 'bad', 2020, 'Shaddai', 'Tales by moonlight')
    label.add_item(book)

    it 'Should create a new label' do
      expect(label).to be_instance_of Label
    end

    it 'confirms if inputs are correct' do
      expect(label.color).to eq 'red'
      expect(label.title).to eq 'Macmillian'
    end

    it 'checks whether label inputs are added to book' do
      expect(book.label.color).to eql 'red'
    end
    
  end
end
