  class SitemapsController < ApplicationController
    layout false
    
    def index
      @static_pages = [
        { url: root_url, priority: 1.0, changefreq: 'daily', lastmod: Date.current },
        { url: about_url, priority: 0.8, changefreq: 'monthly', lastmod: Date.current },
        { url: how_it_works_url, priority: 0.9, changefreq: 'monthly', lastmod: Date.current }
      ]
      
      # Future: Add dynamic pages when models are created
      # @products = Product.published.limit(50000)
      # @categories = Category.all
      
      respond_to do |format|
        format.xml { render 'index.xml.builder' }
      end
    end
  
    def robots
      respond_to do |format|
        format.text { render plain: robots_txt }
      end
    end
  
    private
  
    def robots_txt
      <<~ROBOTS
        User-agent: *
        Allow: /
  
        # Disallow admin areas (future)
        Disallow: /admin/
        Disallow: /api/
        
        # Allow specific bots
        User-agent: Googlebot
        Allow: /
  
        User-agent: Bingbot
        Allow: /
  
        # Sitemap location
        Sitemap: #{request.protocol}#{request.host_with_port}/sitemap.xml
  
        # Crawl-delay
        Crawl-delay: 1
      ROBOTS
    end
end