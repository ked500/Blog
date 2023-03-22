ActiveAdmin.register User do
  actions :all, :except => [:new]

  action_item :block, only: :show do
    link_to 'Block User', block_admin_user_path(resource), method: :put unless resource.banned
  end
  action_item :unblock, only: :show do
    link_to 'Unblock User', unblock_admin_user_path(resource), method: :put if resource.banned
  end

  member_action :block, method: :put do
    resource.update(banned: true)
    redirect_to resource_path(resource), notice: "User has been blocked."
  end

  member_action :unblock, method: :put do
    resource.update(banned: false)
    redirect_to resource_path(resource), notice: "User has been unbanned"
  end

  form partial: 'form'
  permit_params :email, :name, :created_at, :updated_at, :current_sign_in_at, :last_sign_in_ip,
                :current_sign_in_at, :last_sign_in_at, :confirmed_at, :locked_at
  filter :email
  filter :name
  filter :created_at
  filter :updated_at
  filter :confirmed_at
  filter :banned

  index do
    column :name
    column :email
    column :created_at
    column :updated_at
    column :current_sign_in_at
    column :last_sign_in_at
    column :confirmed_at
    column :locked_at
    column :banned
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :created_at
      row :updated_at
      row :current_sign_in_at
      row :last_sign_in_at
      row :confirmed_at
      row :locked_at
      row :banned
    end
  end

  # update do
  #   column :name
  # end
end
