class OperatingSystem < ActiveRecord::Base

  def slug
    self.name.gsub(/\s/, "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end

  has_many :reviews
  has_many :users, through: :reviews

end
