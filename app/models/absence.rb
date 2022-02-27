class Absence < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :absence_type, optional: true
end
