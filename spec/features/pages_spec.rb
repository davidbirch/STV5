require 'spec_helper'

# Useful reference links
# https://github.com/jnicklas/capybara
# https://gist.github.com/428105

# Note: the FQDN tests do not go through the web server becuase the use
# rack_test instead of selenium/firefox or selenium/chrome (DB 16/11)
  
describe "Pages" do
  
  include AuthHelper
  include SiteVariablesHelper 
    
  describe "site" do
    it "should exist" do
      visit root_path
      page.status_code.should be(200)  
    end 
  end
    
  describe "fully qualified desktop site" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_desktop_subdomain"]
      page.status_code.should be(200)
    end 
  end
  
  describe "fully qualified mobile site" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      page.status_code.should be(200)  
    end 
  end
    
  describe "contact page" do
    it "should exist" do
      visit root_path
      within(:css, 'div.left_content'){
        click_link('Contact')
        }
      page.status_code.should be(200)  
    end 
  end
  
  describe "privacy page" do
    it "should exist" do
      visit root_path
      within(:css, 'div.left_content'){
        click_link('Privacy')
        }
      page.status_code.should be(200)  
    end 
  end
  
  describe "dashboard page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Dashboard"
      page.status_code.should be(200)  
    end
    
    it "should not exist when unauthenticated" do
      visit "/Dashboard"
      page.status_code.should be(401)  
    end    
  end
  
  describe "login page" do
    it "should exist when authenticated" do
      http_feature_login
      visit "/Login"
      page.status_code.should be(200)  
    end
    
    it "should not exist when unauthenticated" do
      visit "/Login"
      page.status_code.should be(401)  
    end    
  end
  
  describe "favicon.ico" do
    it "should exist" do
      visit "/favicon.ico"
      page.status_code.should be(200)  
    end 
  end
  
  describe "favicon.png" do
    it "should exist" do
      visit "/favicon.png"
      page.status_code.should be(200)  
    end 
  end
  
  describe "robots.txt" do
    it "should exist" do
      visit "/robots.txt"
      page.status_code.should be(200)  
    end 
  end
  
  describe "sitemap.xml" do
    it "should exist" do
      visit "/sitemap.xml"
      page.status_code.should be(200)  
    end 
  end
    
end