ActiveAdmin.register Book do


  index do
    column :title
    column :author
    column :image do |book|
      image_tag(book.image.url(:thumb))
    end
    actions
  end

  form :html => { :multipart=>true } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :author
      f.input :image, :as => :file
      f.actions do
        f.actions
      end
    end
  end

  controller do
    def permitted_params
      params.permit(:utf8, :authenticity_token, :commit, :locale, :book => [ :title, :author, :image])
    end
  end

end
