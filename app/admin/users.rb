ActiveAdmin.register User do
  actions :all, :except => [:new]
  form partial: 'form'
  permit_params :email, :name, :created_at, :updated_at, :current_sign_in_at, :last_sign_in_ip,
                :current_sign_in_at, :last_sign_in_at, :confirmed_at, :locked_at
  filter :email
  filter :name
  filter :created_at
  filter :updated_at
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :current_sign_in_ip
  filter :last_sign_in_ip
  filter :confirmed_at
  filter :locked_at

  index do
    column :name
    column :email
    column :created_at
    column :updated_at
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :confirmed_at
    column :locked_at
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
    row :current_sign_in_ip
    row :last_sign_in_ip
    row :confirmed_at
    row :locked_at
    end
  end

  # update do
  #   column :name
  # end
end
