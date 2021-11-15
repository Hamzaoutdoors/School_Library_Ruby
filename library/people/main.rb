# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength
class PeopleIntializer
  def initialize
    @people = []
  end

  def list_all_people
    if @people.empty?
      puts 'Your Library is empty, please add more people by clicking on 3'
      return
    end
    @people.each do |person|
      print "[#{person.class.name}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end
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

      puts "Person created successfully\n"
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, name, specialization)
      @people.push(teacher)

      puts "Person created successfully\n"

    else
      puts 'Please choose number 1 or 2'
      nil
    end
  end
end
# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
