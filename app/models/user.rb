class User < ApplicationRecord
has_one :emp_detail
has_many :benefits
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

attribute :role, :boolean, default: false 


def admin?
role == true
end
      
# def active_for_authentication?
#      super && approved?
# end
      
# def inactive_message
#     approved? ? super : "Your account has not been approved yet. Please contact the administrator for approval."
# end
end
