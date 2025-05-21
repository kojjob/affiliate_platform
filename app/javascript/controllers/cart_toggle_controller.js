import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.animateBadge()
  }

  animateBadge() {
    const badge = this.element.querySelector('.animate-pulse')
    if (badge) {
      // Remove pulse after initial load
      setTimeout(() => {
        badge.classList.remove('animate-pulse')
      }, 2000)
    }
  }

  toggle(event) {
    event.preventDefault()
    
    // Add click animation
    this.element.style.transform = 'scale(0.95)'
    setTimeout(() => {
      this.element.style.transform = 'scale(1)'
    }, 150)
    
    // Here you would typically open cart drawer/modal
    console.log('Cart toggled')
    
    // Add small vibration on mobile if supported
    if (navigator.vibrate) {
      navigator.vibrate(20)
    }
  }
}