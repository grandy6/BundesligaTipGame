ActiveAdmin.register News do
  form do |f|
    f.inputs "News Details" do
      f.input :title
      f.input :content
      f.input :categories
    end
    f.buttons
  end
end
