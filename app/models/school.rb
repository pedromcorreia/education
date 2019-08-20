class School < ApplicationRecord
  after_create :create_tenant

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, :presence => true
  validates :name, :presence => true
  validates :pitch, :presence => true
  validates :subdomain, :presence => true

  has_many :courses
  has_many :students

  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
    end
end
