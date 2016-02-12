class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, numericality: true, length: { is: 10 }
end
