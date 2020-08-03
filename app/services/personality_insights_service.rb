require 'excon'

class PersonalityInsightsService
  # Send a profile request to Personality
  def profile(data)
    # Request the profile
    token = Base64.strict_encode64("apikey:#{ENV['API_PERSONALITY_INSIGHTS']}")
    response = Excon.post("https://api.us-south.personality-insights.watson.cloud.ibm.com/v3/profile?version=2017-10-13",
                        :body     => data,
                        :headers  => {
                          "Authorization": "Basic #{token}",
                          "Content-Type" => "text/plain;charset=UTF-8",
                          "Accept" => "application/json"
                        })

    response.body
  end
end
