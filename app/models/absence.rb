class Absence < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_name

  def set_name
    last_name = Absence.maximum(:name)
    self.name = last_name.to_i + 1
  end

  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :congruent_date_range

  def congruent_date_range
    if !end_time.blank? and end_time < start_time
      errors.add(:end_time, "Data Fine non puo essere minore di Data Inizio")
    end
  end
end
