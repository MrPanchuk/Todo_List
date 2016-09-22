require 'rails_helper'
require 'spec_helper'

describe TasksController do
  before(:each) do
    auth
    @project = Project.create(name: 'test', user_id: subject.current_user.id)
  end

  describe 'POST create' do
    it 'creates task' do
      post :create, task: {name: 'test', project_id: @project.id}
      expect(Task.count).to eq(1)
    end
  end

  describe 'PUT update' do
    it 'updates task name' do
      task = Task.create(name: 'test', project_id: @project.id)
      put :update, task: {name: 'changed'}, id: task.id
      
      expect(Task.last.name).to eq('changed')
    end
  end

  describe 'DELETE destroy' do
    it 'deletes task' do
      task = Task.create(name: 'test', project_id: @project.id)
      
      expect { delete :destroy, id: task.id }.to change(Task, :count).by(-1)
    end
  end
end
