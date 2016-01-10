class EventsController < ApplicationController
  def new
    @event = Event.new
    render :new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_url(@event.event_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])

    render :edit
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_url(@event.event_id)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    Event.destroy(@event)

    redirect_to root_url
  end

  private
  def event_params
    params.require(:event).permit(:name, :date)
  end
end
