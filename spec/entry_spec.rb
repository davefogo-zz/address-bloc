require_relative '../models/entry.rb'

RSpec.describe Entry do
  let(:entry) {Entry.new('Ada Lovelace', '101.202.3033', 'ada@email.com')}

  describe "attributes" do
    it "reports its name" do
      expect(entry.name).to eq('Ada Lovelace')
    end

    it "reports its phone_number" do
      expect(entry.phone_number).to eq('101.202.3033')
    end

    it "reports its email" do
      expect(entry.email).to eq('ada@email.com')
    end
  end

  describe "#to_s" do
    it "prints an entry as a string" do
      expected_string = "Name: Ada Lovelace\nPhone Number: 101.202.3033\nEmail: ada@email.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end
end
