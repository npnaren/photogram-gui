class PhotosController < ApplicationController
  def photo_page
    @photos = Photo.all
    render({ :template => "templates/photo_page" })
  end
  def add_photo
    new_photo = Photo.new
    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")
    new_photo.save
    
    redirect_to("/photos/"+ new_photo.id.to_s)
  end
  def photo_details
    photo_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => photo_id }).at(0)
    @all_comments = @photo.comments.order(created_at: :desc)

    render({ :template => "templates/photo_details" })
  end
  def update_photo 
    photo_id = params.fetch("photo_id")
    photo = Photo.where({ :id => photo_id }).at(0)
    photo.image = params.fetch("input_image")
    photo.caption = params.fetch("input_caption")
    photo.save

    redirect_to("/photos/"+ photo.id.to_s)
  end   
  def delete_photo
    photo_id = params.fetch("photo_id")
    photo = Photo.where({ :id => photo_id }).at(0)
    photo.destroy

    redirect_to("/photos")
  end
  def add_comment
    photo_id = params.fetch("input_photo_id")
    photo = Photo.where({ :id => photo_id }).at(0)
    new_comment = Comment.new
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.body = params.fetch("input_comment")
    new_comment.photo_id = photo_id
    new_comment.save
    photo.save

    redirect_to("/photos/" + photo.id.to_s)
  end
end
