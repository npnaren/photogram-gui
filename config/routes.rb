Rails.application.routes.draw do

  get('/', { :controller => "users", :action => "user_page" })
  get('/users', { :controller => "users", :action => "user_page" })
  post('/add_user', { :controller => "users", :action => "add_user" })
  get('/users/:user_name', { :controller => "users", :action => "user_details" })
  post('/update_user/:user_name', { :controller => "users", :action => "update_user" })

  get('/photos', { :controller => "photos", :action => "photo_page" })
  post('/insert_photo_record', { :controller => "photos", :action => "add_photo" })
  get('/photos/:photo_id', { :controller => "photos", :action => "photo_details" })
  post('/update_photo/:photo_id', { :controller => "photos", :action => "update_photo" })
  get('/delete_photo/:photo_id', { :controller => "photos", :action => "delete_photo" })
  post('/add_comment', { :controller => "photos", :action => "add_comment" })
end
