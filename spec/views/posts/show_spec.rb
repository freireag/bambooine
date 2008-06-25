require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/show.html.haml" do
  include PostsHelper
  
  before(:each) do
    @post = mock_model(Post)
    @post.stub!(:title).and_return("MyString")
    @post.stub!(:body).and_return("MyText")

    assigns[:post] = @post

    template.stub!(:edit_object_url).and_return(edit_post_path(@post)) 
    template.stub!(:collection_url).and_return(posts_path) 
  end

  it "should render attributes in <p>" do
    render "/posts/show.html.haml"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

