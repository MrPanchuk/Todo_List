require 'rails_helper'
require 'spec_helper'

describe ProjectsController do
  before(:each) do
    auth
  end

  describe 'POST create' do
    it 'creates project' do
      post :create, project: {name: 'test'}
      expect(Project.count).to eq(1)
    end
  end

  describe 'PUT update' do
    it 'updates project name' do
      project = Project.create(name: 'test', user_id: subject.current_user.id)
      put :update, project: {name: 'changed'}, id: project.id
      
      expect(Project.last.name).to eq('changed')
    end
  end

  describe 'DELETE destroy' do
    it 'deletes project' do
      project = Project.create(name: 'test', user_id: subject.current_user.id)
      
      expect { delete :destroy, id: project.id }.to change(Project, :count).by(-1)
    end
  end
end
