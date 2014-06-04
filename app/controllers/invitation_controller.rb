class InvitationController < ApplicationController
  def create
    user ||= User.find_by_username(invitation_params[:user])
    user ||= User.find(:user)
    user ||= User.find_by_email(:email)

    redirect_to :back, notice: "#{user.username} does not exist." if user.nil?
    redirect_to :back, notice: "#{user.username} has already joined #{@project.name}" if @project.users.include? user
    redirect_to :back, notice: "#{user.username} already has a pending invitation." if user.has_invite_to_project? project

    invite = Invitation.new user: user,
                            sender: @current_user,
                            project: @project

    if invite.save
      redirect_to :back, notice: "Invitation sent."
    else
      redirect_to :back, notice: "Failed to send invitation. Try again later."
    end
  end

  def accept
    user.invites.pending.each do |invite|
      invite.accept! if invite.project == @project
    end

    redirect_to project_path(@project)
  end

  def reject
    user.invites.pending.each do |invite|
      invite.reject! if invite.project == @project
    end

    redirect_to project_path(@project)
  end

  private
  def invitation_params
    params.require(:invite).permit(:user,:email, :project)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_invitation
    @invitation = Invitation.find()
  end
end
