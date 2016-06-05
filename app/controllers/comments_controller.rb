class CommentsController < ApplicationController

  def create
    @application = Application.find(params[:comment][:application_id])
    if current_user != @application.user
      redirect_to user_applications_path(current_user)
    else
      @comment = Comment.new(comment_params)
      @comment.save
      render json: @comment, status: 201
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :application_id)
    end
end
