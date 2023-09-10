class Like < ApplicationRecord
  belongs_to :pixar
  belongs_to :user
  validates_uniqueness_of :pixar_id, scope: :user_id
end
