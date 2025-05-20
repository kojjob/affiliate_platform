class StaticPagesController < ApplicationController
  before_action :set_common_seo_data

  def home
    @featured_products = mock_featured_products
    @affiliate_stats = mock_affiliate_stats
    @categories = mock_categories
    
    # Home page specific SEO
    @page_title = "AffiliateMarket - Shop & Earn with Top Brands | Best Affiliate Marketing Platform"
    @page_description = "Join 10,000+ affiliates earning passive income. Shop premium products and earn up to 25% commission. Start your affiliate marketing journey today - Free to join!"
    @page_keywords = "affiliate marketing platform, earn money online, passive income, commission shopping, affiliate program, make money shopping, online earning"
  end

  def about
    @page_title = "About AffiliateMarket - Leading Affiliate Marketing Platform"
    @page_description = "Learn about AffiliateMarket's mission to connect brands with affiliates. Discover our story, values, and why we're the top choice for affiliate marketers worldwide."
    @page_keywords = "about affiliate marketing, company story, affiliate platform, brand partnerships, influencer marketing"
  end

  def how_it_works
    @page_title = "How AffiliateMarket Works - Step by Step Guide to Earning"
    @page_description = "Learn how to start earning with AffiliateMarket in 3 simple steps. Complete guide to affiliate marketing, commission structures, and payout methods."
    @page_keywords = "how affiliate marketing works, earn commission, affiliate guide, make money online guide, passive income tutorial"
    
    @steps = how_it_works_steps
    @commission_tiers = commission_tier_data
  end

  def contact
    @page_title = "Contact AffiliateMarket - Get Support & Partnership Information"
    @page_description = "Get in touch with AffiliateMarket for support, partnership opportunities, or general inquiries. Multiple ways to reach our team."
    @page_keywords = "contact affiliate marketing, support, partnership, help desk, customer service"
  end

  def affiliate_program
    @page_title = "Join AffiliateMarket Program - Earn Up to 25% Commission"
    @page_description = "Start earning today with AffiliateMarket's affiliate program. High commissions, top brands, marketing tools, and weekly payouts. Free to join!"
    @page_keywords = "affiliate program, join affiliate marketing, earn commission, affiliate partnership, influencer program"
    
    @program_benefits = affiliate_program_benefits
    @commission_rates = commission_rates_data
    @payout_methods = payout_methods_data
  end

  def getting_started
    @page_title = "Getting Started with AffiliateMarket - Complete Beginner's Guide"
    @page_description = "Complete beginner's guide to affiliate marketing with AffiliateMarket. Learn account setup, product selection, link generation, and optimization tips."
    @page_keywords = "affiliate marketing guide, getting started, beginner affiliate, setup guide, affiliate tutorial"
    
    @setup_steps = getting_started_steps
    @quick_wins = quick_wins_data
  end

  def commission_rates
    @page_title = "AffiliateMarket Commission Rates - Detailed Breakdown by Category"
    @page_description = "Comprehensive guide to AffiliateMarket commission rates. See exact percentages, tier bonuses, and earning potential across all product categories."
    @page_keywords = "affiliate commission rates, earnings, percentage, tier bonuses, affiliate income"
    
    @detailed_commission_rates = detailed_commission_rates_data
    @tier_bonuses = tier_bonus_data
    @earning_examples = earning_examples_data
  end

  def payment_methods
    @page_title = "AffiliateMarket Payment Methods - How and When You Get Paid"
    @page_description = "Complete guide to AffiliateMarket payment methods, schedules, and requirements. Multiple payout options with fast processing times."
    @page_keywords = "affiliate payments, payout methods, payment schedule, affiliate earnings, withdrawal methods"
    
    @detailed_payment_methods = detailed_payment_methods_data
    @payment_schedule = payment_schedule_data
  end

  def marketing_tools
    @page_title = "AffiliateMarket Marketing Tools - Banners, Links & Resources"
    @page_description = "Access professional marketing tools, banners, product feeds, and promotional materials to maximize your affiliate marketing success."
    @page_keywords = "affiliate marketing tools, banners, promotional materials, affiliate resources, marketing assets"
    
    @marketing_tools_list = marketing_tools_data
    @banner_sizes = banner_sizes_data
  end

  def support_center
    @page_title = "AffiliateMarket Support Center - Help & Documentation"
    @page_description = "Get help with your AffiliateMarket account. Browse FAQs, video tutorials, and contact options for technical support and guidance."
    @page_keywords = "affiliate support, help center, FAQ, tutorials, customer service, affiliate assistance"
    
    @support_categories = support_categories_data
    @popular_articles = popular_articles_data
  end

  def press
    @page_title = "AffiliateMarket Press - News, Media Kit & Company Updates"
    @page_description = "Latest news, press releases, and media resources for AffiliateMarket. Download logos, access company information, and contact our media team."
    @page_keywords = "affiliate marketing news, press releases, media kit, company news, AffiliateMarket press"
    
    @press_releases = press_releases_data
    @company_stats = company_stats_data
    @media_coverage = media_coverage_data
  end

  def partner_with_us
    @page_title = "Partner With AffiliateMarket - Join Our Merchant Program"
    @page_description = "Join AffiliateMarket's merchant program and access thousands of affiliates to promote your products. Increase sales with performance-based marketing."
    @page_keywords = "merchant program, brand partnership, affiliate network, increase sales, performance marketing, merchant platform"
    
    @partnership_benefits = partnership_benefits_data
    @merchant_stats = merchant_stats_data
    @integration_options = integration_options_data
  end

  private

  def set_common_seo_data
    @base_url = request.base_url
    @current_url = request.original_url
  end

  def press_releases_data
    [
      {
        title: "AffiliateMarket Reaches $50M in Annual Commission Payouts",
        date: "March 15, 2025",
        category: "Company News",
        excerpt: "Leading affiliate marketing platform celebrates milestone achievement with record-breaking affiliate earnings and merchant growth.",
        url: "#",
        featured: true
      },
      {
        title: "New AI-Powered Analytics Dashboard Launches",
        date: "February 28, 2025",
        category: "Product Update",
        excerpt: "Enhanced analytics provide deeper insights into affiliate performance and optimization opportunities.",
        url: "#",
        featured: false
      },
      {
        title: "AffiliateMarket Expands to European Markets",
        date: "January 20, 2025",
        category: "Expansion",
        excerpt: "Platform now supports multi-currency payments and European merchant partnerships.",
        url: "#",
        featured: false
      },
      {
        title: "Partnership with Top E-commerce Brands Announced",
        date: "December 10, 2024",
        category: "Partnerships",
        excerpt: "Major retail partners join platform, offering affiliates access to premium product lines.",
        url: "#",
        featured: false
      }
    ]
  end

  def company_stats_data
    {
      affiliates: "25,000+",
      merchants: "1,200+",
      commissions_paid: "$75M+",
      countries: "45+",
      founded_year: "2019",
      employees: "150+",
      headquarters: "San Francisco, CA",
      funding_round: "Series B - $25M"
    }
  end

  def media_coverage_data
    [
      {
        publication: "TechCrunch",
        title: "How AffiliateMarket is Revolutionizing Performance Marketing",
        date: "February 2025",
        url: "#"
      },
      {
        publication: "Forbes",
        title: "The Future of Affiliate Marketing: AffiliateMarket's Innovation",
        date: "January 2025",
        url: "#"
      },
      {
        publication: "VentureBeat",
        title: "AffiliateMarket Raises $25M to Expand Global Operations",
        date: "November 2024",
        url: "#"
      }
    ]
  end

  def partnership_benefits_data
    [
      {
        icon: "📈",
        title: "Increased Sales Volume",
        description: "Access thousands of affiliates ready to promote your products across multiple channels."
      },
      {
        icon: "💰",
        title: "Performance-Based ROI",
        description: "Pay only for results with transparent tracking and attribution."
      },
      {
        icon: "🎯",
        title: "Targeted Promotion",
        description: "Connect with affiliates in your specific niche and target market."
      },
      {
        icon: "📊",
        title: "Advanced Analytics",
        description: "Real-time insights into affiliate performance and customer acquisition."
      },
      {
        icon: "🛠️",
        title: "Easy Integration",
        description: "Quick setup with our API or popular e-commerce platform plugins."
      },
      {
        icon: "🤝",
        title: "Dedicated Support",
        description: "Personal account manager to help optimize your affiliate program."
      }
    ]
  end

  def merchant_stats_data
    {
      avg_sales_increase: "340%",
      avg_roas: "8.5:1",
      setup_time: "< 48 hours",
      affiliate_reach: "25,000+",
      integration_platforms: "50+",
      avg_commission_rate: "12%"
    }
  end

  def integration_options_data
    [
      {
        platform: "Shopify",
        description: "One-click app installation with automatic product syncing",
        setup_time: "5 minutes",
        features: ["Auto product sync", "Order tracking", "Commission calculation"]
      },
      {
        platform: "WooCommerce",
        description: "WordPress plugin with full e-commerce integration",
        setup_time: "10 minutes",
        features: ["Product catalog sync", "Customer tracking", "Analytics dashboard"]
      },
      {
        platform: "API Integration",
        description: "Custom integration for any platform using our REST API",
        setup_time: "1-3 days",
        features: ["Full API access", "Custom tracking", "Webhook support"]
      },
      {
        platform: "Magento",
        description: "Native extension for Magento 2.x installations",
        setup_time: "15 minutes",
        features: ["Multi-store support", "Advanced reporting", "Custom commission rules"]
      }
    ]
  end

  # ... (keeping all other existing methods from before)

  def getting_started_steps
    [
      {
        step: 1,
        title: "Create Your Account",
        description: "Sign up with your email and basic information",
        details: [
          "Visit our signup page and enter your details",
          "Verify your email address",
          "Complete your profile information",
          "Set up your payment preferences"
        ],
        time: "2 minutes"
      },
      {
        step: 2,
        title: "Explore Products",
        description: "Browse our catalog and understand commission structures",
        details: [
          "Browse product categories that match your audience",
          "Review commission rates and terms",
          "Check product popularity and conversion rates",
          "Read merchant requirements and restrictions"
        ],
        time: "10 minutes"
      },
      {
        step: 3,
        title: "Generate Your First Link",
        description: "Create your unique affiliate links",
        details: [
          "Select a product you want to promote",
          "Click 'Get Link' to generate your unique URL",
          "Copy your affiliate link",
          "Test the link to ensure it's working"
        ],
        time: "1 minute"
      },
      {
        step: 4,
        title: "Start Promoting",
        description: "Share your links and track performance",
        details: [
          "Share links on your preferred platforms",
          "Use our tracking dashboard to monitor clicks",
          "Optimize based on performance data",
          "Scale successful campaigns"
        ],
        time: "Ongoing"
      }
    ]
  end

  def quick_wins_data
    [
      {
        title: "Start with Products You Use",
        description: "Promote products you already know and love for authentic recommendations.",
        icon: "❤️"
      },
      {
        title: "Use Social Proof",
        description: "Share your personal experience and results with the products.",
        icon: "⭐"
      },
      {
        title: "Optimize Your Bio Links",
        description: "Update your social media bios with your affiliate links.",
        icon: "🔗"
      },
      {
        title: "Join Relevant Groups",
        description: "Participate in communities where your target audience hangs out.",
        icon: "👥"
      }
    ]
  end

  def detailed_commission_rates_data
    [
      {
        category: "Electronics",
        base_rate: "8-15%",
        tier_rates: {
          "Starter (0-10 sales)" => "8%",
          "Growing (11-50 sales)" => "10%",
          "Pro (51-100 sales)" => "12%",
          "Elite (100+ sales)" => "15%"
        },
        popular_products: [
          { name: "Laptops", commission: "10-12%", avg_price: "$800", avg_commission: "$96" },
          { name: "Smartphones", commission: "8-10%", avg_price: "$600", avg_commission: "$60" },
          { name: "Headphones", commission: "12-15%", avg_price: "$200", avg_commission: "$30" }
        ]
      },
      {
        category: "Fashion & Accessories",
        base_rate: "12-20%",
        tier_rates: {
          "Starter (0-10 sales)" => "12%",
          "Growing (11-50 sales)" => "15%",
          "Pro (51-100 sales)" => "18%",
          "Elite (100+ sales)" => "20%"
        },
        popular_products: [
          { name: "Designer Bags", commission: "15-20%", avg_price: "$300", avg_commission: "$60" },
          { name: "Athletic Wear", commission: "12-16%", avg_price: "$80", avg_commission: "$12.80" },
          { name: "Jewelry", commission: "18-25%", avg_price: "$150", avg_commission: "$37.50" }
        ]
      },
      {
        category: "Home & Garden",
        base_rate: "10-18%",
        tier_rates: {
          "Starter (0-10 sales)" => "10%",
          "Growing (11-50 sales)" => "13%",
          "Pro (51-100 sales)" => "15%",
          "Elite (100+ sales)" => "18%"
        },
        popular_products: [
          { name: "Furniture", commission: "12-18%", avg_price: "$400", avg_commission: "$72" },
          { name: "Kitchen Appliances", commission: "10-15%", avg_price: "$200", avg_commission: "$30" },
          { name: "Decor Items", commission: "15-20%", avg_price: "$50", avg_commission: "$10" }
        ]
      }
    ]
  end

  def tier_bonus_data
    [
      { milestone: "First Sale", bonus: "$10", requirements: "Complete your first successful referral" },
      { milestone: "10 Sales", bonus: "$50", requirements: "Reach 10 total sales across all products" },
      { milestone: "50 Sales", bonus: "$200", requirements: "Reach 50 total sales with tier upgrade" },
      { milestone: "100 Sales", bonus: "$500", requirements: "Reach 100 total sales and Elite status" },
      { milestone: "Monthly Top 10", bonus: "$1,000", requirements: "Rank in top 10 affiliates for the month" }
    ]
  end

  def earning_examples_data
    [
      {
        scenario: "Casual Blogger",
        monthly_sales: "5 sales",
        avg_order: "$150",
        commission_rate: "12%",
        monthly_earnings: "$90",
        yearly_projection: "$1,080"
      },
      {
        scenario: "Active YouTuber",
        monthly_sales: "25 sales",
        avg_order: "$200",
        commission_rate: "15%",
        monthly_earnings: "$750",
        yearly_projection: "$9,000"
      },
      {
        scenario: "Dedicated Influencer",
        monthly_sales: "100 sales",
        avg_order: "$250",
        commission_rate: "20%",
        monthly_earnings: "$5,000",
        yearly_projection: "$60,000"
      }
    ]
  end

  def detailed_payment_methods_data
    [
      {
        method: "PayPal",
        minimum: "$25",
        processing_time: "1-2 business days",
        fees: "Free",
        currency: "USD, EUR, GBP, CAD",
        requirements: "Verified PayPal account",
        best_for: "Fast, international payments"
      },
      {
        method: "Bank Transfer (ACH)",
        minimum: "$50",
        processing_time: "3-5 business days",
        fees: "Free",
        currency: "USD only",
        requirements: "US bank account",
        best_for: "Domestic US payments"
      },
      {
        method: "Wire Transfer",
        minimum: "$500",
        processing_time: "1-3 business days",
        fees: "$25",
        currency: "Multiple currencies",
        requirements: "International bank account",
        best_for: "Large international payments"
      },
      {
        method: "Check",
        minimum: "$100",
        processing_time: "7-14 business days",
        fees: "$5",
        currency: "USD only",
        requirements: "Physical mailing address",
        best_for: "Traditional payment preference"
      },
      {
        method: "Cryptocurrency",
        minimum: "$25",
        processing_time: "Same day",
        fees: "Network fees apply",
        currency: "BTC, ETH, USDC",
        requirements: "Crypto wallet address",
        best_for: "Tech-savvy affiliates"
      }
    ]
  end

  def payment_schedule_data
    {
      frequency: "Weekly",
      payment_day: "Every Friday",
      cutoff_time: "Thursday 11:59 PM PST",
      minimum_threshold: "$25 (varies by method)",
      processing_time: "1-5 business days (varies by method)",
      hold_period: "None for established affiliates",
      tax_reporting: "1099 issued for US affiliates earning $600+"
    }
  end

  def marketing_tools_data
    [
      {
        category: "Banner Ads",
        tools: [
          "Static banners in 10+ sizes",
          "Animated GIF banners",
          "Seasonal promotional banners",
          "Custom brand-specific banners"
        ],
        formats: "JPG, PNG, GIF, HTML5"
      },
      {
        category: "Product Feeds",
        tools: [
          "XML product feed with real-time pricing",
          "JSON API for dynamic integration",
          "CSV export for offline use",
          "RSS feed for blog integration"
        ],
        formats: "XML, JSON, CSV, RSS"
      },
      {
        category: "Text Links",
        tools: [
          "Pre-written product descriptions",
          "Call-to-action templates",
          "Email marketing templates",
          "Social media post templates"
        ],
        formats: "HTML, Plain text"
      },
      {
        category: "Tracking Tools",
        tools: [
          "Real-time analytics dashboard",
          "Conversion tracking pixels",
          "UTM parameter generator",
          "A/B testing tools"
        ],
        formats: "Web dashboard, API"
      },
      {
        category: "Creative Assets",
        tools: [
          "High-resolution product images",
          "Brand logos and assets",
          "Video marketing materials",
          "Infographic templates"
        ],
        formats: "PNG, JPG, MP4, SVG"
      }
    ]
  end

  def banner_sizes_data
    [
      { size: "728x90", name: "Leaderboard", usage: "Website header/footer" },
      { size: "300x250", name: "Medium Rectangle", usage: "Sidebar, in-content" },
      { size: "160x600", name: "Wide Skyscraper", usage: "Sidebar" },
      { size: "320x50", name: "Mobile Banner", usage: "Mobile websites/apps" },
      { size: "300x600", name: "Half Page", usage: "Sidebar premium placement" },
      { size: "970x250", name: "Billboard", usage: "Above-the-fold placement" }
    ]
  end

  def support_categories_data
    [
      {
        category: "Account Management",
        icon: "👤",
        articles: 12,
        topics: ["Profile setup", "Password reset", "Account verification", "Settings"]
      },
      {
        category: "Link Generation",
        icon: "🔗",
        articles: 8,
        topics: ["Creating links", "Tracking parameters", "Link customization", "Bulk generation"]
      },
      {
        category: "Payments & Earnings",
        icon: "💰",
        articles: 15,
        topics: ["Payment methods", "Tax information", "Earning reports", "Payment schedules"]
      },
      {
        category: "Marketing Guidelines",
        icon: "📋",
        articles: 10,
        topics: ["FTC compliance", "Brand guidelines", "Prohibited practices", "Best practices"]
      },
      {
        category: "Technical Support",
        icon: "🔧",
        articles: 20,
        topics: ["API documentation", "Integration guides", "Troubleshooting", "Browser issues"]
      },
      {
        category: "Program Policies",
        icon: "📜",
        articles: 6,
        topics: ["Terms of service", "Commission structure", "Program updates", "Violation policies"]
      }
    ]
  end

  def popular_articles_data
    [
      {
        title: "How to Generate Your First Affiliate Link",
        views: "15,420",
        category: "Getting Started",
        last_updated: "2 days ago"
      },
      {
        title: "Understanding FTC Disclosure Requirements",
        views: "12,350",
        category: "Compliance",
        last_updated: "1 week ago"
      },
      {
        title: "Setting Up PayPal for Affiliate Payments",
        views: "11,240",
        category: "Payments",
        last_updated: "3 days ago"
      },
      {
        title: "Best Practices for Social Media Promotion",
        views: "9,830",
        category: "Marketing",
        last_updated: "5 days ago"
      },
      {
        title: "Tracking Your Click and Conversion Rates",
        views: "8,920",
        category: "Analytics",
        last_updated: "1 week ago"
      }
    ]
  end

  def how_it_works_steps
    [
      {
        number: "01",
        title: "Sign Up Free",
        description: "Create your account in under 2 minutes. No fees, no commitments.",
        details: "Join thousands of affiliates already earning passive income",
        icon: "👤"
      },
      {
        number: "02", 
        title: "Choose Products",
        description: "Browse our marketplace and select products you love from top brands.",
        details: "Access exclusive deals and high-commission products",
        icon: "🛍️"
      },
      {
        number: "03",
        title: "Share & Earn",
        description: "Share your unique links and earn commission on every sale.",
        details: "Real-time tracking, weekly payouts, lifetime commissions",
        icon: "💰"
      }
    ]
  end

  def commission_tier_data
    [
      { tier: "Starter", sales: "0-10", commission: "5-10%", color: "bg-slate-100 text-slate-800" },
      { tier: "Growing", sales: "11-50", commission: "10-15%", color: "bg-orange-100 text-orange-800" },
      { tier: "Pro", sales: "51-100", commission: "15-20%", color: "bg-cyan-100 text-cyan-800" },
      { tier: "Elite", sales: "100+", commission: "20-25%", color: "bg-green-100 text-green-800" }
    ]
  end

  def affiliate_program_benefits
    [
      {
        icon: "💸",
        title: "High Commissions",
        description: "Earn up to 25% commission on every sale with our tiered system."
      },
      {
        icon: "🎯",
        title: "Marketing Tools",
        description: "Access banners, product feeds, and marketing materials to boost conversions."
      },
      {
        icon: "📊",
        title: "Real-Time Analytics", 
        description: "Track clicks, conversions, and earnings with detailed reporting."
      },
      {
        icon: "⚡",
        title: "Weekly Payouts",
        description: "Get paid every week with multiple payout options available."
      },
      {
        icon: "🤝",
        title: "Dedicated Support",
        description: "Personal affiliate manager and 24/7 support team."
      },
      {
        icon: "🏆",
        title: "Bonus Programs",
        description: "Monthly contests, performance bonuses, and exclusive rewards."
      }
    ]
  end

  def commission_rates_data
    [
      { category: "Electronics", rate: "8-15%", example: "$120 per laptop sale" },
      { category: "Fashion", rate: "12-20%", example: "$24 per $120 outfit" },
      { category: "Home & Garden", rate: "10-18%", example: "$45 per furniture item" },
      { category: "Health & Beauty", rate: "15-25%", example: "$37.50 per $150 order" },
      { category: "Digital Products", rate: "20-50%", example: "$100 per course sale" },
      { category: "Software", rate: "30-75%", example: "$225 per subscription" }
    ]
  end

  def payout_methods_data
    [
      { method: "PayPal", minimum: "$25", processing: "1-2 days", fee: "Free" },
      { method: "Bank Transfer", minimum: "$50", processing: "3-5 days", fee: "Free" },
      { method: "Check", minimum: "$100", processing: "7-10 days", fee: "$5" },
      { method: "Cryptocurrency", minimum: "$25", processing: "Same day", fee: "1%" }
    ]
  end

  def mock_featured_products
    [
      {
        id: 1,
        name: "Premium Wireless Noise-Cancelling Headphones",
        description: "Experience crystal-clear audio with industry-leading noise cancellation technology. Perfect for work, travel, and entertainment.",
        price: 299.99,
        discount: 20,
        rating: 4.8,
        commission: 15,
        image: "/api/placeholder/300/300",
        brand: "AudioTech Pro",
        category: "Electronics",
        url: "/products/premium-wireless-headphones"
      },
      {
        id: 2,
        name: "Smart Home Security Camera with AI Detection",
        description: "Keep your home secure with 4K video, AI-powered motion detection, and real-time alerts to your smartphone.",
        price: 199.99,
        discount: 15,
        rating: 4.6,
        commission: 12,
        image: "/api/placeholder/300/300",
        brand: "SecureHome",
        category: "Smart Home",
        url: "/products/smart-security-camera"
      },
      {
        id: 3,
        name: "Ergonomic Mesh Office Chair with Lumbar Support",
        description: "Professional-grade office chair designed for all-day comfort with breathable mesh and adjustable lumbar support.",
        price: 459.99,
        discount: 25,
        rating: 4.9,
        commission: 18,
        image: "/api/placeholder/300/300",
        brand: "ErgoWork",
        category: "Furniture",
        url: "/products/ergonomic-office-chair"
      },
      {
        id: 4,
        name: "Portable Waterproof Bluetooth Speaker",
        description: "Take your music anywhere with this rugged, waterproof speaker featuring 360° sound and 24-hour battery life.",
        price: 89.99,
        discount: 10,
        rating: 4.7,
        commission: 10,
        image: "/api/placeholder/300/300",
        brand: "SoundWave",
        category: "Audio",
        url: "/products/portable-bluetooth-speaker"
      },
      {
        id: 5,
        name: "Advanced Fitness Tracker with Heart Rate Monitor",
        description: "Track your health and fitness goals with GPS, heart rate monitoring, sleep tracking, and 7-day battery life.",
        price: 249.99,
        discount: 30,
        rating: 4.5,
        commission: 20,
        image: "/api/placeholder/300/300",
        brand: "FitTrack Pro",
        category: "Health & Fitness",
        url: "/products/fitness-tracker-watch"
      },
      {
        id: 6,
        name: "Fast Wireless Charging Pad with LED Indicator",
        description: "Charge your devices wirelessly with Qi-compatible fast charging technology and LED status indicators.",
        price: 39.99,
        discount: 5,
        rating: 4.4,
        commission: 8,
        image: "/api/placeholder/300/300",
        brand: "ChargeTech",
        category: "Accessories",
        url: "/products/wireless-charging-pad"
      }
    ]
  end

  def mock_affiliate_stats
    {
      commissions_paid: "$2,847,392",
      top_affiliates: 1247,
      your_earnings: "$0.00",
      avg_commission: "15.2%",
      total_orders: "45,892",
      conversion_rate: "3.8%"
    }
  end

  def mock_categories
    [
      { 
        name: "Electronics", 
        icon: "⚡", 
        count: 1250,
        description: "Latest gadgets and electronic devices",
        slug: "electronics"
      },
      { 
        name: "Fashion", 
        icon: "👔", 
        count: 890,
        description: "Trending fashion and accessories",
        slug: "fashion"
      },
      { 
        name: "Home & Garden", 
        icon: "🏠", 
        count: 567,
        description: "Home improvement and garden essentials",
        slug: "home-garden"
      },
      { 
        name: "Sports & Fitness", 
        icon: "🏃", 
        count: 432,
        description: "Fitness equipment and sportswear",
        slug: "sports-fitness"
      },
      { 
        name: "Books & Media", 
        icon: "📚", 
        count: 234,
        description: "Books, courses, and digital media",
        slug: "books-media"
      },
      { 
        name: "Health & Beauty", 
        icon: "💄", 
        count: 345,
        description: "Health supplements and beauty products",
        slug: "health-beauty"
      },
      { 
        name: "Automotive", 
        icon: "🚗", 
        count: 123,
        description: "Car accessories and automotive tools",
        slug: "automotive"
      },
      { 
        name: "Food & Beverages", 
        icon: "🍕", 
        count: 678,
        description: "Gourmet food and specialty beverages",
        slug: "food-beverages"
      }
    ]
  end
end