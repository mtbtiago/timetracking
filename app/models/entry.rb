class Entry < ActiveRecord::Base
  belongs_to :project
  validates :hours, numericality: true, presence: true
  validates :minutes, numericality: true, presence: true
end
