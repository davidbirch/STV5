module SiteVariablesHelper
  def site_variables
    site_variables_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/site_variables.yml", __FILE__))
    site_variables_yaml[Rails.env]
  end
  
  def setup_request_host_for_mobile_site
    @request.host = site_variables["fully_qualified_mobile_subdomain"]
  end
  
  def setup_request_host_for_desktop_site
    @request.host = site_variables["fully_qualified_desktop_subdomain"]
  end
  
end
