json.array!(@raw_channels) do |raw_channel|
  json.extract! raw_channel, :channel_name, :xmltv_id
  json.url raw_channel_url(raw_channel, format: :json)
end
