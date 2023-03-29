require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Petro Lesapiti') }

  before { subject.save }
  after { User.destroy_all }

  it { should respond_to(:name) }
end
