class Comment < ApplicationRecord
	belongs_to :user
	acts_as_votable
	belongs_to :commentable, polymorphic: true
	has_many   :comments, as: :commentable
end
