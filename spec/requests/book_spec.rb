require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get '/books'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "assigns @book" do
    post '/books', params: { book: { name: "test_book", price: 255 } }
    expect(assigns(:book)).to be_a(Book)
    end
  end

  describe "POST /create" do 
    it "returns error message when book registartion fails" do 
      allow(Book).to receive(:new).and_return(instance_double(Book, save: false))
       post '/books', params: { book: { name: 'test_book', price: "255" } }
       expect(response).to have_http_status(422)
    end
  end 

  describe "GET /show" do 
    it "returns a data on id" do
    book = Book.create(name: "teste_book", price:101)
    get "/books/#{book.id}"
     expect(response).to be_successful
    end
  end

  describe "GET /show" do 
    it "return no data when id is not exist" do 
      id = "gvh"
      get "/books/#{id}"
      expect(response).to have_http_status(404)
     end
  end

  describe "DELETE /destroy" do 
    it "returns delete succesffuly" do 
      book = Book.create(name: "teste_book", price:101)
      delete "/books/#{book.id}"
      expect(response).to have_http_status(200)
    end
  end



  describe "PUT /update" do 
    it "returns successfully updated" do 
      book = Book.create(name: "teste_book", price: 101)
      put "/books/#{book.id}", params: {  name: "New Name"  }
      book.reload
      expect(book.name).to eq("New Name")    
      expect(response).to have_http_status(200)
    end
  end
  

  describe "PUT /update" do 
    it "returns error when book is updated" do 
      book = Book.create(price:89658, name:"Avatar")
      put "/books/#{book.id}", params: { price: nil}
        book.reload
       expect(book.price).to eq(89658)
      expect(response).to have_http_status(422)
    end
  end



end
