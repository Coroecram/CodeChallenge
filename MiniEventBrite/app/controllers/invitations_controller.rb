class InvitationsController < ApplicationController

  def new
  @invitation = Invitation.new
    render :new
  end

  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      redirect_to event_url(@invitation.event_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @invitation = Invitation.find(params[:id])

    render :edit
  end

  def update
    @invitation = Invitation.find(params[:id])

    if @invitation.update(invitation_params)
      redirect_to event_url(@invitation.event_id)
    else
      render :edit
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])
    Inviation.destroy(@invitation)

    redirect_to root_url
  end

  private
  def invitation_params
    params.require(:invite).permit(:event_id, :person_id)
  end

end
