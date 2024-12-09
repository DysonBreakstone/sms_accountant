# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

namespace :api do
  desc "Grab response body from image upload"
  task :fetch_google_vision_response => :environment do
    if !ENV["OBJECT"] || !ENV["FILENAME"]
      puts "**** ERROR ****"
      puts "Correct usage: rails api:fetch_google_vision_response FILENAME={filename} OBJECT={object key}"
      puts "filename should treat 'app/' as the root directory e.g. spec/fixtures/images/filename.jpg"
      puts "    (replace {object key} with the object key of the image you're parsing)"
      return
    end

    filename = Rails.root.join(ENV["FILENAME"])
    object_key = "test/#{ENV["OBJECT"]}"

    success = DigitalOceanService.new.upload_receipt!(filename: filename, object_key: object_key)
    if !success.present?
      puts "RECEIPT FAILED TO UPLOAD - HERE'S THE INFO WE HAVE:"
      puts success
      return
    end

    response = VisionApiService.new.make_text_detection_http_call(object_key: object_key)

    if !response.present? || !response.status.to_s.starts_with?("2")
      puts "VISION API FAILED - HERE'S THE INFO WE HAVE:"
      puts response
      return
    end

    File.write("spec/fixtures/image_responses/#{ENV["OBJECT"]}.json", JSON.generate(response.body))
  end


end