class Account < ActiveRecord::Base
  has_many :fields, as: :ownable
end
