require "./phone"

class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers

  def initialize
    @phone_numbers = []
  end

  def add_phone_number(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

  def first_name
    @first_name
  end

  def middle_name
    @middle_name
  end

  def last_name
    @last_name
  end

  def first_last
    first_name + " " + last_name
  end

  def last_first
  last_first = last_name
  last_first += ", "
  last_first += first_name
  if !@middle_name.nil?
    last_first += " "
    last_first += middle_name.slice(0,1)
    last_first += "."
  end
    last_first
  end

  def full_name
    full_name = first_name
    if !@middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += ' '
    full_name += last_name
    full_name
  end

  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
      last_name
    else
      first_last
    end
  end

  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each { |phone_number| puts phone_number }
  end
end

jasmine = Contact.new
jasmine.first_name = "Jasmine"
# jasmine.middle_name = "Queen"
jasmine.last_name = "Quach"
jasmine.add_phone_number("Home", "123-456-7890")
jasmine.add_phone_number("Work", "234-567-8901")
# puts jasmine.to_s
puts jasmine.to_s('full_name')
# puts jasmine.to_s('last_first')
# puts jasmine.inspect
jasmine.print_phone_numbers

# des = Contact.new
# des.first_name = "Des"
# des.middle_name = "E"
# des.last_name = "Cain"
# puts des.to_s('first_last')


