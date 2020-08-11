require "google/cloud/speech"
# require "google/cloud/storage"

class SpeechToTextService
  def video_transcript(audio_link)
    project_id = "simplicuit-279115"
    key_file   = "simplicuit-279115-3997341e3a42.json"

    # # # Conver video to audio
    # system "ffmpeg -i video.mp4 audio.flac"

    # # # # Upload audio to Google Storage
    # storage = Google::Cloud::Storage.new project: project_id, keyfile: key_file
    # bucket_name = storage.buckets.first.name
    # puts bucket_name
    # bucket = storage.bucket bucket_name
    # local_file_path = 'aduio.flac'
    # file = bucket.create_file local_file_path, 'audio_cloud.flac'
    # puts "Uploaded #{file.name}"

    # Translate audio to text

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

