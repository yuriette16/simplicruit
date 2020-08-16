require 'httparty'
require 'json'

class HappyScribe
  include HTTParty

  API_URI = 'https://www.happyscribe.co/api/v1/transcriptions'

  def video_transcript(link)
    response = HTTParty.post(API_URI, headers: headers, body: body(link))
    response.body
  end

  private

  def headers
    {
      'Authorization' => "Bearer  #{ENV['API_HAPPYSCRIBE']}",
      'Content-Type'  => 'application/json'
    }
  end

  def body(link)
    {
    "transcription": {
        "name": "Interview",
        "language": "en-GB",
        "tmp_url": "#{link}"
      }
    }.to_json
  end
end


