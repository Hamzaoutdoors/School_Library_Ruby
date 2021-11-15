require_relative 'book'

class BookInitializer
  def initialize
    @books = []
  end

  def list_all_books
    if @books.empty?
      puts 'Books list is empty, click on number 4 to create a book'
      return
    end
    @books.each do |book|
      print "Title: #{book.title.capitalize}, Author: #{book.author.capitalize}\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize

    book = Book.new(title, author)
    @books << book

    puts "Book created successfully\n"
  end
end

book = BookInitializer.new()
book.create_book
book.list_all_books


