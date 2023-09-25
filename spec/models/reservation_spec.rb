require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(username: 'testuser', email: 'testuser@example.com', password: 'password') }
  let(:motorcycle) { Motorcycle.create(name: 'Test Motorcycle', model: 'Test Model', description: 'Test Description', photo: 'Test Photo', user: user) }
  subject { described_class.new(user: user, motorcycle: motorcycle, start_date: Date.today, end_date: Date.tomorrow) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a motorcycle' do
      subject.motorcycle = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a start date' do
      subject.start_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an end date' do
      subject.end_date = nil
      expect(subject).not_to be_valid
    end
  end
end
