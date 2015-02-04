class Entry < ActiveRecord::Base
  belongs_to :project
  validates :hours, numericality: true, presence: true
  validates :minutes, numericality: true, presence: true

  def display_text
    "ID: #{self.id}. Date: #{self.date}. Hours: #{self.hours} Minutes: #{self.minutes}"
  end
end
