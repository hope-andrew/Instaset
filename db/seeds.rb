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
bruce_photo_2 = bruce.photos.new({
  user_id: bruce.id,
  img_url: "http://wac.450f.edgecastcdn.net/80450F/929jackfm.com/files/2012/09/beautiful-sunset-at-the-university-at-buffalo-buffalove-@andrewjustsaid-Instagram.jpg",
  caption: "Working late at the lab again..."})
bruce_photo_2 = bruce.photos.new({
  user_id: bruce.id,
  img_url: "http://wac.450f.edgecastcdn.net/80450F/929jackfm.com/files/2012/09/beautiful-sunset-at-the-university-at-buffalo-buffalove-@andrewjustsaid-Instagram.jpg",
  caption: "Working late at the lab again..."})
bruce_photo_2_like = bruce_photo_2.likes.new({
  liker: bruce.id
  })
bruce_photo_1_like = bruce_photo_1.likes.new({
  liker: bruce.id
  })

barry = User.new({
  username: "BarryAllen",
  password: "password"
  })
barry_photo_1 = barry.photos.new({
  img_url: "https://cdn1.lockerdome.com/uploads/ad8e70e74a0a449b70e5ddd7edde03184077c6264362241bb54accbb246e5f6e_large",
  caption: "Just another sunset"
  })
barry_photo_2 = barry.photos.new({
  img_url: "https://visit-stockton.s3.amazonaws.com/CMS/4909/instagram_khushpreetchoumwer__hd.jpg",
  caption: "At the industrial park..."
  })
barry_photo_3 = barry.photos.new({
  img_url: "http://media3.popsugar-assets.com/files/2012/02/06/4/192/1922507/64032b3c532311e1a87612313804ec91_7.xxxlarge/i/Sunsets-Instagram.jpg",
  caption: "Running by the tracks at sundown"
  })
barry_photo_4 = barry.photos.new({
  img_url: "https://s-media-cache-ak0.pinimg.com/736x/ab/74/75/ab7475a2e002b47e42ebaa60087faa6b.jpg",
  caption: "Above the clouds for sunset"
  })

bruce_follow_barry = bruce.follows.new({
  follower_id: bruce.id,
  follow_id: barry.id
  })
