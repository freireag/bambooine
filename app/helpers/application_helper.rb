# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tag_index
    items = Post.tag_counts.map do |tag|
      tag_item = content_tag(:li, link_to(tag.name, :controller => 'posts', :action => 'tag', :id => tag.name))
    end
    content_tag(:ul, items, :class => 'tags')
  end
end
