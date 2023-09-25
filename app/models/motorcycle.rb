class Motorcycle < ApplicationRecord
  belongs_to :user, class_name: 'User'

  validates :name, presence: true
  validates :photo, presence: true
  validates :description, presence: true
  validates :model, presence: true
  validates :make, presence: true
end

