module Admin
  class EventsController < ApplicationController
    include AdminAuthenticatable
    layout "admin"

    before_action :set_event, only: %i[edit update destroy]

    def index
      @events = Event.ordered
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to admin_events_path, notice: "イベントを作成しました"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @event.update(event_params)
        redirect_to admin_events_path, notice: "イベントを更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path, notice: "イベントを削除しました"
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :month, :description, :position)
    end
  end
end
