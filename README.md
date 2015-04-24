# Instaset

[Heroku link][heroku]

[heroku]: https://instaset.herokuapp.com/

## Minimum Viable Product
Instaset is a clone of Instagram for sunsets built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Post a photo
- [x] Post a caption for their photo
- [x] View the photos that they posted
- [x] Like a photo
- [x] Comment on a photo
- [x] Follow other Instaset users
- [x] View photos of the users they follow



## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication and Session Management (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create an account
and sign into their account. The last part of this phase is pushing to Heroku to
finalize the initial setup of the app.

[Details][phase-one]

### Phase 2: Posting and Viewing Photos (~2 days)
I will create a photo resource and add an API route to serve photo data as JSON.
I will then add a backbone model and collection for photos, as well as views to
index, show, and add photos for a user. I will use the library Filepicker to
store the photos and provide an image url to the database. By the end of this
phase, users will be able to post photos to their account and view individual
photos.

[Details][phase-two]

### Phase 3:  User Follows(~1 day)
I will add a follows resource that joins the a following user to the user that
they are following. I will then add a backbone collection and model for follows.
From a 'FollowIndex' view, users will be able to see the photos of other users
they follow.

[Details][phase-three]

### Phase 4: Comments and Likes (~1 day)
I will add resources for Comments and Likes and include API routes to serve JSON
to backbone. I will then create models and collections for both and add 'Index'
views to the 'PhotoShow' CompositeView. By the end of this phase, users will be
able to like and comment on photos and view the users that like a photo.  

[Details][phase-four]


### Bonus Features (TBD)

- [x] Have a feed of photos
- [x] Have the feed feature recent photos from followers
- [ ] Tag other users in photos
- [ ] Stamp a time when the sunset occurred
- [ ] View a timeline of stamped photos

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
