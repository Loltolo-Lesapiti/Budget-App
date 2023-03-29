require 'rails_helper'

RSpec.describe Budget, type: :model do
  before do
    @user = User.create(email: 'petro@gmail.com', password: 'password2023')
  end

  after { Budget.destroy_all }

  subject { Budget.new(user_id: @user.id, name: 'Bus-Fare', amount: 80) }

  it 'should have a valid attribute' do
    expect(subject).to be_valid
  end

  it 'should have a name of the budget' do
    subject.name = 'Bus-Fare'
    expect(subject).to be_valid
  end

  it 'should have a valid amount' do
    subject.amount = 80
    expect(subject).to be_valid
  end
end
