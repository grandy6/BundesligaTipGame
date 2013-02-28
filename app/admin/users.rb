ActiveAdmin.register User do
  index do
    column :id
    column :username
    column :firstname
    column :lastname
    column :email
    column "user" do |user|
      user.has_role?("user") ? "&#10003;".html_safe : "&#10005;".html_safe
    end
    column "admin" do |user|
      user.has_role?("admin") ? "&#10003;".html_safe : "&#10005;".html_safe
    end
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
