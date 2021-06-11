module PicturesHelper
    def choose_new_or_edit
        if action_name == 'new' || action_name == 'create'
          confirm_pictures_path
    
        elsif action_name == 'edit' || action_name == 'update'
          confirm_picture_path(@picture.id)
        end
    end
    
    def confirm_new_or_edit
      unless @picture.id?
          pictures_path
      else
          picture_path(@picture)
      end
    end
    
    def confirm_form_method
      @picture.id ? 'patch' : 'post'
    end
end
