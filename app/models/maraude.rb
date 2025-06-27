class Maraude < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  validates :place, :date, :hour, :action, presence: true
end
