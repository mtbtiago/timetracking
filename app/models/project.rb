class Project < ActiveRecord::Base
  has_many :entries
  # attached related to gem paperclip
  has_attached_file :logo, styles: {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 30 },
    format: { with: /\A[A-Z,0-9 ]+\z/i }

  # for change table name (optional)
  # set table_name = "projects"
  def self.iron_find(n)
    where("name = ?",n).first
  end

  def full_name
    "#{self.id.to_s}. #{self.name}" + (self.description.present? ? " a.k.a. \"#{self.description}\"" : "")
  end

  def self.clean_old
    where("created_at < ?",7.day.ago).destroy_all
  end

  def self.last_created_projects(q)
    order(created_at: :desc).limit(q)
    # is the same than ...
    # limit(q).order(created_at: :desc)
  end

  def calc_total_hours(year, month)
    first_day = Date.new(year,month,1)
    last_day = Date.new(year,month,-1)
    entries_where = entries.where(date: first_day..last_day)
    minutes = entries_where.reduce(0) {|result,e|
      result += (e.hours * 60) + e.minutes
    }
    hours = 0
    until (0..60).member? minutes
      hours -= 60 <=> minutes
      minutes += 60 * (60 <=> minutes)
    end
    hours %= 24
    "#{hours} hours and #{minutes} minutes"
  end

end
