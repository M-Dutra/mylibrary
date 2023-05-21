require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email:"manuel@gmail.com", username:"Manuel Dutra" )
    @book = Book.new(
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      year: 1925,
      rating:4,
      user: @user
    )
  end

  test 'book should be valid' do
    assert @book.valid?
  end

  test 'title should be present' do
    @book.title = ''
    assert_not @book.valid?
  end

  test 'title should be between 5 and 50 characters' do
    @book.title = 'a' * 4
    assert_not @book.valid?

    @book.title = 'a' * 51
    assert_not @book.valid?
  end

  test 'author should be present' do
    @book.author = ''
    assert_not @book.valid?
  end

  test 'author should be between 3 and 25 characters' do
    @book.author = 'ab'
    assert_not @book.valid?

    @book.author = 'a' * 26
    assert_not @book.valid?
  end

  test 'year should be present' do
    @book.year = nil
    assert_not @book.valid?
  end

  test 'year should be an integer between 1000 and 2050' do
    @book.year = 999
    assert_not @book.valid?

    @book.year = 2051
    assert_not @book.valid?
  end

  test 'rating should be present' do
    @book.rating = nil
    assert_not @book.valid?
  end

  test 'rating should be an integer' do
    @book.rating = 4.5
    assert_not @book.valid?
  end

  test 'rating should be an integer between 1 and 5' do
    @book.rating = 0
    assert_not @book.valid?

    @book.rating = 6
    assert_not @book.valid?
  end


end
