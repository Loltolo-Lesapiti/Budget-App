require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'Transport', icon: 'https://bit.ly/3lL38nz') }

  before { subject.save }
  after { Category.destroy_all }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should have a name' do
    subject.name = 'Transport'
    expect(subject).to be_valid
  end

  it 'should a link to the icon' do
    subject.icon = 'https://bit.ly/3lL38nz'
    expect(subject).to be_valid
  end
end