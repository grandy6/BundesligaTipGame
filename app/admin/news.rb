ActiveAdmin.register News do
  form do |f|
    f.inputs "News Details" do
      f.input :title
      f.input :content
      f.input :categories
    end
    f.buttons
  end

  controller do
    def create
      @news = News.new(params[:news])
      @news.user_id = current_user.id

      respond_to do |format|
        if @news.save
          format.html { redirect_to "/admin/news/" + @news.id.to_s, notice: 'News was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end
  end
end
