module Admin
  class ImagesController < Admin::BaseController
    before_action :set_event, only: [:destroy]

    def create
      add_more_images(images_params[:images])
      flash[:error] = "Failed uploading images" unless @event.save
      redirect_to :back
    end

    def destroy
      remove_image_at_index(params[:id].to_i)
      flash[:error] = "Failed deleting image" unless @event.save
      redirect_to :back
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def add_more_images(new_images)
      images = @event.images
      images += new_images
      @event.images = images
    end

    def remove_image_at_index(index)
      remain_images = @event.images
      deleted_image = remain_images.delete_at(index)
      deleted_image.try(:remove!)
      @event.images = remain_images
    end

    def images_params
      params.require(:event).permit({images: []})
    end
  end
end
