class Rolodex 

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

end 

#it's gotta be the guy who is holding the comtact that will know that 
#each contact is unique, it is not the job of the contact class, all 
#it does it give the contact an ID