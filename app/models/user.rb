class User < ApplicationRecord
  has_many :motorcycles
  has_many :reservations
end
