class School < ApplicationRecord
  searchkick text_middle: [:name]
  after_create :create_tenant

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, :presence => true
  validates :name, :presence => true
  validates :pitch, :presence => true
  validates :subdomain, :presence => true

  has_many :courses
  has_many :students
  has_many :student_courses

  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
    end
end
