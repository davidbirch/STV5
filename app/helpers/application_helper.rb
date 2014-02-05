module ApplicationHelper
  
  def logged_in?
    not request.authorization.nil?
  end
  
  def title(title = nil)
    #log = Logger.new(File.expand_path("#{Rails.root}/log/application_helper.log", __FILE__))
    #log.info("#{site_variables.inspect}")
    
    if title.present?
      title
    elsif @title.present?
      @title
    else
      site_variables["default_title"]
    end
  end
  
  def mobile_title(mobile_title = nil)
    if mobile_title.present?
      mobile_title
    elsif @mobile_title.present?
      @mobile_title
    else
      site_variables["default_mobile_title"]
    end
  end
  
  def fully_qualified_desktop_subdomain(fully_qualified_desktop_subdomain = nil)
    if fully_qualified_desktop_subdomain.present?
      fully_qualified_desktop_subdomain
    elsif @fully_qualified_desktop_subdomain.present?
      @fully_qualified_desktop_subdomain
    else
      site_variables["fully_qualified_desktop_subdomain"]
    end
  end
  
  def fully_qualified_mobile_subdomain(fully_qualified_mobile_subdomain = nil)
    if fully_qualified_mobile_subdomain.present?
      fully_qualified_mobile_subdomain
    elsif @fully_qualified_mobile_subdomain.present?
      @fully_qualified_mobile_subdomain
    else
      site_variables["fully_qualified_mobile_subdomain"]
    end
  end
  
  def meta_author(meta_author = nil)
    if meta_author.present?
      meta_author
    elsif @meta_author.present?
      @meta_author
    else
      site_variables["default_meta_author"]
    end
  end
  
  def meta_keywords(meta_keywords = nil)
    if meta_keywords.present?
      meta_keywords
    elsif @meta_keywords.present?
      @meta_keywords
    else
      site_variables["default_meta_keywords"]
    end
  end
  
  def meta_description(meta_description = nil)
    if meta_description.present?
      meta_description
    elsif @meta_description.present?
      @meta_description
    else
      site_variables["default_meta_description"]
    end
  end
  
  def google_analytics_account(google_analytics_account = nil)
    if google_analytics_account.present?
      google_analytics_account
    elsif @google_analytics_account.present?
      @google_analytics_account
    else
      site_variables["google_analytics_account"]
    end
  end
  
  def google_analytics_domain_name(google_analytics_domain_name = nil)
    if google_analytics_domain_name.present?
      google_analytics_domain_name
    elsif @google_analytics_domain_name.present?
      @google_analytics_domain_name
    else
      site_variables["google_analytics_domain_name"]
    end
  end
  
  def website_url_formatted_name(website_url_formatted_name = nil)
    if website_url_formatted_name.present?
      website_url_formatted_name
    elsif @website_url_formatted_name.present?
      @website_url_formatted_name
    else
      site_variables["website_url_formatted_name"]
    end
  end
  
  def website_plain_english_formatted_name(website_plain_english_formatted_name = nil)
    if website_plain_english_formatted_name.present?
      website_plain_english_formatted_name
    elsif @website_plain_english_formatted_name.present?
      @website_plain_english_formatted_name
    else
      site_variables["website_plain_english_formatted_name"]
    end
  end
  
  def website_contact_email(website_contact_email = nil)
    if website_contact_email.present?
      website_contact_email
    elsif @website_contact_email.present?
      @website_contact_email
    else
      site_variables["website_contact_email"]
    end
  end  
   
  def region_touch_icon_extension(region_touch_icon_extension = nil)
    if region_touch_icon_extension.present?
      region_touch_icon_extension
    elsif @region_touch_icon_extension.present?
      @region_touch_icon_extension
    else
      site_variables["default_region_touch_icon_extension"]
    end
  end
    
  private
  
    def site_variables
      site_variables_yaml = YAML.load_file(File.expand_path("#{Rails.root}/config/site_variables.yml", __FILE__))
      site_variables_yaml[Rails.env]
    end
    
end