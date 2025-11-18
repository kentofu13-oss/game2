# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
tags = [
    { name: 'ソロプレイ' },
    { name: '協力プレイ' },
    { name: 'オンライン' },
    { name: 'オフライン' },
    
    { name: 'オープンワールド' },
    { name: 'ストーリー重視' },
    { name: '謎解き' },
    { name: 'クラフト' },
    { name: '高難易度' },

    { name: '2D' },
    { name: '3D' },
    { name: 'モバイル対応' },
    { name: 'PC対応' },
    { name: 'VR対応' },
]

tags.uniq{ |t| t[:name] }.each do |tag|
    Tag.find_or_create_by(tag)
end

puts "Done"


