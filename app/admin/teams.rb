ActiveAdmin.register Team do
  index do
    column :id
    column :name
    column :is_public
    column :points
  end
end
