import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mobileMenu", "mobileToggle", "hamburgerIcon", "closeIcon"]

  connect() {
    this.mobileMenuVisible = false
    this.setupKeyboardNavigation()
  }

  disconnect() {
    document.removeEventListener('keydown', this.handleKeydown)
  }

  toggleMobile() {
    this.mobileMenuVisible = !this.mobileMenuVisible
    
    if (this.mobileMenuVisible) {
      this.showMobileMenu()
    } else {
      this.hideMobileMenu()
    }
  }

  showMobileMenu() {
    // Update menu visibility
    this.mobileMenuTarget.classList.remove("hidden")
    this.mobileMenuTarget.classList.add("opacity-100", "translate-y-0")
    this.mobileMenuTarget.classList.remove("opacity-0", "-translate-y-2")
    
    // Update hamburger icons
    this.hamburgerIconTarget.classList.add("hidden")
    this.closeIconTarget.classList.remove("hidden")
    
    // Prevent body scroll
    document.body.style.overflow = 'hidden'
    
    // Focus management
    setTimeout(() => {
      const firstFocusable = this.mobileMenuTarget.querySelector('a, button')
      if (firstFocusable) firstFocusable.focus()
    }, 100)
  }

  hideMobileMenu() {
    // Update menu visibility
    this.mobileMenuTarget.classList.add("opacity-0", "-translate-y-2")
    this.mobileMenuTarget.classList.remove("opacity-100", "translate-y-0")
    
    setTimeout(() => {
      this.mobileMenuTarget.classList.add("hidden")
    }, 300)
    
    // Update hamburger icons
    this.hamburgerIconTarget.classList.remove("hidden")
    this.closeIconTarget.classList.add("hidden")
    
    // Restore body scroll
    document.body.style.overflow = ''
    
    // Return focus to toggle button
    this.mobileToggleTarget.focus()
  }

  handleOutsideClick(event) {
    if (!this.mobileMenuVisible) return
    
    const menu = this.mobileMenuTarget
    const toggle = this.mobileToggleTarget
    
    if (!menu.contains(event.target) && !toggle.contains(event.target)) {
      this.hideMobileMenu()
      this.mobileMenuVisible = false
    }
  }

  setupKeyboardNavigation() {
    this.handleKeydown = this.handleKeydown.bind(this)
    document.addEventListener('keydown', this.handleKeydown)
  }

  handleKeydown(event) {
    if (event.key === 'Escape' && this.mobileMenuVisible) {
      this.hideMobileMenu()
      this.mobileMenuVisible = false
    }
  }
}