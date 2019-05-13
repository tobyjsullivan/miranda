class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    puts 'creating invite'
    @invite = Invitation.create!(board_id: params[:board_id], inviter: current_user, expires: 7.days.from_now)
    puts "created #{@invite}"
    redirect_to action: 'index'
  end

  def index
    @invitations = current_user.invitations
  end

  private

  def create_params
    params.require(:board)
  end
end
