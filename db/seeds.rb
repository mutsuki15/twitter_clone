# frozen_string_literal: true

user1 = User.create(
  id: 100,
  email: 'test1@test.com',
  name: 'ちいかわ',
  phone_number: '09012341234',
  date_of_birth: '2017-05-01',
  password: 'password',
  provider: '',
  uid: '75deb91f-470c-41ce-91a7-04ca5926c1ba',
  custom_user_id: 'chiikawa',
  profile: 'ちょっぴり泣き虫だけど優しい性格',
  location: '二次元の森',
  web_site: 'chiikawa.com',
  confirmed_at: Time.zone.now
)

user1.avatar.attach(io: File.open('app/assets/images/chiikawa.png'), filename: 'chiikawa.png')
user1.header.attach(io: File.open('app/assets/images/chiikawa_header.png'), filename: 'chiikawa_header.png')
user1.save!

user2 = User.create(
  id: 101,
  email: 'test2@test.com',
  name: 'ハチワレ',
  phone_number: '09011112222',
  date_of_birth: '2020-05-01',
  password: 'password',
  provider: '',
  uid: '75asd91f-470f-41df-91b7-04ca5478c1ba',
  custom_user_id: 'hachiware',
  profile: 'ちいかわのともだち。明るくてポジティブ。',
  location: '二次元の森',
  web_site: 'hachiware.com',
  confirmed_at: Time.zone.now
)

user2.avatar.attach(io: File.open('app/assets/images/hachiware.png'), filename: 'hachiware.png')
user2.save!

user3 = User.create(
  id: 102,
  email: 'test3@test.com',
  name: 'うさぎ',
  phone_number: '09023456543',
  date_of_birth: '2019-01-22',
  password: 'password',
  provider: '',
  uid: '75ghj91f-470g-41fr-91g7-04ca9876c1ba',
  custom_user_id: 'usagi',
  profile: 'ちいかわのともだち。「ウラ」「ヤハ」など大声でよく叫ぶ。',
  location: '二次元の森',
  web_site: 'usagi.com',
  confirmed_at: Time.zone.now
)

user3.avatar.attach(io: File.open('app/assets/images/usagi.png'), filename: 'usagi.png')
user3.save!

user4 = User.create(
  id: 103,
  email: 'test4@test.com',
  name: 'モモンガ',
  phone_number: '09098765432',
  date_of_birth: '2024-05-03',
  password: 'password',
  provider: '',
  uid: '75ghj56f-478g-65fr-67g7-89ca9436c1ba',
  custom_user_id: 'momonga',
  profile: '常にかわいこぶっている。色んなことをおねだりする。',
  location: '二次元の森',
  web_site: 'momonga.com',
  confirmed_at: Time.zone.now
)

user4.avatar.attach(io: File.open('app/assets/images/momonga.png'), filename: 'momonga.png')
user4.save!

user1.following_user << user2
user1.following_user << user3
user1.save!

user2.following_user << user1
user2.save!

user3.following_user << user1
user3.save!

tweet1 = Tweet.new(
  user_id: '100',
  content: 'ヤーッ!!'
)
tweet1.save!

tweet2 = Tweet.new(
  user_id: '101',
  content: 'これってTwitterじゃん!!'
)
tweet2.save!

tweet3 = Tweet.new(
  user_id: '102',
  content: 'ハァ?'
)
tweet3.save!

tweet4 = Tweet.new(
  user_id: '100',
  content: 'ヤダーッ'
)
tweet4.save!

tweet5 = Tweet.new(
  user_id: '101',
  content: 'なんとかなれー!!'
)
tweet5.save!

tweet6 = Tweet.new(
  user_id: '102',
  content: 'ヤハ!!'
)
tweet6.save!

tweet7 = Tweet.new(
  user_id: '100',
  content: 'わァ...ぁ...'
)
tweet7.save!

tweet8 = Tweet.new(
  user_id: '101',
  content: '泣いちゃった!!!'
)
tweet8.save!

tweet9 = Tweet.new(
  user_id: '102',
  content: 'ウラ'
)
tweet9.save!

tweet10 = Tweet.new(
  user_id: '100',
  content: 'フッ'
)
tweet10.save!

tweet11 = Tweet.new(
  user_id: '101',
  content: '喜びがないー...'
)
tweet11.save!

tweet12 = Tweet.new(
  user_id: '102',
  content: 'フゥン...'
)
tweet12.save!

tweet13 = Tweet.new(
  user_id: '100',
  content: 'ンショ...ンショ...'
)
tweet13.save!

tweet14 = Tweet.new(
  user_id: '101',
  content: '泣いても涙が出ないや'
)
tweet14.save!

tweet15 = Tweet.new(
  user_id: '102',
  content: 'ヤァァァハァァァァァ!!'
)
tweet15.save!

tweet16 = Tweet.new(
  user_id: '103',
  content: 'ついにやったゾ!!'
)
tweet16.save!

tweet17 = Tweet.new(
  user_id: '103',
  content: 'おもいっきりかわいこぶってやる...'
)
tweet17.save!

tweet18 = Tweet.new(
  user_id: '103',
  content: '叱ってみろ'
)
tweet18.save!

tweet19 = Tweet.new(
  user_id: '103',
  content: '甘いものが食べたいんだよォー'
)
tweet19.save!

tweet20 = Tweet.new(
  user_id: '103',
  content: 'イーヤーヤダヤダ'
)
tweet20.save!

favorite1 = Favorite.new(
  user_id: 100,
  tweet_id: 2
)
favorite1.save!

retweet1 = Retweet.new(
  user_id: 100,
  tweet_id: 15
)
retweet1.save!

comment1 = Comment.new(
  user_id: 100,
  tweet_id: 5,
  content: 'ん!!'
)
comment1.save!
