require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_phone_number, expected_email)
    expect(entry.name).to eq(expected_name)
    expect(entry.phone_number).to eq(expected_phone_number)
    expect(entry.email).to eq(expected_email)
  end

  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "add_entry" do
    it "adds only one new entry to the address book" do
      book.add_entry('Ada Lovelace', '101.202.3033', 'ada@email.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '101.202.3033', 'ada@email.com')
      new_entry = book.entries[0]
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('101.202.3033')
      expect(new_entry.email).to eq('ada@email.com')
    end
  end
  #Tests to see if address book method import_from_csv is working as expected

  describe "import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")

      #Check the size of the entries
      expect(book.entries.size).to eq 5
    end

    it "imports the first entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "David", "202.303.4044", "david@email.com")
    end

    it "imports the second entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]

      check_entry(entry_two, "Otacon", "606.707.8088", "otacon@email.com")

    end

    it "imports the third entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]

      check_entry(entry_three, "Shalashaska", "404.505.6066", "shalashaska@email.com")
    end

    it "imports the fourth entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]

      check_entry(entry_four, "Sheryl", "505.606.7077", "sheryl@email.com")

    end

    it "imports the fifth entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]

    check_entry(entry_five, "Snake", "303.404.5055", "snake@email.com")
    end
  end

  describe "binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_nil
    end

    it "searches AddressBook for  Snake" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Snake")
      #Check the object type to be an Entry class object
      expect(entry).to be_a Entry
      check_entry(entry, "Snake", "303.404.5055", "snake@email.com")
    end

    it "searches AddressBook for David" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("David")
      expect(entry).to be_a Entry
      check_entry(entry, "David", "202.303.4044", "david@email.com")
    end

    it "searches AddressBook for Shalashaska" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Shalashaska")
      expect(entry).to be_an Entry
      check_entry(entry, "Shalashaska", "404.505.6066", "shalashaska@email.com")
    end

    it "searches AddressBook for Sheryl" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sheryl")
      expect(entry).to be_a Entry
      check_entry(entry, "Sheryl", "505.606.7077", "sheryl@email.com")
    end

    it "searches AddressBook for Dave" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dave")
      expect(entry).to be_nil
    end
  end
end
