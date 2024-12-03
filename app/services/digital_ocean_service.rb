class DigitalOceanService
  CLIENT = Aws::S3::Client.new(
    access_key_id: ENV['RECEIPTS_ACCESS_KEY'],
    secret_access_key: ENV['RECEIPTS_SECRET_KEY'],
    endpoint: ENV['RECEIPTS_ORIGIN_ENDPOINT'],
    force_path_style: true, 
    region: ENV['RECEIPTS_REGION']
  )

  def list_buckets
    resp = CLIENT.list_buckets
    resp.buckets.map(&:name)
  end

  def list_objects(bucket:)
    CLIENT.list_objects_v2(bucket: bucket).contents
  end

  def upload_receipt!(filename:, object_key:)
    File.open(filename, "rb") do |file|
      CLIENT.put_object({
        body: file,
        bucket: "cashyou-receipts",
        key: object_key,
        metadata: {
          "updload_date"=>Date.today.to_s
        },
        content_type: "image/jpg"
      })
    end
  end

  def delete_receipt(keys:)
    keys = Array(keys)
    resp = CLIENT.delete_objects({
      bucket: "cashyou-receipts",
      delete: {
        objects: keys.map{ |key| {key: key}},
        quiet: false
      },
    })
    resp
  end
end