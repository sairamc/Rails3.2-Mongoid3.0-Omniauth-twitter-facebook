Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, KEY, SECRET
  provider :facebook, KEY, SECRET,
  		   :scope => 'email,read_friendlists,user_birthday,publish_actions,user_actions.music,read_stream', 
  		   :display => 'popup', :secure_image_url => true
end

