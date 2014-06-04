class CommentsController < ActionController::Base
  before_action :set_project, :set_asset
  before_action :set_comment, except: [:new, :index]

  def create
    @comment = Comment.new comment_params
    @comment.asset = @asset
    @comment.commenter = current_user
    if @comment.save
      redirect_to project_asset_path(@project, @asset), notice: "Comment Added."
    else
      redirect_to project_asset_path(@project, @asset), notice: "Failed to save comment. Try again later."
    end
  end

  private
  def set_project
    @project = params[:project_id]
  end

  def set_asset
    @asset = params[:asset_id]
  end

  def set_comment
    @comment = params[:id]
  end
end
