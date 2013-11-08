json.array!(@sport_keywords) do |sport_keyword|
  json.extract! sport_keyword, :rule_type, :value, :sport_id, :priority
  json.url sport_keyword_url(sport_keyword, format: :json)
end
