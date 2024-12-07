# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seedの実行を開始"

aozora = User.find_or_create_by!(email: "aozora@example.com") do |user|
  user.name = "あおぞら"
  user.password = "password"
  user.introduction = "空好き。"
  # user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

ensyuunoobaa = User.find_or_create_by!(email: "obaa@example.com") do |user|
  user.name = "遠州のおばあ"
  user.password = "password"
  user.introduction = "おばあ、慣れないSNS挑戦中"
  # user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

tarou = User.find_or_create_by!(email: "tarou@example.com") do |user|
  user.name = "たろう"
  user.password = "password"
  # user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

 Post.create(
  step_count: 2000,
  place: "座間",
  genre: "散歩",
  body: "今日はいい天気！",
  user_id: 1
)

Post.create(
  step_count: 5000,
  place: "東京",
  genre: "おでかけ",
  # body: "今日はいい天気！",
  user_id: 2
)

Post.create(
  step_count: 2000,
  place: "座間",
  genre: "散歩",
  body: "久しぶりに出かけたら疲れたー！",
  user_id: 3
)

puts "seedの実行が完了しました"