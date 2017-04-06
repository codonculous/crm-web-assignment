

class Contact
  @@contacts = []
  @@id_counter = 0
  # This method should initialize the contact's attributes
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
  def initialize(first_name=nil,last_name=nil,email=nil,note=nil)
    @first_name = first_name
    @last_name  = last_name
    @email      = email
    @note       = note
    @id = @@id_counter
    @@id_counter += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name=nil,last_name=nil,email=nil,note=nil)
    contact = Contact.new(first_name,last_name,email,note)
    @@contacts.push(contact)
    contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(idnum)
    @@contacts.select {|contact| contact.id == idnum.to_i}[0]
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)
    @@contacts.select {|contact| contact.send(attribute.to_sym) == value}[0]
  end

  # This method should delete all of the contacts
  def self.delete_all

    @@contacts = []

  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,new_value)
     self.send( (attribute + "=").to_sym, new_value)
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    # @@contacts.delete_if {|contact| contact.id == idnum.to_i}
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
