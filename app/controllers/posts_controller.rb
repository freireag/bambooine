class PostsController < ResourceController::Base
  
  index.wants.atom
  
  def tag
    @tag = params[:id]
    @posts = Post.find_tagged_with(@tag, :order => "created_at")
    respond_to do |wants|
      wants.html
      wants.xml {render :xml => @posts.to_xml(:include => @tag)}
    end
  end
  
  private
  def collection
    @collection ||= end_of_association_chain.search(params[:search])
  end
end
