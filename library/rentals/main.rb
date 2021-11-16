require './library/rentals/rental'

class RentalIntializer
  def initialize
    @rentals = []
  end

  def create_rental(books, people)
    if people.empty? && books.empty?
      puts 'Your Library is empty add books and people'
      return
    end
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, i|
      print "#{i}) Title: #{book.title}, Author: #{book.author}\n"
    end

    book_index = gets.chomp.to_i
    book = books[book_index]

    puts 'Select a person from the following list by number (not ID)'
    people.each_with_index do |person, i|
      print "#{i}) [#{person.class}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end

    person_index = gets.chomp.to_i
    person = people[person_index]

    print "\nDate: "

    date = gets.chomp
    save_rental(date, person, book)
  end

  def save_rental(date, person, book)
    rental = Rental.new(date, person, book)
    @rentals << rental
    puts "Rental created successfully\n"
  end

  def list_all_rental
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '

    rentals = @rentals.select { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'No rentals found'
      return
    end

    rentals.each do |rental|
      print "Date: #{rental.date}, Book \'#{rental.book.title}\' by #{rental.book.author}\n"
    end
  end
end
