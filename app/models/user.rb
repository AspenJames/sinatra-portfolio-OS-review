class User < ActiveRecord::Base
  include ActiveModel::Validations
  has_secure_password

  validates :name, presence: true 
  validates :username, presence: true
  validates :email, presence: true

end
