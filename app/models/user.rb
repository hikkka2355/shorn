class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :pixars, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_pixars, through: :likes, source: :pixar
         def already_liked?(pixar)
          self.likes.exists?(pixar_id: pixar.id)
        end
        end
