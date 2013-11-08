json.array!(@raw_programs) do |raw_program|
  json.extract! raw_program, :title, :subtitle, :category, :description, :start_datetime, :end_datetime, :region_name, :channel_xmltv_id
  json.url raw_program_url(raw_program, format: :json)
end
