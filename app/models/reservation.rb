class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :motorcycles
end
