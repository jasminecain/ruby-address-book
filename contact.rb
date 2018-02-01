require "./phone"
require "./address"

class Contact
  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers, :addresses

  def initialize
    @phone_numbers = []
    @addresses = []
  end

  def add_phone_number(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

  def add_address(kind, street_1, street_2, city, state, postal_code)
    address = Address.new
    address.kind = kind
    address.street_1 = street_1
    address.street_2 = street_2
    address.city = city
    address.state = state
    address.postal_code = postal_code
    addresses.push(address)
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

  def print_addresses
    puts "Addresses"
    # print out a contacts address; references instance vairable which we have attribute reader for
    addresses.each { |address| puts address.to_s('short') }
  end
end

# jasmine = Contact.new
# jasmine.first_name = "Jasmine"
# # jasmine.middle_name = "Q"
# jasmine.last_name = "Quach"
# jasmine.add_phone_number("Home", "123-456-7890")
# jasmine.add_phone_number("Work", "234-567-8901")
# jasmine.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")
# # puts jasmine.to_s
# puts jasmine.to_s('full_name')
# puts jasmine.to_s('last_first')
# puts jasmine.inspect
# jasmine.print_phone_numbers
# jasmine.print_addresses

# jess = Contact.new
# jess.first_name = "Jess"
# jess.middle_name = "E"
# jess.last_name = "Cain"
# puts jess.to_s('first_last')
