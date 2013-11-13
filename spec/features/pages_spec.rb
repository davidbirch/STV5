require 'spec_helper'

# Useful reference links
# https://github.com/jnicklas/capybara
# https://gist.github.com/428105

describe "Pages" do
  
  include AuthHelper
  include SiteVariablesHelper 
    
  describe "site" do
    it "should exist" do
      visit root_path
      page.status_code.should be(200)  
    end 
  end
  
  # ** cannot be implemented at this time because the Capybara driver cannot be
  # ** changed from rack_test to selenium/firefox or selenium/chrome
  # ** if this issue could be fixed these tests can be used
  #
  #
  #
  #describe "fully qualified desktop site", :js => true do
  #  it "should exist" do
  #    visit "http://"+site_variables["fully_qualified_desktop_subdomain"]
  #    page.status_code.should be(200)  
  #  end 
  #end
  #
  #describe "fully qualified mobile site", :js => true do
  #  it "should exist" do
  #    visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
  #    print "\n"
  #    print "#{page.current_url}\n"
  #    print "#{page.response_headers}\n"
  #    print "#{page.html}\n"
  #    page.status_code.should be(404)  
  #  end 
  #end
  #
  #describe "an external test" do
  #  it "should exist" do
  #    visit "http://www.google.com.au"
  #    print "\n"
  #    print "#{page.current_url}\n"
  #    print "#{page.response_headers}\n"
  #    print "#{page.html}\n"
  #    page.status_code.should be(404)  
  #  end 
  #end
  #
  # ***
  # ***
    
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
  
  describe "mobile under construction page" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
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
    
end