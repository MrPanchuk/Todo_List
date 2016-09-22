require 'spec_helper'
require 'rails_helper'
 
describe User do
  let(:user) { User.new }
 
  it { expect(user).to validate_presence_of(:email) }
  it { expect(user).to validate_uniqueness_of(:email) }
  it { should have_many :projects }
end