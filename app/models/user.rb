class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos
  has_many :comments
  has_one_attached :profile_picture

  validates :profile_picture, presence: true # Asegura que haya una foto de perfil al registrarse.
  def admin?
    admin # Devuelve true si el usuario es administrador.
  end
end
