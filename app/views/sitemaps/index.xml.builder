xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
          "xmlns:image": "http://www.google.com/schemas/sitemap-image/1.1" do
  
  # Static pages
  @static_pages.each do |page|
    xml.url do
      xml.loc page[:url]
      xml.lastmod page[:lastmod].strftime("%Y-%m-%d")
      xml.changefreq page[:changefreq]
      xml.priority page[:priority]
    end
  end
  
  # Future: Add dynamic content URLs
  # Products sitemap entries
  # if defined?(@products) && @products.any?
  #   @products.each do |product|
  #     xml.url do
  #       xml.loc product_url(product)
  #       xml.lastmod product.updated_at.strftime("%Y-%m-%d")
  #       xml.changefreq "weekly"
  #       xml.priority 0.8
  #       
  #       # Add product image
  #       if product.image.present?
  #         xml.image:image do
  #           xml.image :loc, product.image_url
  #           xml.image :title, product.name
  #           xml.image :caption, product.description
  #         end
  #       end
  #     end
  #   end
  # end
  
  # Categories sitemap entries
  # if defined?(@categories) && @categories.any?
  #   @categories.each do |category|
  #     xml.url do
  #       xml.loc category_url(category)
  #       xml.lastmod category.updated_at.strftime("%Y-%m-%d")
  #       xml.changefreq "weekly"
  #       xml.priority 0.7
  #     end
  #   end
  # end
end