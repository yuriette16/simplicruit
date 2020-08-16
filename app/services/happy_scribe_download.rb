class HappyScribeDownload
  include HTTParty

  def transcript_export(export_id)
    p api = "https://www.happyscribe.co/api/v1/exports/#{export_id}"
    response = HTTParty.get(api, headers: headers)
    JSON.parse(response.to_json)
  end

  private

  def headers
    {
      'Authorization' => "Bearer #{ENV['API_HAPPYSCRIBE']}"
    }
  end

end
