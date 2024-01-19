class BooksController < ApplicationController
 
  def index
    @books = Book.all
    if @books
    render json: @books, status: 200
    end
  end

def create
    @book = Book.new(all_params)
  if @book.save
    render json: @book, status: :created
  else
    render json: { error: 'Book creation failed' }, status: :unprocessable_entity
  end
end

def show 
  @book = Book.find_by(id: params[:id])
  if @book.present?
    render json: @book 
  else
    render json: { error: 'Book not found' }, status: :not_found
  end
end

  def show_user
    @book = Book.find_by(id: params[:id])
     if @book.present?
      render json: @book.user
      else
        render json: { error: 'not found' }, status: :not_found
      end
  end

def update
  @book = Book.find_by(id: params[:id])
  if @book.update(all_params)
    render json: @book, status: 201
  else
    render json: { error: 'Book creation failed' }, status: :unprocessable_entity
  end
end

def destroy
  @book = Book.find_by(id: params[:id])
  if @book.destroy
    render json: "Book is deleted", status: 204
  else
    render json: { error: 'Book deletion failed' }, status: :unprocessable_entity
  end
end


private
def all_params
params.permit(:name, :price, :user_id)
end

# def only_params
#   params.require(:book).permit(:name)
# end

end
