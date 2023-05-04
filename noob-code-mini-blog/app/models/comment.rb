class Comment < ApplicationRecord
  include CommentQuery

  belongs_to :post
end
