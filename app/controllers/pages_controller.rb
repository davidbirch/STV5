class PagesController < ApplicationController
  force_ssl :except => [:about, :privacy, :contact, :mobile_under_construction]
  before_filter :authenticate, :except => [:about, :privacy, :contact, :mobile_under_construction]
  
  def privacy
    @title = "Privacy Statement | Sport on Television in Australia"
    @breadcrumb = "Privacy"
  end

  def contact
    @title = "Contact Us | Sport on Television in Australia"
    @breadcrumb = "Contact"
  end
  
  def login
    @title = "Login | Sport on Television in Australia"
    @breadcrumb = "Login"
    redirect_to "/Dashboard"
  end
  
  def dashboard
    @title = "Dashboard | Sport on Television in Australia"
    @breadcrumb = "Dashboard"
  end
  
end
