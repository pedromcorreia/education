class Student < ApplicationRecord

  validates :name, :presence => true

  has_many :studentcourses
  belongs_to :school
end
