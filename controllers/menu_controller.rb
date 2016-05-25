require_relative '../models/address_book.rb'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View entry by number"
    puts "6 - Exit"

    print "Enter your selection: "
    selection = gets.to_i

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      view_entry_n
      main_menu

    when 6
      puts "Goodbye"
      exit(0)
    else
      system "clear"
      puts "Your selection is not valid."
      main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def create_entry
    puts "Create a new address book entry"

    print "Name: "
    name = gets.chomp

    print "Phone Number: "
    phone_number = gets.chomp

    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries

  end

  def read_csv

  end

  def entry_submenu(entry)

    puts "n - next"
    puts "d - delete"
    puts "e - edit"
    puts "m - main menu"

    selection = gets.chomp

    case selection
    when "n"
      "next"
    when "d"
      "delete"
    when "e"
      "edit"
    when "m"
      system "clear"
      "menu"
    else
      system "clear"
      puts "Your selection #{selection} is not valid"
      entry_submenu(entry)
    end
  end

  def view_entry_n
    print "Please enter the number: "
    n = gets.to_i
    system "clear"

    @address_book.entries.each_with_index do |entry, index|
      if n - 1 == index
        puts entry
      else
        puts "Entry #{n} not found"
      end
    end
    view_entry_submenu
  end

  def view_entry_submenu
    puts "Press 1 to look up another number or 3 to go back to main menu"
    selection = gets.to_i
    case selection
    when 1
      system "clear"
      view_entry_n
    when 3
      system "clear"
    end
  end
end
