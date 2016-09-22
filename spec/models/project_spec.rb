require 'spec_helper'
require 'rails_helper'
 
describe Project do
  let(:project) { Project.new }
 
  it { expect(project).to validate_presence_of(:name) }
  it { expect(project).to validate_presence_of(:user_id) }
  it { should belong_to :user }
  it { should have_many :tasks }
end