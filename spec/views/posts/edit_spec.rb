require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/edit.html.haml" do
  include PostsHelper
  
  before do
    @post = mock_model(Post)
    @post.stub!(:title).and_return("MyString")
    @post.stub!(:body).and_return("MyText")
    assigns[:post] = @post

    template.should_receive(:object_url).twice.and_return(post_path(@post)) 
    template.should_receive(:collection_url).and_return(posts_path) 
  end

  it "should render edit form" do
    render "/posts/edit.html.haml"
    
    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('input#post_title[name=?]', "post[title]")
      with_tag('textarea#post_body[name=?]', "post[body]")
    end
  end
end


