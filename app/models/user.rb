class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone, presence: true, numericality: true, length: { is: 10 }

  def formatted_phone
    "#{phone.slice(0,3)}-#{phone.slice(3,3)}-#{phone.slice(6, 4)}" if phone.length == 10
  end
end
