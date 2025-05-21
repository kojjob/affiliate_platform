import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "productUrl", "campaignName", "trafficSource",
    "generatedLink", "displaySource", "displayCampaign"
  ]

  connect() {
    this.generateLink()
  }

  generateLink() {
    const productUrl = this.productUrlTarget.value || "https://example.com/product"
    const campaignName = this.campaignNameTarget.value || "demo"
    const trafficSource = this.trafficSourceTarget.value || "website"
    
    // Generate a mock affiliate ID (in real app, this would come from user data)
    const affiliateId = "abc123"
    
    // Create the affiliate link with UTM parameters
    const baseUrl = "https://affiliatemarket.com/r/"
    const utmParams = new URLSearchParams({
      utm_source: trafficSource,
      utm_medium: "affiliate",
      utm_campaign: campaignName,
      utm_content: "banner"
    })
    
    const generatedLink = `${baseUrl}${affiliateId}?${utmParams.toString()}`
    
    // Update the generated link
    this.generatedLinkTarget.value = generatedLink
    
    // Update display values
    this.displaySourceTarget.textContent = trafficSource
    this.displayCampaignTarget.textContent = campaignName
  }

  async copyLink() {
    try {
      await navigator.clipboard.writeText(this.generatedLinkTarget.value)
      
      // Show success feedback
      this.showCopySuccess()
    } catch (err) {
      // Fallback for older browsers
      this.generatedLinkTarget.select()
      document.execCommand('copy')
      this.showCopySuccess()
    }
  }

  showCopySuccess() {
    const button = this.element.querySelector('[data-action*="copyLink"]')
    const originalText = button.textContent
    
    button.textContent = "Copied!"
    button.classList.add("bg-green-500")
    button.classList.remove("bg-gradient-to-r", "from-indigo-900", "to-orange-500")
    
    setTimeout(() => {
      button.textContent = originalText
      button.classList.remove("bg-green-500")
      button.classList.add("bg-gradient-to-r", "from-indigo-900", "to-orange-500")
    }, 2000)
  }
}