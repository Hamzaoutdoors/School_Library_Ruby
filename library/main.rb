# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength

require './library/book'
require './library/person'
require './library/teacher'
require './library/student'
require './library/rental'

class Library
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    puts @books
  end

  def list_all_people
    puts @people
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    option = gets.chomp

    case option
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission_resp = gets.chomp
      parent_permission = permission_resp.downcase == 'y'

      student = Student.new(age, name, parent_permission)
      @people.push(student)

      puts "Person created successfuly\n"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, name, specialization)
      @people.push(teacher)

      puts "Person created successfuly\n"

    else
      puts 'Please choose number 1 or 2'
      nil
    end
  end

  def create_book; end

  def create_rental; end

  def list_all_rental; end
end

def main
  response = nil

  app = Library.new

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
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rental
    when '7'
      puts 'Thank you for using this app!'
    else
      puts '❌ Choose an other number (from 1 to 6) if you want to exit choose 7'
    end
    puts "\n"

  end
end

main

# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
