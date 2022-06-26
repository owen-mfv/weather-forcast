class HomeController < ApplicationController
  def index
    # call API
    @weather_data = GetCurrentWeatherService.new.call
  end
end
