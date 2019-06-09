# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'アクション',image: open("#{Rails.root}/app/assets/images/action.jpg"))
Category.create(name: 'アドベンチャー',image: open("#{Rails.root}/app/assets/images/adventurer.jpg"))
Category.create(name: 'RPG',image: open("#{Rails.root}/app/assets/images/rpg.jpg"))
Category.create(name: 'パズル',image: open("#{Rails.root}/app/assets/images/puzzle.jpg"))
Category.create(name: 'シューティング',image: open("#{Rails.root}/app/assets/images/shooting.jpg"))
Category.create(name: 'シミュレーション',image: open("#{Rails.root}/app/assets/images/simulation.jpg"))
Category.create(name: 'スポーツ',image: open("#{Rails.root}/app/assets/images/sports.jpg"))
Category.create(name: '音楽',image: open("#{Rails.root}/app/assets/images/music.jpg"))
Category.create(name: 'レース',image: open("#{Rails.root}/app/assets/images/race.jpg"))
Category.create(name: 'ボード',image: open("#{Rails.root}/app/assets/images/bord.jpg"))