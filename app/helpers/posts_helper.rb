module PostsHelper
  def comments_string(post)
    number = post.comments.count
    if number == 0
      return "No comments"
    else
      return "#{number} #{number > 1 ? 'comments' : 'comment'}"
    end
  end
end
