import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["trigger", "menu", "icon"]
  static values = { 
    autoClose: { type: Boolean, default: true },
    closeOnOutsideClick: { type: Boolean, default: true }
  }

  connect() {
    this.isOpen = false
    this.boundHandleOutsideClick = this.handleOutsideClick.bind(this)
    this.boundHandleKeydown = this.handleKeydown.bind(this)
    
    if (this.closeOnOutsideClickValue) {
      document.addEventListener('click', this.boundHandleOutsideClick)
    }
    document.addEventListener('keydown', this.boundHandleKeydown)
  }

  disconnect() {
    document.removeEventListener('click', this.boundHandleOutsideClick)
    document.removeEventListener('keydown', this.boundHandleKeydown)
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()
    
    if (this.isOpen) {
      this.hide()
    } else {
      this.show()
    }
  }

  show() {
    if (this.isOpen) return
    
    this.isOpen = true
    
    // Update menu visibility with animation
    this.menuTarget.classList.remove("hidden", "opacity-0", "scale-95")
    this.menuTarget.classList.add("opacity-100", "scale-100")
    
    // Rotate chevron icon
    if (this.hasIconTarget) {
      this.iconTarget.style.transform = "rotate(180deg)"
    }
    
    // Set ARIA attributes
    this.triggerTarget.setAttribute('aria-expanded', 'true')
    this.menuTarget.setAttribute('aria-hidden', 'false')
    
    // Focus management
    setTimeout(() => {
      const firstFocusable = this.menuTarget.querySelector('a, button, input, [tabindex]:not([tabindex="-1"])')
      if (firstFocusable) firstFocusable.focus()
    }, 100)
  }

  hide() {
    if (!this.isOpen) return
    
    this.isOpen = false
    
    // Update menu visibility with animation
    this.menuTarget.classList.remove("opacity-100", "scale-100")
    this.menuTarget.classList.add("opacity-0", "scale-95")
    
    setTimeout(() => {
      this.menuTarget.classList.add("hidden")
    }, 200)
    
    // Rotate chevron icon back
    if (this.hasIconTarget) {
      this.iconTarget.style.transform = "rotate(0deg)"
    }
    
    // Set ARIA attributes
    this.triggerTarget.setAttribute('aria-expanded', 'false')
    this.menuTarget.setAttribute('aria-hidden', 'true')
    
    // Return focus to trigger
    this.triggerTarget.focus()
  }

  handleOutsideClick(event) {
    if (!this.isOpen || !this.closeOnOutsideClickValue) return
    
    const menu = this.menuTarget
    const trigger = this.triggerTarget
    
    if (!menu.contains(event.target) && !trigger.contains(event.target)) {
      this.hide()
    }
  }

  handleKeydown(event) {
    if (!this.isOpen) return
    
    switch (event.key) {
      case 'Escape':
        event.preventDefault()
        this.hide()
        break
      case 'ArrowDown':
        event.preventDefault()
        this.focusNextItem()
        break
      case 'ArrowUp':
        event.preventDefault()
        this.focusPreviousItem()
        break
      case 'Tab':
        if (this.autoCloseValue) {
          this.hide()
        }
        break
    }
  }

  focusNextItem() {
    const focusableItems = this.getFocusableItems()
    const currentIndex = focusableItems.indexOf(document.activeElement)
    const nextIndex = (currentIndex + 1) % focusableItems.length
    focusableItems[nextIndex].focus()
  }

  focusPreviousItem() {
    const focusableItems = this.getFocusableItems()
    const currentIndex = focusableItems.indexOf(document.activeElement)
    const previousIndex = (currentIndex - 1 + focusableItems.length) % focusableItems.length
    focusableItems[previousIndex].focus()
  }

  getFocusableItems() {
    return Array.from(this.menuTarget.querySelectorAll('a, button, input, [tabindex]:not([tabindex="-1"])'))
  }
}