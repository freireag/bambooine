require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/index.html.haml" do
  include CommentsHelper
  
  before(:each) do
    comment_98 = mock_model(Comment)
    comment_98.should_receive(:body).and_return("MyText")
    comment_99 = mock_model(Comment)
    comment_99.should_receive(:body).and_return("MyText")

    assigns[:comments] = [comment_98, comment_99]

    template.stub!(:object_url).and_return(comment_path(@comment)) 
    template.stub!(:new_object_url).and_return(new_comment_path) 
    template.stub!(:edit_object_url).and_return(edit_comment_path(@comment)) 
  end

  it "should render list of comments" do
    render "/comments/index.html.haml"
    response.should have_tag("tr>td", "MyText", 2)
  end
end

