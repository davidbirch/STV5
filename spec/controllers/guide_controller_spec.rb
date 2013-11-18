require 'spec_helper'

describe GuideController do
  
  include AuthHelper
  include SiteVariablesHelper
  
  describe "GET #show (mobile)" do
    before :each do
      setup_request_host_for_mobile_site
      get :show, region_name: "Melbourne"
    end
    
    it "redirects to the 404 page because the region is invalid" do
      response.status.should == 404
    end  
  end
  
  describe "GET #show (desktop)" do
    before :each do
      setup_request_host_for_desktop_site
      get :show, region_name: "Melbourne"
    end
    
    it "redirects to the 404 page because the region is invalid" do
      response.status.should == 404
    end  
  end
  
  describe "GET #index (mobile)" do
    before :each do
      setup_request_host_for_mobile_site
      get :index
    end
    
    it "renders the :index view" do      
      response.should render_template :mobile_index
    end
    
    it "renders the :mobile layout" do
      response.should render_template :mobile
    end       
  end
  
  describe "GET #index (desktop)" do
    before :each do
      setup_request_host_for_desktop_site
      get :index
    end
    
    it "renders the :index view" do      
      response.should render_template :index
    end
    
    it "renders the :mobile layout" do
      response.should_not render_template :mobile
    end       
  end
  
  
end
  