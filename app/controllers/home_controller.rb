class HomeController < ApplicationController
  helper_method :resource_name, :devise_mapping
  before_action :authenticate_user!
  
  def index
    head 401 unless current_user
    projects = Project.where(user_id: current_user.id)
  end

  def resource_name
    :user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
