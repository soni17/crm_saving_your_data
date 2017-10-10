require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
       print_main_menu
       user_selected = gets.to_i
       if user_selected == 6
         break
       else
         call_option(user_selected)
       end
     end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note
    )

    puts "New contact entered"
  end

  def modify_existing_contact
    print 'enter id of contact you would like to modify: '
    id = gets.chomp.to_i

    print "which field of contact you would like to modify: "
    field = gets.chomp.to_s

    print "enter new value: "
    newVal = gets.chomp.to_s

    contact = Contact.find(id)
    contact.update(field,newVal)

  end

  def delete_contact
    print "enter id of contact you would like to delete: "
    id = gets.chomp.to_i

    contact = Contact.find(id)

    if contact
      contact.delete
      puts "contact has been deleted"
      return true
    else
      puts "contact not found"
      return false
    end
  end

  def display_all_contacts
    Contact.all.each do |contact|
      puts "ID #:#{contact.id}"
      puts "First name:#{contact.first_name}"
      puts "Last name:#{contact.last_name}"
      puts "Email:#{contact.email}"
      puts "Note:#{contact.note}"
      puts " "
    end
  end

  def search_by_attribute
    puts 'By which attribute would you like to search:'
    attrb = gets.chomp.to_s

    puts "Enter new value:"
    newValue = gets.chomp.to_s

    contact = Contact.find_by(attrb,newValue)

    if contact
      puts " "
      puts "ID #:#{contact.id}"
      puts "First name:#{contact.first_name}"
      puts "Last name:#{contact.last_name}"
      puts "Email:#{contact.email}"
      puts "Note:#{contact.note}"
      puts " "
    else
      puts "contact not found"
    end

  end

end

at_exit do
  ActiveRecord::Base.connection.close
end


a_crm_app = CRM.new
a_crm_app.main_menu
