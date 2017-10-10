class Contact

  #class variable holding all contacts
  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name,last_name,email,note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id = @@id + 1
  end

  attr_accessor :first_name , :last_name , :email , :note, :id

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name,last_name,email,note)
    newContact = Contact.new(first_name,last_name,email,note)
    @@contacts << newContact
    return newContact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id_entered)
    result = @@contacts.select{ |contact| contact.id == id_entered }
    return result.first
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update( attrb , newVal )
    if (attrb == "first_name")
      self.first_name = newVal
    elsif (attrb == "last_name")
      self.last_name = newVal
    elsif (attrb == "email")
      self.email = newVal
    elsif (attrb == "note")
      self.note = newVal
    else
      return false
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attrb, val)
    @@contacts.find { |contact| contact.send(attrb) == val }
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

end
