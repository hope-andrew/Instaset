# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bruce = User.new({
  username: "BruceBanner",
  password: "password"})
bruce_photo_1 = bruce.photos.new({
  user_id: bruce.id,
  img_url: "https://www.filepicker.io/api/file/tUd0x98MR2SHOdeRgYyU",
  caption: "Los Alamos National Lab"})
bruce.photos.first.comments.new({
  author_id: bruce.id,
  photo_id: bruce_photo_1.id,
  body: "The laboratory at sunset"
  })
