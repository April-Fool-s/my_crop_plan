# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin データの作成
Admin.find_or_create_by!(email: ENV['ADMIN_EMAIL']) do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

# 作物データの作成
Crop.find_or_create_by!(name: "トマト") do |crop|
  crop.plant_family = "ナス科"
  crop.rotation_year = "4年以上"
  crop.companion = "ネギ、バジル、ニラ、落花生、 ビガンバナ科、マメ科、シソ科"
end

Crop.find_or_create_by!(name: "キュウリ") do |crop|
  crop.plant_family = "ウリ科"
  crop.rotation_year = "3年以上"
  crop.companion = "ニンニク、ネギ、ラディッシュ、ビガンバナ科、マメ科、イネ科、シソ科"
end

Crop.find_or_create_by!(name: "ジャガイモ") do |crop|
  crop.plant_family = "ナス科"
  crop.rotation_year = "3年以上"
  crop.companion = "トウモロコシ、キャベツ、マメ科、ビガンバナ科、シソ科"
end

Crop.find_or_create_by!(name: "ニンジン") do |crop|
  crop.plant_family = "セリ科"
  crop.rotation_year = "2年以上"
  crop.companion = "カブ、エダマメ、ゴボウ、マメ科、バラ科、アブラナ科"
end

Crop.find_or_create_by!(name: "ピーマン") do |crop|
  crop.plant_family = "ナス科"
  crop.rotation_year = "4年以上"
  crop.companion = "ネギ、ルッコラ、落花生、ビガンバナ科、マメ科、シソ科"
end

Crop.find_or_create_by!(name: "ナス") do |crop|
  crop.plant_family = "ナス科"
  crop.rotation_year = "4年以上"
  crop.companion = "ネギ、ニラ、落花生、 ビガンバナ科、マメ科、シソ科"
end

Crop.find_or_create_by!(name: "エダマメ") do |crop|
  crop.plant_family = "マメ科"
  crop.rotation_year = "3年以上"
  crop.companion = "トウモロコシ、バジル、ニンジン、 イネ科、セリ科、ナス科"
end

Crop.find_or_create_by!(name: "ショウガ") do |crop|
  crop.plant_family = "ショウガ科"
  crop.rotation_year = "5年以上"
  crop.companion = "サトイモ"
end

Crop.find_or_create_by!(name: "サトイモ") do |crop|
  crop.plant_family = "サトイモ科"
  crop.rotation_year = "4年以上"
  crop.companion = "ショウガ、ジャガイモ、ダイコン、パセリ、セロリ、トウモロコシ"
end

puts '初期データを追加しました'