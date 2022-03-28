class Comment < ApplicationRecord
  belongs_to :user
  before_create :set_comment_number

  # for action Text from Rails
  has_rich_text :body

  # for polymorphic Comments                                # polymorphic means connect a model to multiple other models: belongs to user,post,comment models
  belongs_to :commentable, polymorphic: true                # a comment belongs to a POST or a COMMENT
  has_many :comments, as: :commentable, dependent: :destroy # a comment can have many other comments

  private
  def set_comment_number  # == number of posts user created
    self.comment_number = user.comment_created
  end
end
