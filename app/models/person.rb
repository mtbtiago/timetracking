class Person < ActiveRecord::Base
  has_many :participations
  has_many :projects, through: :participations

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 30 }
end
