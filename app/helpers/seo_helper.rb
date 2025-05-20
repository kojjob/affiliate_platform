module SeoHelper
    def page_title(title = nil)
      base_title = "AffiliateMarket - Shop & Earn with Top Brands"
      if title.present?
        content_for(:title, "#{title} | #{base_title}")
      else
        content_for(:title, base_title)
      end
    end

    def page_description(description = nil)
      default_description = "Join thousands earning passive income through affiliate marketing. Shop top products and earn up to 25% commission. Start your affiliate journey today!"
      content_for(:description, description.presence || default_description)
    end

    def page_keywords(keywords = nil)
      default_keywords = "affiliate marketing, earn money online, passive income, commission, online shopping, affiliate program, make money shopping"
      content_for(:keywords, keywords.presence || default_keywords)
    end

    def page_canonical(url = nil)
      content_for(:canonical, url.presence || request.original_url)
    end

    def page_image(image_url = nil)
      default_image = "#{request.base_url}/assets/affiliate-market-og.jpg"
      content_for(:og_image, image_url.presence || default_image)
    end

    def structured_data_organization
      {
        "@context": "https://schema.org",
        "@type": "Organization",
        "name": "AffiliateMarket",
        "url": root_url,
        "logo": "#{request.base_url}/assets/logo.png",
        "description": "Premier affiliate marketing platform connecting brands with influencers",
        "founder": {
          "@type": "Organization",
          "name": "AffiliateMarket Inc."
        },
        "foundingDate": "2024",
        "sameAs": [
          "https://twitter.com/affiliatemarket",
          "https://linkedin.com/company/affiliatemarket",
          "https://facebook.com/affiliatemarket"
        ],
        "contactPoint": {
          "@type": "ContactPoint",
          "contactType": "customer service",
          "availableLanguage": "English"
        }
      }.to_json.html_safe
    end

    def structured_data_website
      {
        "@context": "https://schema.org",
        "@type": "WebSite",
        "name": "AffiliateMarket",
        "url": root_url,
        "description": "Shop and earn with affiliate marketing",
        "potentialAction": {
          "@type": "SearchAction",
          "target": "#{root_url}search?q={search_term_string}",
          "query-input": "required name=search_term_string"
        }
      }.to_json.html_safe
    end

    def structured_data_product(product)
      return unless product

      {
        "@context": "https://schema.org",
        "@type": "Product",
        "name": product[:name],
        "description": product[:description] || product[:name],
        "image": product[:image],
        "offers": {
          "@type": "Offer",
          "price": product[:price],
          "priceCurrency": "USD",
          "availability": "https://schema.org/InStock",
          "seller": {
            "@type": "Organization",
            "name": "AffiliateMarket"
          }
        },
        "aggregateRating": {
          "@type": "AggregateRating",
          "ratingValue": product[:rating],
          "bestRating": "5",
          "worstRating": "1",
          "ratingCount": rand(50..500)
        },
        "brand": {
          "@type": "Brand",
          "name": "Brand Name"
        }
      }.to_json.html_safe
    end

    def structured_data_breadcrumb(items)
      breadcrumb_list = {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": items.map.with_index do |item, index|
          {
            "@type": "ListItem",
            "position": index + 1,
            "item": {
              "@type": "WebPage",
              "@id": item[:url],
              "name": item[:name]
            }
          }
        end
      }
      breadcrumb_list.to_json.html_safe
    end

    def robots_meta(index: true, follow: true, snippet: true, archive: true)
      directives = []
      directives << (index ? "index" : "noindex")
      directives << (follow ? "follow" : "nofollow")
      directives << "nosnippet" unless snippet
      directives << "noarchive" unless archive
      directives.join(", ")
    end

    def hreflang_tags
      # Add international language support
      content_for(:hreflang) do
        capture do
          concat tag(:link, rel: "alternate", hreflang: "en", href: request.original_url)
          concat tag(:link, rel: "alternate", hreflang: "x-default", href: request.original_url)
        end
      end
    end

    def preload_critical_assets
      content_for(:preload) do
        capture do
          concat tag(:link, rel: "preload", href: "https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap", as: "style")
          concat tag(:link, rel: "preconnect", href: "https://fonts.googleapis.com")
          concat tag(:link, rel: "preconnect", href: "https://fonts.gstatic.com", crossorigin: true)
        end
      end
    end
end
