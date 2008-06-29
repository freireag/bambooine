class CommentsController < ResourceController::Base
  belongs_to :post
  actions :create
  
  create.wants.html {redirect_to parent_object}
  create.failure.wants.html {redirect_to parent_object}
end
