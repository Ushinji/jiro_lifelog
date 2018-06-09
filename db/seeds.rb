# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'hirao', email: 'hirao@mail.com')
store = Store.create(name: '三田本店')
Menu.create(name: 'ぶた入りラーメン')
Menu.create(name: 'ぶたダブルラーメン')
Menu.create(name: '大ラーメン')
Menu.create(name: 'ぶた入り大ラーメン')
Menu.create(name: 'ぶたダブル大ラーメン')
