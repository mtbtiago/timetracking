class Entry < ActiveRecord::Base
  belongs_to :project
  validates :hours, numericality: true, presence: true
  validates :minutes, numericality: true, presence: true

  after_initialize :on_new_record

  def on_new_record
    self.date ||= Date.today
    self.hours ||= 0
    self.minutes ||= 0
  end

  def display_text
    "ID: #{self.id}. Date: #{self.date}. Hours: #{self.hours} Minutes: #{self.minutes}"
  end
end
