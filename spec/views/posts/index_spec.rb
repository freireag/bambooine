require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/posts/index.html.haml" do
  include PostsHelper
  
  before(:each) do
    post_98 = mock_model(Post)
    post_98.should_receive(:title).and_return("MyString")
    post_98.should_receive(:body).and_return("MyText")
    post_99 = mock_model(Post)
    post_99.should_receive(:title).and_return("MyString")
    post_99.should_receive(:body).and_return("MyText")

    assigns[:posts] = [post_98, post_99]

    template.stub!(:object_url).and_return(post_path(@post)) 
    template.stub!(:new_object_url).and_return(new_post_path) 
    template.stub!(:edit_object_url).and_return(edit_post_path(@post)) 
  end

  it "should render list of posts" do
    render "/posts/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

