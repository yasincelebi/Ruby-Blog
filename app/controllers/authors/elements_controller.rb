module Authors
  class ElementsController < AuthorsController
    before_action :set_post
    before_action :set_element, only: %i[ update destroy ]
   



    # POST /elements or /elements.json
    def create
      @element = @post.elements.build(element_params)
        if @element.save
          notice = nil
        else
          notice = @element.errors.full_messages.join('. ') << '.'
        end
        redirect_to edit_post_path(@post), notice: notice
      end
    

    # İki saatimi aldı
    def update
      if @element.update(element_params)
        redirect_to edit_post_path(@post), notice: 'Element was successfully updated'
      else
        render :edit, notice: 'Failed to update element'
      end
    end

    # DELETE /elements/1 or /elements/1.json
    def destroy
      if(@element.destroy)
        redirect_to edit_post_path(@post), notice: 'Element was successfully destroyed'
      else
        render :edit, 'Element could not be destroyed'
      end
    end

    private

      def set_post
        @post = current_author.posts.find(params[:post_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = @post.elements.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def element_params
        params.require(:element).permit(:element_type, :content, :image)
      end
  end
end