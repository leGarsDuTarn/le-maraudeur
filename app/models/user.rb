class User < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :maraudes, through: :participations
  has_many :maraudes_created, class_name: "Maraude", foreign_key: :user_id, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # J'ai mis un validate afin que les users n'ai pas le même username
  # je l'ai renforcé avec case_sensitive donc Benji et benji sont egaux
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  mount_uploader :avatar, ImageUploader
end
