# Phase 2: Adding and Viewing Photos

## Rails
### Models
* Photo

### Controllers
PhotosController (create, new, show)
Api::PostsController (create, destroy, show, update)

### Views
* photos/show.json.jbuilder

## Backbone
### Models
* Photo

### Collections
* Photos

### Views
* PhotoForm
* PhotoIndex (composite view, contains PostsIndexItem subviews)
* PhotoIndexItem
* PhotoShow


## Gems/Libraries
FilePicker
