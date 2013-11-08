json.array!(@programs) do |program|
  json.extract! program, :title, :subtitle, :region_id, :sport_id, :channel_id, :category, :description, :start_datetime, :end_datetime
  json.url program_url(program, format: :json)
end
