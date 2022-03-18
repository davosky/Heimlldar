class Permit < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_name
  
  def set_name
    last_name = Permit.maximum(:name)
    self.name = last_name.to_i + 1
  end

  validates :start_time, presence: true
end
