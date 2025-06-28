class User < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :maraudes, through: :participations
  has_many :maraudes_created, class_name: "Maraude", foreign_key: :user_id, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
