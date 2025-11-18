class MygameTagRelation < ApplicationRecord
  belongs_to :mygame
  belongs_to :tag
end
