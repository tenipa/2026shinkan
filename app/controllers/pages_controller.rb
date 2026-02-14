class PagesController < ApplicationController
  def home
    @settings = {}
    SiteSetting.pluck(:key, :value).each do |key, value|
      @settings[key] = value
    end
    @events = Event.ordered
    @qa_items = QaItem.ordered
  end
end
