class Rolodex 

	attr_accessor :contacts

	def initialize
		@contacts = []
		@index = 1000
	end 

	def add_contact(contact)
		contact.id = @index
		@contacts << contact
		@index += 1
		contact
	end 

	def find_contact(id)
		@contacts.each do |c|
			return c if  c.id = id 
		end 
		
	end 

end 

#it's gotta be the guy who is holding the comtact that will know that 
#each contact is unique, it is not the job of the contact class, all 
#it does it give the contact an ID