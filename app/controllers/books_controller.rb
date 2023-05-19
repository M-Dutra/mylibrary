class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :require_user, only: %i[index]

  def index
    @books = current_user.books.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "Book was created successfully"
      redirect_to books_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    if @book.destroyed?
      flash[:alert] = "Book was destroyed successfully"
    else
      flash[:alert] = "Failed to destroy the book"
    end
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :year, :photo, :rating)
  end

  def require_user
    if !user_signed_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to new_user_session_path
    end
  end
end
