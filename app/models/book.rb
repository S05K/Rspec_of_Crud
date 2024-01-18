class Book < ApplicationRecord
    self.table_name = :books
    validates :price, presence: true
    
end
