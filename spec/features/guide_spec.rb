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
  
  
end