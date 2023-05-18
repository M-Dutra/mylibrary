class PagesController < ApplicationController
  def home
    redirect_to books_path if user_signed_in?
  end
end
