require 'spec_helper'
require 'rails_helper'
 
describe Task do
  let(:task) { Task.new }
 
  it { expect(task).to validate_presence_of(:name) }
  it { expect(task).to validate_presence_of(:project_id) }
  it { should belong_to :project }
end