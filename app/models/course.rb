class Course < ApplicationRecord
  has_many :studentcourses
  belongs_to :school
end
