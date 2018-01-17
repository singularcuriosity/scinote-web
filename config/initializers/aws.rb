if ENV['AWS_ACCESS_KEY_ID'] then
  Aws.config.update({
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    endpoint: "http://#{ENV['S3_HOST_NAME']}",
    region: 'us-east-1',
    force_path_style: true,
    signature_version: "v4"
  })

  S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
end
