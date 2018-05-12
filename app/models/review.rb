class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :operating_system

end
