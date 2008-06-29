require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.haml" do
  include CommentsHelper
  
  before(:each) do
    @comment = mock_model(Comment)
    @comment.stub!(:new_record?).and_return(true)
    @comment.stub!(:body).and_return("MyText")
    assigns[:comment] = @comment


    template.stub!(:object_url).and_return(comment_path(@comment)) 
    template.stub!(:collection_url).and_return(comments_path) 
  end

  it "should render new form" do
    render "/comments/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("textarea#comment_body[name=?]", "comment[body]")
    end
  end
end


