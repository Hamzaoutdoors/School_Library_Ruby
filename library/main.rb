# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength

require './library/books/book'
require './library/people/classroom'
require './library/people/person'
require './library/rentals/rental'
require './library/people/student'
require './library/people/teacher'
require './library/people/main'
require './library/books/main'
require './library/rentals/main'

class App
  attr_reader :people, :rentals, :books

  def initialize(people, rentals, books)
    @people = people
    @rentals = rentals
    @books = books
  end

  def run
    response = nil

    puts "Welcome to Our School Library App!\n\n "

    while response != '7'
      puts 'Please choose an option by entering a number :'
      puts '1 - List all books'
         puts '2 - List all people'
      puts '3 - Create a person'
         puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'

      response = gets.chomp

      puts "\n"

      case response
      when '1'
        @books.list_all_books
         when '2'
        @people.list_all_people
      when '3'
        @people.create_person
        when '4'
        @books.create_book
      when '5'
        @rentals.create_rental(@books.books, @people.people)
      when '6'
        @rentals.list_all_rental
        when '7'
        puts 'Thank you for using this app!'
      else
        puts '❌ Choose an other number (from 1 to 6) if you want to exit choose 7'
      end
      puts "\n"

    end
  end
end

def main
  books = BookInitializer.new
  people = PeopleIntializer.new
  rentals = RentalIntializer.new

  app = App.new(people, rentals, books)

  app.run
end

main

# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
