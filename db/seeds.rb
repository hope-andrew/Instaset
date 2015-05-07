# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bruce = User.new({
  username: "GuestUser123",
  password: "password"})
bruce.save

bruce_photo_1 = bruce.photos.new({
  user_id: bruce.id,
  img_url: "https://www.filepicker.io/api/file/tUd0x98MR2SHOdeRgYyU",
  caption: "Los Alamos National Lab"})
bruce_photo_1.save

bruce_photo_1_comment = bruce.photos.first.comments.new({
  author_id: bruce.id,
  photo_id: bruce_photo_1.id,
  body: "The laboratory at sunset"
  })
bruce_photo_1_comment.save

bruce_photo_2 = bruce.photos.new({
  user_id: bruce.id,
  img_url: "http://wac.450f.edgecastcdn.net/80450F/929jackfm.com/files/2012/09/beautiful-sunset-at-the-university-at-buffalo-buffalove-@andrewjustsaid-Instagram.jpg",
  caption: "Working late at the lab again..."})
bruce_photo_2.save

bruce_photo_3 = bruce.photos.new({
  user_id: bruce.id,
  img_url: "https://www.filepicker.io/api/file/DXZ99DuScGh4B62I5gbQ",
  caption: "Magic Hour"})
bruce_photo_3.save

bruce_photo_2_like = bruce_photo_2.likes.new({
  liker: bruce.id
  })
bruce_photo_2_like.save

bruce_photo_1_like = bruce_photo_1.likes.new({
  liker: bruce.id
  })
bruce_photo_1_like.save

barry = User.new({
  username: "BarryAllen",
  password: "password"
  })
barry.save

barry_photo_1 = barry.photos.new({
  img_url: "https://cdn1.lockerdome.com/uploads/ad8e70e74a0a449b70e5ddd7edde03184077c6264362241bb54accbb246e5f6e_large",
  caption: "Just another sunset"
  })
barry_photo_1.save

barry_photo_2 = barry.photos.new({
  img_url: "https://visit-stockton.s3.amazonaws.com/CMS/4909/instagram_khushpreetchoumwer__hd.jpg",
  caption: "At the industrial park..."
  })
barry_photo_2.save

barry_photo_3 = barry.photos.new({
  img_url: "http://media3.popsugar-assets.com/files/2012/02/06/4/192/1922507/64032b3c532311e1a87612313804ec91_7.xxxlarge/i/Sunsets-Instagram.jpg",
  caption: "Running by the tracks at sundown"
  })
barry_photo_3.save

barry_photo_4 = barry.photos.new({
  img_url: "https://s-media-cache-ak0.pinimg.com/736x/ab/74/75/ab7475a2e002b47e42ebaa60087faa6b.jpg",
  caption: "Mountain views"
  })
barry_photo_4.save

bruce_follow_barry = bruce.follows.new({
  follower_id: bruce.id,
  follow_id: barry.id
  })
bruce_follow_barry.save


steve = User.new({
  username: "SteveRogers",
  password: "password"})
steve.save

steve_photo_1 = steve.photos.new({
  img_url: "https://www.filepicker.io/api/file/3TVFpCefQdCWWvYyt6xm",
  caption: "Sunset over the mountains"
  })
steve_photo_1.save

steve_photo_2 = steve.photos.new({
  img_url: "https://www.filepicker.io/api/file/G8CZXojS7Gapee6gF6Gg",
  caption: "America, the beautiful"
  })
steve_photo_2.save

steve_photo_3 = steve.photos.new({
  img_url: "https://www.filepicker.io/api/file/yQWn1TVgSyOwhq5KIfwe",
  caption: "By the pier, getting some early morning laps in"
  })
steve_photo_3.save

steve_photo_4 = steve.photos.new({
  img_url: "https://www.filepicker.io/api/file/q3GMO31Qn2ZJ6VQN7KAC",
  caption: "A nice sunset after taining all day"
  })
steve_photo_4.save

batman = User.new({
  username: "BruceWayne",
  password: "password"})
batman.save

batman_photo_2 = batman.photos.new({
  img_url: "https://www.filepicker.io/api/file/jg7ybOBPTWOSArSMCKqy",
  caption: "Sunset at the docks"
  })
batman_photo_2.save

batman_photo_3 = batman.photos.new({
  img_url: "https://www.filepicker.io/api/file/xw58h9UrRXKZpOk6sJDw",
  caption: "Cold sunset over the lake"
  })
batman_photo_3.save

tony = User.new({
  username: "Tony Stark",
  password: "password"
  })
tony.save

tony_photo_1 = tony.photos.new({
  img_url: "https://www.filepicker.io/api/file/WLqFvhCCS4Kt7n5xAuMc",
  caption: "Out for a drive"
  })
tony_photo_1.save

tony_photo_2 = tony.photos.new({
  img_url: "https://www.filepicker.io/api/file/L18FLdRQEqt06Al37emg",
  caption: "Nothing beats the sunset and the palm trees"
  })
tony_photo_2.save

tony_photo_3 = tony.photos.new({
  img_url: "https://www.filepicker.io/api/file/AC33CgEhRv6xsPVQ2rC2",
  caption: "Racing around the sunset strip"
  })
tony_photo_3.save


bruce_follow_steve = bruce.follows.new({
  follower_id: bruce.id,
  follow_id: steve.id
  })
bruce_follow_steve.save

bruce_follow_tony = bruce.follows.new({
  follower_id: bruce.id,
  follow_id: tony.id
  })
bruce_follow_tony.save

barry_follow_steve = barry.follows.new({
  follower_id: barry.id,
  follow_id: steve.id
  })
barry_follow_steve.save

barry_follow_bruce = barry.follows.new({
  follower_id: barry.id,
  follow_id: bruce.id
  })
barry_follow_bruce.save

steve_follow_bruce = steve.follows.new({
  follower_id: steve.id,
  follow_id: bruce.id
  })
steve_follow_bruce.save

steve_follow_barry = steve.follows.new({
  follower_id: steve.id,
  follow_id: barry.id
  })
steve_follow_barry.save

steve_follow_batman = steve.follows.new({
  follower_id: steve.id,
  follow_id: batman.id
  })
steve_follow_batman.save

steve_photo_1_comment = steve.photos.first.comments.new({
  author_id: bruce.id,
  photo_id: steve_photo_1.id,
  body: "Great sunset"
  })
steve_photo_1_comment.save

steve_photo_1_comment2 = steve.photos.first.comments.new({
  author_id: barry.id,
  photo_id: steve_photo_1.id,
  body: "Nice lighting"
  })
steve_photo_1_comment2.save

tony_photo_last_comment = tony.photos.last.comments.new({
  author_id: steve.id,
  photo_id: tony_photo_3,
  body: "Slow down there, Stark"
  })
tony_photo_last_comment.save

tony_photo_last_comment2 = tony.photos.last.comments.new({
  author_id: barry.id,
  photo_id: tony_photo_3,
  body: "Not fast enough"
  })
tony_photo_last_comment2.save
