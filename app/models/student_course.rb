class StudentCourse < ApplicationRecord
  validates :active, :presence => true
  belongs_to :course
  belongs_to :student
end
