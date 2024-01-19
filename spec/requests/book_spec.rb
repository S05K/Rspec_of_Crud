require 'rails_helper'

RSpec.describe "Books", type: :request do
  
  describe "GET /index" do
    it "returns a successful response" do
      user=create(:user)
      book=create(:book, user_id: user.id)
      get '/books'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "assigns @book" do
      user=create(:user)
      book=create(:book,  user_id: user.id)
      post '/books', params:  { name: book.name, price: book.price, user_id: user.id }
    expect(response).to have_http_status(201)
    end
  end

  describe "POST /create" do 
    it "returns error message when book registartion fails" do 
       post '/books', params: {  name: "test_book", price: nil } 
       expect(response).to have_http_status(422)
    end
  end 
 
  describe "GET /show" do 
    it "returns a data on id" do
    user=create(:user)
    book=create(:book, user_id: user.id)
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
      user=create(:user)
      book = create(:book, user_id: user.id)
      delete "/books/#{book.id}"
      expect(response).to have_http_status(204)
    end
  end

 
  describe "PUT /update" do 
    it "returns successfully updated" do 
      user=create(:user)
      book = create(:book, user_id: user.id)
      put "/books/#{book.id}", params: {  name: "New Name"  }
      book.reload
      expect(book.name).to eq("New Name")    
      expect(response).to have_http_status(201)
    end
  end
  

  describe "PUT /update" do 
    it "returns error when book is updated" do 
      user = create(:user)
      book = create(:book, user_id: user.id)
      put "/books/#{book.id}", params: { price: nil}
        book.reload
       expect(book.price).to eq(book.price)
      expect(response).to have_http_status(422)
    end
  end

  describe "GET /show_user" do 
    it "returns book's user if book present" do 
      user = create(:user)
      book = create(:book, user_id: user.id)
      get "/books/show_user/#{book.id}"
      expect(response).to have_http_status(200)
    end
  end




end
