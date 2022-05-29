class HomeController < ApplicationController
  def index
    @weather_data = GetCurrentWeatherService.new.call
  end
end
