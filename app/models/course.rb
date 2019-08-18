class Course < ApplicationRecord

  validates :tittle, :presence => true
  validates :description, :presence => true
  validates :content, :presence => true
  validates :duration, :presence => true
  validates :price, :presence => true

end
