require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new

jasmine = Contact.new
jasmine.first_name = "Jasmine"
jasmine.last_name = "Quach"
jasmine.add_phone_number("Home", "123-456-7890")
jasmine.add_phone_number("Work", "234-567-8901")
jasmine.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")

juliet = Contact.new
juliet.first_name = "Juliet"
juliet.last_name = "Lawson"
juliet.add_phone_number("Home", "111-111-1111")
juliet.add_address("Home", "111 Second St.", "", "San Francisco", "CA", "67890"
)
address_book.contacts.push(jasmine)
address_book.contacts.push(juliet)

address_book.print_contact_list
