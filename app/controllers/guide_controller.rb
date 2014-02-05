class GuideController < ApplicationController
    
  # GET /
  def index
    
    @region_touch_icon_extension = page_region_touch_icon_extension
    @meta_description = page_meta_description
    
    if @subdomain == "m"
      render :mobile_index, :layout => 'mobile'  
    else
      @title = page_title
      @news_entries = page_news_entries
    end  
  end
  
  # GET /[region]
  # GET /[region]/[sport]
  def show
    
    @region = Region.find_by_name(params[:region_name])
    @sport = Sport.find_by_name(params[:sport_name])
    
    @region_touch_icon_extension = page_region_touch_icon_extension
    @meta_description = page_meta_description
    
    if !params[:sport_name].nil? && @sport.nil?
      render(:file => "public/404.html", :layout => false, :status => 404)
    elsif @region.nil?
      render(:file => "public/404.html", :layout => false, :status => 404)
    elsif @subdomain == "m" && @sport.nil?
      @programs = Guide.new(@region,@sport, params[:search]).programs_for_html
      render :mobile_show_region, :layout => 'mobile'
   elsif @subdomain == "m"
      @programs = Guide.new(@region,@sport, params[:search]).programs_for_html
      render :mobile_show_sport, :layout => 'mobile'
    else
      @programs = Guide.new(@region,@sport, params[:search]).programs_for_html
      @title = page_title
      @news_entries = page_news_entries
    end
      
  end
  
  private
  
    def page_title  
      if @sport.nil?
        temp_sport = "Sport"
      else
        temp_sport = @sport.name
      end
      
      if @region.nil?
        temp_region = "Australia"
      else
        temp_region = @region.name+", Australia"
      end
       
      temp_sport + " on Television in "+ temp_region + " | Live " + temp_sport + " on TV"
    end
    
    def page_meta_keywords
      end
    
    def page_region_touch_icon_extension
      if @region.nil?
        ""
      else
        "-"+@region.name.downcase
      end
    end
    
    def page_meta_description  
      if @sport.nil?
        temp_sport = "Sport"
      else
        temp_sport = @sport.name
      end
      
      if @region.nil?
        temp_region = "Australia"
      else
        temp_region = @region.name+", Australia"
      end
       
      "Your tv guide for #{temp_sport.downcase} in #{temp_region}.  Coverage of all #{temp_sport.downcase} on television.  Watch live #{temp_sport.downcase} on Free-to-air or Pay TV."   
    end
  
    def page_news_entries
       
      if !@sport.nil?
        feed_uri_search_string = URI.escape(@sport.name)
      elsif !@region.nil?
        feed_uri_search_string = URI.escape(@region.name)
      else
        feed_uri_search_string = URI.escape("Sport")
      end
            
      feed_uri = "http://au.news.search.yahoo.com/news/rss?p=#{feed_uri_search_string}"
      news_feed = Feedzirra::Feed.fetch_and_parse(feed_uri)
      news_feed.entries  
    end
    
end
