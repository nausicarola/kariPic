class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :content, presence: true # Asegura que el contenido no esté vacío.
end
