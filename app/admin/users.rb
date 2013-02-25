ActiveAdmin.register User do
  index do
    column :id
    column :username
    column :firstname
    column :lastname
    column :email
    column :created_at
    column :updated_at
    default_actions
  end
end
