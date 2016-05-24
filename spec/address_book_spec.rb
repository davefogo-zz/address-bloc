require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end

  describe "add_entry" do
    it "adds only one new entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '101.202.3033', 'ada@email.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '101.202.3033', 'ada@email.com')
      new_entry = book.entries[0]
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('101.202.3033')
      expect(new_entry.email).to eq('ada@email.com')
    end
  end

  describe "remove_entry" do
    book = AddressBook.new
    it "responds to remove_entry" do
      expect(book).to respond_to(:remove_entry)
    end

    it "removes one entry" do
      book = AddressBook.new
      book.add_entry( 'David Forero',  '202.303.4044', 'david@email.com')
      book.add_entry('Ada Lovelace', '101.202.3033', 'ada@email.com')
      book.remove_entry('David Forero',  '202.303.4044', 'david@email.com')
      expect(book.entries.first.name).to eq('Ada Lovelace')
    end
  end
end
