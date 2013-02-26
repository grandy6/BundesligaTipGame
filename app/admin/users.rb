ActiveAdmin.register User do
  index do
    column :id
    column :username
    column :firstname
    column :lastname
    column :email
    default_actions
  end

  form do |f|
    f.inputs "User Details" do
        f.input :username
        f.input :email
        f.input :roles, :as => :check_boxes
    end
  f.buttons
  end
  
end
