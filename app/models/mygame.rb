class Mygame < ApplicationRecord
    belongs_to :user
    
    has_many :mygame_tag_relations, dependent: :destroy
    has_many :tags, through: :mygame_tag_relations, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_one_attached :image

    serialize :platforms, coder: YAML
end
