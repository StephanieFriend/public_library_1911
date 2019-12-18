require_relative './book'

class Author

  attr_reader :first_name,
              :last_name,
              :books

  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(title, date)
    new_book = {author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: date}
    @books << Book.new(new_book)
    @books.first 
  end
end
