class InvitationsController < ApplicationController
  before_action :set_project
  before_action :set_invitation, only: [:accept, :reject, :show]

  def create
    user ||= User.find_by_username(invitation_params[:user])
    user ||= User.find_by_email(invitation_params[:email])

    redirect_to project_path(@project), notice: "That user does not exist." and return if user.nil?
    redirect_to project_path(@project), notice: "#{user.username} has already joined #{@project.name}" and return if @project.users.include? user
    redirect_to project_path(@project), notice: "#{user.username} already has a pending invitation." and return if user.has_invite_to_project? @project

    invite = Invite.new user: user,
                            sender: @current_user,
                            project: @project

    if invite.save
      redirect_to :back, notice: "Invitation sent."
    else
      redirect_to :back, notice: "Failed to send invitation. Try again later."
    end
  end

  def accept
    @invitation.accept!
    redirect_to project_path(@project)
  end

  def reject
    user.invites.pending.each do |invite|
      invite.reject! if invite.project == @project
    end

    redirect_to project_path(@project)
  end

  def new
    @invitation = Invite.new
  end

  private
  def invitation_params
    params.require(:invite).permit(:user,:email, :project)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_invitation
    @invitation = Invite.find(params[:id])
  end
end
