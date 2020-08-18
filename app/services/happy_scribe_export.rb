class HappyScribeExport
  include HTTParty

  API_URI = 'https://www.happyscribe.co/api/v1/exports'

  def transcript_export(transcript_id)
    response = HTTParty.post(API_URI, headers: headers, body: body(transcript_id))
    response.body
  end

  private

  def headers
    {
      'Authorization' => "Bearer #{ENV['API_HAPPYSCRIBE']}",
      'Content-Type'  => 'application/json'
    }
  end

  def body(transcript_id)
    {
      "export": {
      "format": "txt",
      "transcription_ids": [
        "#{transcript_id}"
      ]}
    }.to_json
  end
end
