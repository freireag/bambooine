class PostsController < ResourceController::Base
  def tag
    @tag = params[:id]
    @posts = Post.find_tagged_with(@tag, :order => "created_at")
    respond_to do |wants|
      wants.html
      wants.xml {render :xml => @posts.to_xml(:include => @tag)}
    end
  end
end
