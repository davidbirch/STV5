require 'spec_helper'

# Useful reference links
# https://github.com/jnicklas/capybara
# https://gist.github.com/428105

describe "Guide" do
  
  include AuthHelper
  include SiteVariablesHelper 
  
  before :each do
    @sport_cricket = FactoryGirl.create(:cricket_sport)
    @region_melbourne = FactoryGirl.create(:region_melbourne)
    @search_string = "The Ashes"
  end
    
  describe "site (root)" do
    it "should exist" do
      visit root_path
      page.status_code.should be(200)  
    end 
  end
  
  describe "site (desktop)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_desktop_subdomain"]
      page.status_code.should be(200)  
    end 
  end
  
  describe "site (mobile)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      page.status_code.should be(200)  
    end 
  end
  
  describe "navigate to region page (mobile)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      page.status_code.should be(200)  
    end 
  end
  
  describe "navigate to site page (mobile)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      click_link('Home')
      page.status_code.should be(200)  
    end 
  end
  
  describe "navigate to sport page (mobile)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      click_link('Cricket')
      page.status_code.should be(200)  
    end 
  end
  
  describe "navigate to region page (mobile)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      click_link('Cricket')
      click_link('Back')
      page.status_code.should be(200)  
    end 
  end
  
  describe "navigate to site page (mobile)" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      click_link('Cricket')
      click_link('Back')
      click_link('Home')
      page.status_code.should be(200)  
    end 
  end
  
  describe "navigate to the mobile site and then the desktop version" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Desktop')
      page.status_code.should be(200)
      page.title.should_not include("Melbourne")
      page.title.should_not include("Cricket")
    end 
  end
  
  describe "navigate to the desktop site and then the mobile version" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_desktop_subdomain"]
      click_link('Switch to a mobile-friendly page')
      page.status_code.should be(200)
      page.title.should_not include("Melbourne")
      page.title.should_not include("Cricket")
    end 
  end
    
  describe "navigate to mobile region page and then the desktop version" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      click_link('Desktop')
      page.status_code.should be(200)
      page.title.should include("Melbourne")
      page.title.should_not include("Cricket")
    end 
  end
  
  describe "navigate to mobile sport page and then the desktop version" do
    it "should exist" do
      visit "http://"+site_variables["fully_qualified_mobile_subdomain"]
      click_link('Melbourne')
      click_link('Cricket')
      click_link('Desktop')
      page.status_code.should be(200)
      page.title.should include("Melbourne")
      page.title.should include("Cricket")
    end 
  end
  
end