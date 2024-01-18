class Book < ApplicationRecord
    validates :price, presence: true
end
