class Book < ApplicationRecord
    self.table_name = :books
    validates :price, presence: true
    validate :check_name
    belongs_to :user
    def check_name
        if name == ""
            errors.add(:name, "can't be an empty string")
         end
    end
    
end
