class CommentsController < ActionController::Base
  include ApplicationHelper
  before_action :set_project, :set_asset
  before_action :set_comment, except: [:new, :index, :create]

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

  def preview
    render html: Comment.markdown(params[:preview_text]).html_safe
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_asset
    @asset = Asset.find(params[:asset_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
