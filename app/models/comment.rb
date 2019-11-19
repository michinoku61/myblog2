class Comment < ApplicationRecord
  belong_to :tweet
  belong_to :user
end
