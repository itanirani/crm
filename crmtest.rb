require_relative 'crmcontacttest.rb'
require_relative 'rolodextest.rb'

class CRM
	attr_accessor :name

	def self.run(name)
		crm = CRM.new(name)
		crm.main_menu
	end
	# def self.run(name)
	# 	crm = CRM.new("name")
	# 	crm.main_menu
	# end  #will run the class again  	

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end 

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display one contact's attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Choose and option by entering a number: "
	end 

	def main_menu
		
		while true 
			print_main_menu
			input = gets.chomp.to_i
			return if input == 7
			call_option(input)
		end 
	end 

	def call_option(input)
		case input 

		when 1
			add_contact
		when 2
			puts "Modify a contact"
		when 3
			puts "Display all contacts"	
		when 4
			puts "Display one contact"
		when 5
			puts "Display one contact's attribute"
		when 6 
			puts "Delete a contact"
		when 7
			puts "exit!"
		else
			puts "sorry that's not an option!"
		end 
	end 

	def add_contact
		puts "First name"
			first_name = gets.chomp
			puts "Last name"
			last_name = gets.chomp
			puts "email"
			email = gets.chomp
			puts "Notes"
			notes = gets.chomp	

			contact = Contact.new(first_name, last_name, email, notes)
			@rolodex.add_contact(contact)

			puts "Added #{contact.id} #{contact.first_name} #{contact.last_name} to Rolodex"
	end 
	# def display_
end     

CRM.run('My CRM')

# crm = CRM.new("my crm")
# crm.main_menu

