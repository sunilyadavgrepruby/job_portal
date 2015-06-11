class Organization < ActiveRecord::Base
  has_many :jobs 
  belongs_to :user
  validates :organization_name, presence: true, length: { minimum: 5 , maximum: 15 }
  validates :organization_address, presence: true, length: { minimum: 15 ,maximum: 30}
  validates :organization_email, presence: true, length: { minimum: 8 , maximum: 20}
end
