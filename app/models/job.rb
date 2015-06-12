class Job < ActiveRecord::Base
  belongs_to :organization
  #validates :organization, presence: true
  validates :title, presence: true, length: { minimum: 5 , maximum: 10}
  validates :description, presence: true, length: { minimum: 20 , maximum: 35 }
end
