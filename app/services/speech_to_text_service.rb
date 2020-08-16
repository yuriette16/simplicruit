require "google/cloud/speech"
require "json"

class SpeechToTextService
  def video_transcript(audio_link)
    project_id = "simplicuit-279115"
    key_file   = "../../google_key.json"

  require 'open-uri'
  url = 'audio_link'
  open(url) do |file|
    audio_file = file.binread
  end

    speech = Google::Cloud::Speech.speech

    config = { encoding:          :LINEAR16,
               sample_rate_hertz: 16000,
               language_code:     "en-US" }
    audio = { content: audio_file }

    operation = speech.long_running_recognize config: config, audio: audio

    puts "Operation started"

    operation.wait_until_done!

    raise operation.results.message if operation.error?

    results = operation.response.results

    transcript = []
    alternatives = results.first.alternatives
    alternatives.each do |alternative|
       transcript << alternative.transcript
    end
    return transcript
  end
end
