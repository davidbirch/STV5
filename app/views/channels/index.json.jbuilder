json.array!(@channels) do |channel|
  json.extract! channel, :name, :short_name, :free_or_pay, :xmltv_id, :black_flag
  json.url channel_url(channel, format: :json)
end
