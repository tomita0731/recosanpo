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
  user.password = ENV["SEED_PASSWORD"]
  user.introduction = "空好き。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/pomupomu.JPG"), filename:"pomupomu.JPG")
end

obaa = User.find_or_create_by!(email: "obaa@example.com") do |user|
  user.name = "遠州のおばあ"
  user.password = ENV["SEED_PASSWORD"]
  user.introduction = "おばあ、慣れないSNS挑戦中。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/taniku.jpeg"), filename:"taniku.jpeg")
end

tarou = User.find_or_create_by!(email: "tarou@example.com") do |user|
  user.name = "たろう"
  user.password = ENV["SEED_PASSWORD"]
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/matu.JPG"), filename:"matu.JPG")
end


10.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: ENV["SEED_PASSWORD"]
  )
end


Post.create!(
  [
    {step_count: 2000,place: "座間",genre: "日常",address: "神奈川県座間市緑ヶ丘1丁目",body: "今日はいい天気！",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/zamasora.jpeg")),filename:"zamasora.jpeg"),publish_status: "released",created_at: "2024/11/10",user_id: 1},
    {step_count: 3000,place: "座間",genre: "日常",address: "神奈川県座間市緑ヶ丘1丁目",body: "秋晴れ",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/zamasora2.jpeg")),filename:"zamasora2.jpeg"),publish_status: "released",created_at: "2024/11/21",user_id: 1},
    {step_count: 5000,place: "座間",genre: "おでかけ",address: "神奈川県座間市緑ヶ丘1丁目",body: "散歩中にリス発見！かわいい",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/risu.jpeg")),filename:"risu.jpeg"),publish_status: "released",created_at: "2024/9/21",user_id: 1},
    {step_count: 5000,place: "浜松",genre: "日常",address: "静岡県浜松市浜名区平口",body: "ネモフィラが咲く季節になりました。",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hana2.JPG")),filename:"hana2.JPG"),publish_status: "released",created_at: "2024/5/5",user_id: 2},
    {step_count: 6000,place: "フラワーパーク",genre: "お出かけ",address: "静岡県浜松市浜名区平口",body: "チューリップ満開！毎年の楽しみ。今年も来れました",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hana.JPG")),filename:"hana.JPG"),publish_status: "released",created_at: "2024/4/5",user_id: 2},
    {step_count: 4000,place: "神社",genre: "お出かけ",address: "静岡県浜松市浜名区平口",body: "初詣に来ました",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hatumoude.jpeg")),filename:"hatumoude.jpeg"),publish_status: "released",created_at: "2024/4/5",user_id: 2},
    {step_count: 1000,place: "浜松",genre: "日常",address: "静岡県浜松市浜名区平口",body: "みかんの季節。道端の無人販売のみかんで販売し始めました",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/mikan.jpeg")),filename:"mikan.jpeg"),publish_status: "released",created_at: "2024/12/5",user_id: 2},
    {step_count: 6000,place: "静岡",genre: "おでかけ",address: "静岡県島田市金谷東2丁目",body: "機関車に乗ってみた",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/kikansya.JPG")),filename:"kikansya.JPG"),publish_status: "released",created_at: "2024/10/11",user_id: 3},
    {step_count: 2000,place: "川崎",genre: "日常",address: "神奈川県川崎市麻生区20",body: "クリスマスツリー",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/tree.jpeg")),filename:"tree.jpeg"),publish_status: "released",created_at: "2024/12/23",user_id: 3},
    {step_count: 6000,place: "東京",genre: "おでかけ",address: "東京都目黒区目黒",body: "お花見",images: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sakura.JPG")),filename:"sakura.JPG"),publish_status: "released",created_at: "2024/3/23",user_id: 3}
  ]
)

User.all.each do |user|
  user.posts.create!(
    step_count: 1000,
    place: "東京",
    genre: "日常",
    body: 'テストテストテスト',
    publish_status: "released",
    created_at: "2023/12/23",
  )
end

User.all.each do |user|
  user.posts.create!(
    step_count: 2000,
    place: "東京",
    genre: "日常",
    body: 'テストテストテスト2',
    publish_status: "released",
    created_at: "2023/12/26",
  )
end

User.all.each do |user|
  user.posts.create!(
    step_count: 2000,
    place: "東京",
    genre: "日常",
    body: 'テストテストテスト3',
    publish_status: "released",
    created_at: "2024/2/26",
  )
end

User.all.each do |user|
  user.posts.create!(
    step_count: 3000,
    place: "東京",
    genre: "日常",
    body: 'テストテストテスト4',
    publish_status: "released",
    created_at: "2024/2/27",
  )
end

puts "seedの実行が完了しました"