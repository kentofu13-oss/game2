class Like < ApplicationRecord
  belongs_to :mygame
  belongs_to :user

  validates_uniqueness_of :mygame_id, scope: :user_id
end
