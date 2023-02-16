require_relative './helper_spec'

describe Book do
  context 'adding a book' do
    book = Book.new('Macmillian', 'bad', 2020, 'Shaddai', 'Tales by moonlight')
    # book2 = Book.new('Godzilla', 'Promise')

    it 'expects book title to be Tales by moonlight' do
      expect(book.title).to eql 'Tales by moonlight'
      expect(book.cover_state).to eql 'bad'
      expect(book.author).to eql 'Shaddai'
    end

    it 'confirms if publication date is 2020' do
      expect(book.publish_date).to eq 2020
    end

    it 'checks whether a book can be archived?' do
      expect(book.can_be_archived?).to eql false
    end
  end
end
