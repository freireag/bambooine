require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/new.html.haml" do
  include PostsHelper
  
  before(:each) do
    @post = mock_model(Post)
    @post.stub!(:new_record?).and_return(true)
    @post.stub!(:title).and_return("MyString")
    @post.stub!(:body).and_return("MyText")
    assigns[:post] = @post


    template.stub!(:object_url).and_return(post_path(@post)) 
    template.stub!(:collection_url).and_return(posts_path) 
  end

  it "should render new form" do
    render "/posts/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", posts_path) do
      with_tag("input#post_title[name=?]", "post[title]")
      with_tag("textarea#post_body[name=?]", "post[body]")
    end
  end
end


