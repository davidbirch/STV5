module SiteVariablesHelper
  def site_variables
    site_variables_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/site_variables.yml", __FILE__))
    site_variables_yaml[Rails.env]
  end
end
