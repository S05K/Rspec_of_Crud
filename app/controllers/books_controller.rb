class BooksController < ApplicationController
 
  def index
    @books = Book.all
    render json: @books
  end

def create
  @book = Book.new(all_params)
  if @book.save
    render json: @book
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


def update
  @book = Book.find_by(id: params[:id])
  if @book.update(all_params)
    render json: @book 
  else
    render json: { error: 'Book creation failed' }, status: :unprocessable_entity
  end
end

def destroy
  @book = Book.find_by(id: params[:id])
  if @book.destroy
    render json: "Book is deleted"
  else
    rendee json: "Not"
  end
end


private
def all_params
params.permit(:name, :price)
end

# def only_params
#   params.require(:book).permit(:name)
# end

end
