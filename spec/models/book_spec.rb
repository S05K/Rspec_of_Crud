require 'rails_helper'

RSpec.describe Book, type: :model do
    let(:user) { FactoryBot.create(:user) }
    let(:book) { FactoryBot.create(:book, user: user) }
    context 'should validate' do 
    it 'with name, price and user_id is present' do
        expect(book).to be_valid
    end

    it 'when price is not present' do 
        book.price = nil    
        expect(book).not_to be_valid
    end

    it 'when name is an empty string' do 
        book.name=""
        expect(book).not_to be_valid
    end

    it 'when user_id is nil' do 
        book.user_id=nil 
        expect(book).not_to be_valid
    end
 end

        # Rspec for associations...

    it 'should belongs to user' do 
        expect(book.user).to eq(user)
    end

end
