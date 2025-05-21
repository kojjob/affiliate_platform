module ApplicationHelper
  def structured_data_organization
    {
      "@context": "https://schema.org",
      "@type": "Organization",
      "name": "AffiliateMarket",
      "url": request.base_url,
      "logo": "#{request.base_url}/logo.png",
      "description": "Premier affiliate marketing platform connecting brands with influencers",
      "contactPoint": {
        "@type": "ContactPoint",
        "telephone": "+1-555-AFFILIATE",
        "contactType": "customer service"
      },
      "sameAs": [
        "https://twitter.com/affiliatemarket",
        "https://facebook.com/affiliatemarket",
        "https://linkedin.com/company/affiliatemarket"
      ]
    }.to_json.html_safe
  end

  def structured_data_website
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "AffiliateMarket",
      "url": request.base_url,
      "potentialAction": {
        "@type": "SearchAction",
        "target": "#{request.base_url}/search?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }.to_json.html_safe
  end

  def flash_class(level)
    case level.to_sym
    when :notice then "bg-green-50 border-green-200 text-green-800"
    when :success then "bg-green-50 border-green-200 text-green-800"
    when :error then "bg-red-50 border-red-200 text-red-800"
    when :alert then "bg-yellow-50 border-yellow-200 text-yellow-800"
    else "bg-blue-50 border-blue-200 text-blue-800"
    end
  end

  def user_avatar(user, size: "w-8 h-8")
    if user.present?
      content_tag :div, user.initials,
                  class: "#{size} bg-gradient-to-br from-slate-900 to-orange-500 rounded-full flex items-center justify-center text-white font-bold text-sm"
    else
      content_tag :div, "?",
                  class: "#{size} bg-gray-300 rounded-full flex items-center justify-center text-gray-600 font-bold text-sm"
    end
  end
end
