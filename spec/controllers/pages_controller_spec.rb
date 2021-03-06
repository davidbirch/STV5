require 'spec_helper'

describe PagesController do
  
  include AuthHelper

  describe "GET #contact" do
    before :each do
      get :contact
    end
    
    it "renders the :contact view" do
      response.should render_template :contact
    end  
  end

  describe "GET #privacy" do
    before :each do
      get :privacy
    end
    
    it "renders the :privacy view" do
      response.should render_template :privacy
    end  
  end

  describe "GET #dashboard (unauthenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      get :dashboard
    end
    
    it "should return a 401 with no basic auth" do
      response.status.should == 401
    end
  end

  describe "GET #dashboard (unauthenticated via http)" do
    before :each do
      get :dashboard
    end
    
    it "should return a 301 redirect to the https site" do
      response.status.should == 301
    end
  end
  
  describe "GET #dashboard (authenticated via http)" do
    before :each do
      http_login
      get :dashboard
    end
    
    it "should return a 301 redirect to the https site" do
      response.status.should == 301
    end
  end
  
  describe "GET #dashboard (authenticated via https)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login
      get :dashboard
    end
    
    it 'should return a 200 with valid basic auth' do
      response.status.should == 200
    end
    
    it "renders the :privacy view" do
      response.should render_template :dashboard
    end   
  end
  
  describe "GET #login (unauthenticated)" do  
    before :each do
      request.env['HTTPS'] = 'on'
      get :login
    end
    
    it "should return a 401 with no basic auth" do
      response.status.should == 401
    end
  end

  describe "GET #login (authenticated)" do
    before :each do
      request.env['HTTPS'] = 'on'
      http_login      
      get :login
    end
    
    it 'should return a 302 redirect with valid basic auth' do
      response.status.should == 302
    end
  
    it 'should redirect to the dashboard' do
      response.should redirect_to "/Dashboard"
    end
  end  

end
