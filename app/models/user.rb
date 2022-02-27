class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  belongs_to :department, optional: true
  belongs_to :zone, optional: true
  has_many :absences

  validates :first_name, presence: true
  validates :last_name, presence: true
  
  validate :password_complexity

  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
      errors.add :password, 'La password non è sufficientemente complessa'
    end
  end
end
