class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_commentable, only: [:create]       
    before_action :set_comment, except: [:create]

    def create
        @comment = @commentable.comments.build(comment_params)
        @comment.user = current_user
        @comment.reply = true if params[:comment_id]
        @comment.save
    end

    def edit
    end

    def update
        if @comment.edit_history == ''      # default   # body is what we name our action text, and each action text has a body field
            @comment.edit_history = "Original: " + @comment.body.body.to_plain_text + "\n"
        else
            @comment.edit_history += "Edit: " + params[:comment][:body] + "\n"
        end                                     # what we are typing in the text area

        @comment.update(comment_params)
    end

    def destroy
        @comment.destroy
    end

    def history
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end

    def find_commentable
        if params[:comment_id]                                      # is a comment
            @commentable = Comment.find_by_id(params[:comment_id])
        elsif params[:post_id]                                      # is a post
            @commentable = Post.friendly.find(params[:post_id])
        end
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
end