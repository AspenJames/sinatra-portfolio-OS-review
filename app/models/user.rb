class User < ActiveRecord::Base

  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
  
  include ActiveModel::Validations
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true

  has_many :reviews
  has_many :operating_systems, through: :reviews

end
