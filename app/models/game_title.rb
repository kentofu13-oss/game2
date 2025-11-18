class GameTitle
  include ActiveModel::Model
  attr_accessor :id, :name

  def self.all
    data = YAML.load_file(Rails.root.join("config/game_titles.yml"))
    data["titles"].map { |t| new(id: t["id"], name: t["name"]) }
  end

  def self.random
    all.sample
  end

  def self.find(id)
    all.find { |t| t.id.to_s == id.to_s }
  end
end
