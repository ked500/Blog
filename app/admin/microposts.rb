ActiveAdmin.register Micropost do
  permit_params :content, :user_id, :created_at, :updated_at

end
