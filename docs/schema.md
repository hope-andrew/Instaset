# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
usersname       | integer   | not null, unique
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique

## photos
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
user_id         | integer   | not null, foreign key (references users)
image_url       | string    | not null
caption         | string    | not null

## comments
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null
author_id       | integer   | not null, foreign key (references users)
photo_id        | integer   | not null, foreign key (references photos)
body            | string    | not null

## likes
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null
liker_id        | integer   | not null, foreign key (references users)
photo_id        | integer   | not null, foreign key (references photos)

## follows
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null
follower_id     | integer   | not null, foreign key (references users)
followee_id     | integer   | not null, foreign key (references users)
