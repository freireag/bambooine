require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.haml" do
  include CommentsHelper
  
  before do
    @comment = mock_model(Comment)
    @comment.stub!(:body).and_return("MyText")
    assigns[:comment] = @comment

    template.should_receive(:object_url).twice.and_return(comment_path(@comment)) 
    template.should_receive(:collection_url).and_return(comments_path) 
  end

  it "should render edit form" do
    render "/comments/edit.html.haml"
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('textarea#comment_body[name=?]', "comment[body]")
    end
  end
end


