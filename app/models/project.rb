class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates :name, :user_id, presence: true
end
