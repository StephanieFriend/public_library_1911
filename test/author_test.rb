require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal "Charlotte", charlotte_bronte.first_name
    assert_equal "Bronte", charlotte_bronte.last_name
  end

  def test_it_has_an_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal "Charlotte Bronte", charlotte_bronte.name
  end

  def test_it_starts_with_no_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

    assert_equal [], charlotte_bronte.books
  end

  def test_author_can_write_a_book
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    jane_eyre = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "October 16, 1847"})

    assert_instance_of Book, charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal "Jane Eyre", jane_eyre.title
  end

  def test_author_can_write_multiple_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    jane_eyre = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Jane Eyre", publication_date: "October 16, 1847"})
    villette = charlotte_bronte.write("Villette", "1853")
    villette = Book.new({author_first_name: "Charlotte", author_last_name: "Bronte", title: "Villette", publication_date: "1853"})

    # assert_equal [jane_eyre, villette], charlotte_bronte.books
    assert_equal 2, charlotte_bronte.books.length
  end
end
