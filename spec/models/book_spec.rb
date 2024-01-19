require 'rails_helper'

RSpec.describe Book, type: :model do
    let(:book) { FactoryBot.build(:book) }

    context 'should validate' do 
    it 'with name and price is present' do
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
 end
end
