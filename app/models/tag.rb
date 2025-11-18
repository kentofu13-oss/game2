class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :mygame_tag_relations, dependent: :destroy
    has_many :mygames, through: :mygame_tag_relations, dependent: :destroy
end
