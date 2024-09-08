# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Admin データの作成
  admin = Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
    admin.password = ENV['ADMIN_PASSWORD']
  end

  # User データの作成
  olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
    user.name = "olivia"
    user.password = "password"
  end

  james = User.find_or_create_by!(email: "james@example.com") do |user|
    user.name = "james"
    user.password = "password"
  end

  lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
    user.name = "lucas"
    user.password = "password"
  end

  # 科名マスターの登録
  PlantFamily.find_or_create_by!(name: "ナス科")
  PlantFamily.find_or_create_by!(name: "ウリ科")
  PlantFamily.find_or_create_by!(name: "イネ科")
  PlantFamily.find_or_create_by!(name: "バラ科")
  PlantFamily.find_or_create_by!(name: "アオイ科")
  PlantFamily.find_or_create_by!(name: "マメ科")
  PlantFamily.find_or_create_by!(name: "ゴマ科")
  PlantFamily.find_or_create_by!(name: "アブラナ科")
  PlantFamily.find_or_create_by!(name: "ヒユ科")
  PlantFamily.find_or_create_by!(name: "ヒガンバナ科")
  PlantFamily.find_or_create_by!(name: "シソ科")
  PlantFamily.find_or_create_by!(name: "キク科")
  PlantFamily.find_or_create_by!(name: "セリ科")

  # 作物データの作成
  Crop.find_or_create_by!(name: "トマト") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "4年以上"
    crop.companion = "ネギ、バジル、ニラ、落花生、ビガンバナ科、マメ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ナス") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "4年以上"
    crop.companion = "ビガンバナ科、マメ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ピーマン") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "4年以上"
    crop.companion = "ビガンバナ科、マメ科、シソ科"
  end

  Crop.find_or_create_by!(name: "トウガラシ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "4年以上"
    crop.companion = "ビガンバナ科、マメ科、シソ科"
  end

  Crop.find_or_create_by!(name: "シシトウ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "4年以上"
    crop.companion = "ビガンバナ科、マメ科、シソ科"
  end

  Crop.find_or_create_by!(name: "キュウリ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "3年以上"
    crop.companion = "ニンニク、ネギ、ラディッシュ、ビガンバナ科、マメ科、イネ科、シソ科"
  end

  Crop.find_or_create_by!(name: "シロウリ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "4年以上"
    crop.companion = "ネギ"
  end

  Crop.find_or_create_by!(name: "ゴーヤー") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "3年以上"
    crop.companion = "ニンニク、ネギ、ニラ、ビガンバナ科、マメ科、イネ科、キク科"
  end

  Crop.find_or_create_by!(name: "メロン") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "4年以上"
    crop.companion = "ニンニク、ネギ、ビガンバナ科、マメ科、イネ科、キク科"
  end

  Crop.find_or_create_by!(name: "スイカ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "4年以上"
    crop.companion = "ニンニク、ネギ、トウモロコシ、ソルゴー、ビガンバナ科、マメ科、イネ科、キク科"
  end

  Crop.find_or_create_by!(name: "カボチャ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "トウモロコシ、ニンニク、インゲン豆、ネギ、ビガンバナ科、マメ科、イネ科、キク科"
  end

  Crop.find_or_create_by!(name: "ズッキーニ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "ニンニク、ネギ、ビガンバナ科、マメ科、イネ科、キク科"
  end

  Crop.find_or_create_by!(name: "ヘチマ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "4年以上"
    crop.companion = "ネギ、マメ科"
  end

  Crop.find_or_create_by!(name: "ヒョウタン") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ウリ科"
    crop.rotation_year = "3年以上"
    crop.companion = "ネギ"
  end

  Crop.find_or_create_by!(name: "トウモロコシ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "イネ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "インゲン豆、カボチャ、エダマメ、マメ科、ウリ科"
  end

  Crop.find_or_create_by!(name: "イチゴ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "バラ科"
    crop.rotation_year = "2年以上"
    crop.companion = "ニンニク、セリ科、キク科"
  end

  Crop.find_or_create_by!(name: "オクラ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アオイ科"
    crop.rotation_year = "2年以上"
    crop.companion = "バジル"
  end

  Crop.find_or_create_by!(name: "エンドウ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "マメ科"
    crop.rotation_year = "5年以上"
    crop.companion = "イネ科、セリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "インゲン") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "マメ科"
    crop.rotation_year = "4年以上"
    crop.companion = "トウモロコシ、ルッコラ、イネ科、セリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "エダマメ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "マメ科"
    crop.rotation_year = "3年以上"
    crop.companion = "トウモロコシ、バジル、ニンジン、イネ科、セリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ソラマメ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "マメ科"
    crop.rotation_year = "5年以上"
    crop.companion = "小麦、イネ科、セリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "落花生") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "マメ科"
    crop.rotation_year = "3年以上"
    crop.companion = "イネ科、セリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ゴマ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ゴマ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "サツマイモ、エダマメ、落花生"
  end

  Crop.find_or_create_by!(name: "キャベツ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "3年以上"
    crop.companion = "レタス、春菊、セージ、キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "メキャベツ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "3年以上"
    crop.companion = "キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ブロッコリー") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "3年以上"
    crop.companion = "レタス、春菊、キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "カリフラワー") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ハクサイ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "3年以上"
    crop.companion = "レタス、春菊、キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ホウレンソウ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒユ科"
    crop.rotation_year = "2年以上"
    crop.companion = "葉ネギ、ゴボウ、ニンジン、ヒガンバナ科"
  end

  Crop.find_or_create_by!(name: "コマツナ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "カブ、ネギ、ニラ、キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "タカナ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ミズナ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "ニラ、キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "カラシナ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ルッコラ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "キク科、セリ科、ヒガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "クレソン") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "アブラナ科"
    crop.rotation_year = "1年以上"
    crop.companion = "セリ、ミツバ"
  end

  Crop.find_or_create_by!(name: "ネギ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒガンバナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "ウリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ワケギ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒガンバナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "ウリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "タマネギ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒガンバナ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "ニンジン、ウリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ラッキョウ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒガンバナ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "ウリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ニンニク") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒガンバナ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "ウリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ニラ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ヒガンバナ科"
    crop.rotation_year = "2年以上"
    crop.companion = "トマト、ウリ科、ナス科"
  end

  Crop.find_or_create_by!(name: "ミョウガ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ショウガ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "ローズマリー"
  end

  Crop.find_or_create_by!(name: "シュンギク") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "キク科"
    crop.rotation_year = "2年以上"
    crop.companion = "アブラナ科、バラ科、ウリ科"
  end

  Crop.find_or_create_by!(name: "レタス") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "キク科"
    crop.rotation_year = "2年以上"
    crop.companion = "アブラナ科、バラ科、ウリ科"
  end

  Crop.find_or_create_by!(name: "リーフレタス") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "キク科"
    crop.rotation_year = "2年以上"
    crop.companion = "アブラナ科、バラ科、ウリ科"
  end

  Crop.find_or_create_by!(name: "サンチュ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "キク科"
    crop.rotation_year = "3年以上"
    crop.companion = "アブラナ科、バラ科、ウリ科"
  end

  Crop.find_or_create_by!(name: "アーティチョーク") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "キク科"
    crop.rotation_year = "3年以上"
    crop.companion = "アブラナ科、バラ科、ウリ科"
  end

  Crop.find_or_create_by!(name: "ルバーブ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "タデ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "マメ科、バラ科、アブラナ科"
  end

  Crop.find_or_create_by!(name: "アスパラガス") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "キジカクシ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "バジル"
  end

  Crop.find_or_create_by!(name: "ミツバ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "セリ科"
    crop.rotation_year = "4年以上"
    crop.companion = "マメ科、バラ科、アブラナ科"
  end

  Crop.find_or_create_by!(name: "シソ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "シソ科"
    crop.rotation_year = "連作障害が起こりにくい"
    crop.companion = "ウリ科"
  end

  Crop.find_or_create_by!(name: "ジャガイモ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "3年以上"
    crop.companion = "トウモロコシ、キャベツ、マメ科、ビガンバナ科、シソ科"
  end

  Crop.find_or_create_by!(name: "セロリ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "セリ科"
    crop.rotation_year = "3年以上"
    crop.companion = "マメ科、バラ科、アブラナ科"
  end

  Crop.find_or_create_by!(name: "パセリ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "セリ科"
    crop.rotation_year = "2年以上"
    crop.companion = "マメ科、バラ科、アブラナ科"
  end

  Crop.find_or_create_by!(name: "ニンジン") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "セリ科"
    crop.rotation_year = "2年以上"
    crop.companion = "カブ、エダマメ、ゴボウ、マメ科、バラ科、アブラナ科"
  end

  Crop.find_or_create_by!(name: "ナス") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ナス科"
    crop.rotation_year = "4年以上"
    crop.companion = "ネギ、ニラ、落花生、ビガンバナ科、マメ科、シソ科"
  end

  Crop.find_or_create_by!(name: "ショウガ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "ショウガ科"
    crop.rotation_year = "5年以上"
    crop.companion = "サトイモ"
  end

  Crop.find_or_create_by!(name: "サトイモ") do |crop|
    crop.user_id = admin.id
    crop.plant_family = "サトイモ科"
    crop.rotation_year = "4年以上"
    crop.companion = "ショウガ、ジャガイモ、ダイコン、パセリ、セロリ、トウモロコシ"
  end

  puts '初期データを追加しました'