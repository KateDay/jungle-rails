require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "validations" do
    subject{
      @category = Category.new(name: "test")
      described_class.new(
        name: "Thing Ma Jig",
        price_cents: 899.50,
        quantity: 40,
        category: @category
      )
    }

    it 'should have all valid attributes' do
      expect(subject).to be_valid
    end
    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should have a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it 'should have a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'should have a category' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
