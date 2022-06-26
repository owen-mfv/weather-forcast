This is a gem `vcr` demo app. The app shows current weather of Ho Chi Minh city when you access the root path.

<img width="1773" alt="Screen Shot 2022-06-13 at 08 44 46" src="https://user-images.githubusercontent.com/89366794/173265013-f9443bc6-8dc8-4082-92f5-c4b956f84ca2.png">

# Setup guide

1. You need an API key of WeatherAPI.com. Please create an account and subscribe to this API: https://rapidapi.com/weatherapi/api/weatherapi-com/. Don't worry, it has free plan 😁.

2. Copy API key and set it to `ENV["RAPID_API_KEY"]`. For this app, we only use the Realtime Weather API from WeatherAPI.com
<img width="1779" alt="Screen Shot 2022-06-26 at 23 40 30" src="https://user-images.githubusercontent.com/89366794/175824799-890eb07e-0bb1-4148-bbe4-4f23ad4756fd.png">

3. Start rails server

4. Access root path.

# Demo guide

If you read the code from the `HomeController`, you will know that every single time you load the root page, the app call API to get the weather data. In testing, I use `vcr` gem to record the API request & response to a cassete file. You will code a real HTTP request for the first request for the recording purpose. After then you can disconnect your internet connection and your test still run smoothly since `vcr` replaying the record file.

1. First, run the test to make sure everything works fine: `bundle exec rspec`
2. Then try to disable/disconnect your internet connection and run the test again. It should still pass because `vcr` would replaying the record file.
3. Go to this file: `spec/requests/home_spec.rb` and:
  * Change value of `skip` option to `true` for context "when using gem `vcr`" 
  * Change value of `skip` option to `false` for context "when not using gem `vcr`"
4. Run the test again. This time the test should fail and raise error like the picture below. This error will occur when you try to have a real HTTP to outside without "notifying" `vcr`. You need to put the code that occur HTTP request in the `VCR.use_cassette` block.
<img width="866" alt="Screen Shot 2022-06-27 at 00 08 24" src="https://user-images.githubusercontent.com/89366794/175825705-f389581f-704a-4534-baea-76f54f77bfd3.png">
