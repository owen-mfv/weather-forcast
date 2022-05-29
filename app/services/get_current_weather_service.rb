class GetCurrentWeatherService
  attr_reader :location

  def initialize(location = "Ho Chi Minh City")
    @location = location
  end

  def call
    faraday_connection.get("/current.json") do |request|
      request.params["q"] = location
    end
  end

  def faraday_connection
    Faraday.new(
      url: ENV["RAPID_API_HOST"],
      headers: {
        "X-RapidAPI-Host" => "weatherapi-com.p.rapidapi.com",
        "X-RapidAPI-Key" => ENV["RAPID_API_KEY"] }
    ) do |f|
      f.response :json
    end
  end
end
