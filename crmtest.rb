require_relative 'crmcontacttest.rb'
require_relative 'rolodextest.rb'

class CRM
	attr_accessor :name

	def self.run(name)
		crm = CRM.new(name)
		crm.main_menu
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end 

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		# As a user, if 'modify' is typed, I am prompted to enter a contact attribute to be modified.
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
		puts "input is: #{input.inspect}"
		case input 
		when 1
			add_contact
		when 2
			modify_contact
		when 3
			display_all
		when 4
			display_one
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

	def display_all
		@rolodex.contacts.each do |contact|
			puts contact.to_s
		end 
	end 

	def display_one
		puts "Which contact would you like to display?"
		select_id = gets.chomp
		show_contact = @rolodex.find_contact(select_id)
		puts show_contact
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

	def modify_contact
		puts "Which contact would yo like to modify?"
		select_id = gets.chomp
		contact_to_modify = @rolodex.find_contact(select_id) 
		
		puts "[1] Would you like to modify first name?"
		puts "[2] Would you like to modify last name?"
		puts "[3] Would you like to modify email?"
		puts "[4] Would you like to modify notes?"
		attribute_to_modify = gets.chomp.to_i

		case attribute_to_modify
		when 1 
			puts "Enter new first name"
			new_first_name = gets.chomp
			contact_to_modify.first_name = new_first_name
		when 2
			puts "Enter new last name"
			new_last_name = gets.chomp
			contact_to_modify.last_name = new_last_name
		when 3
			puts "Enter new email"
			new_email = gets.chomp
			contact_to_modify.email = new_email
		when 4
			puts "Enter new note"
			new_note = gets.chomp
			contact_to_modify.notes = new_note
		end 

		puts contact_to_modify.to_s
		return
	end 

	
end     

CRM.run('My CRM')


