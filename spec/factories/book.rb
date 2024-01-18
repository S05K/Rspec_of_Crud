FactoryBot.define do
    factory :book, class: Book do 
      name { Faker::Name.name }
      price { Faker::Commerce.price(range: 0..10.0, as_string: true) }
      
    end
    # factory :book1, class: Book do
    #     name { Faker::Name.name }
    #     price { Faker::Commerce.price(range: 0..10.0, as_string: true) }
        
    #   end

end