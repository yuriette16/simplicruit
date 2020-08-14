require "google/cloud/speech"
require "json"
# require "google/cloud/storage"

class SpeechToTextService
  def video_transcript(audio_link)
    project_id = "simplicuit-279115"
    key_file   = JSON.parse(ENV['GOOGLE_CLIENT_SECRET'])

    audio_file_path = audio_link
    speech = Google::Cloud::Speech.speech

    audio_file = File.binread audio_file_path
    config = { encoding:          :FLAC,
               language_code:     "en-US" }
    audio      = { content: audio_file }

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
