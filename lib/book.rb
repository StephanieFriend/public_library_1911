class Book

  attr_reader :author_first_name,
              :author_last_name
  attr_accessor :title,
                :publication_date
  def initialize(book_info)
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @title = book_info[:title]
    @publication_date = book_info[:publication_date]
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    @publication_date.split(//).last(4).join
  end
end
