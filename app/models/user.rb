class User < ActiveRecord::Base
  has_many :employees , class_name:"User" , foreign_key: "invited_by_id"
  belongs_to :recruiter, class_name:"User", foreign_key: "invited_by_id"
  has_many :organizations
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  ROLES = ["recruiter", "candidate" , "employee"]
  
  def is?(role)
    self.role == role
  end
  
end
