class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :year, :photo)
  end


end
