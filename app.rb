require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end



get "/news" do
  ### Get the weather
  # Evanston, Kellogg Global Hub... replace with a different location if you want
  lat = 42.0574063
  long = -87.6722787

  units = "imperial" # or metric, whatever you like
  key = "33c63a8ef342b517c0769ed113adc64f" # replace this with your real OpenWeather API key

  # construct the URL to get the API data (https://openweathermap.org/api/one-call-api)
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"

  # make the call
  @forecast = HTTParty.get(url).parsed_response.to_hash

  @current_temperature = forecast["current.temp"] 
  @current_summary = forecast["current.weather.description"].downcase

  @forecast_daily = forecast["daily.temp"]

  ### Get the news
  url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=de148f7227c6442aa76cc69ddfcd82bc"
  news = HTTParty.get(url).parsed_response.to_hash
  # news is now a Hash you can pretty print (pp) and parse for your output

  @news_title_1 = news["articles"][0]["title"]
  @news_description_1 = news["articles"][0]["description"]
  @news_url_1 = news["articles"][0]["url"]
  
  @news_title_2 = news["articles"][1]["title"]
  @news_description_2 = news["articles"][1]["description"]
  @news_url_2 = news["articles"][1]["url"]

  @news_title_3 = news["articles"][2]["title"]
  @news_description_3 = news["articles"][2]["description"]
  @news_url_3 = news["articles"][2]["url"]

  @news_title_4 = news["articles"][3]["title"]
  @news_description_4 = news["articles"][3]["description"]
  @news_url_4 = news["articles"][3]["url"]
  
  @news_title_5 = news["articles"][4]["title"]
  @news_description_5 = news["articles"][4]["description"]
  @news_url_5 = news["articles"][4]["url"]

  view "news"


end
