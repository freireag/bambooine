require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.haml" do
  include CommentsHelper
  
  before(:each) do
    @comment = mock_model(Comment)
    @comment.stub!(:body).and_return("MyText")

    assigns[:comment] = @comment

    template.stub!(:edit_object_url).and_return(edit_comment_path(@comment)) 
    template.stub!(:collection_url).and_return(comments_path) 
  end

  it "should render attributes in <p>" do
    render "/comments/show.html.haml"
    response.should have_text(/MyText/)
  end
end

