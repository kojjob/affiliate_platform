import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["affiliateFields"]
  
  connect() {
    this.setupPasswordToggle()
    this.setupFormValidation()
  }
  
  setupPasswordToggle() {
    // Password visibility toggle functionality
  }
  
  togglePassword(event) {
    const button = event.currentTarget
    const input = button.closest('.relative').querySelector('input[type="password"], input[type="text"]')
    
    if (input.type === 'password') {
      input.type = 'text'
      button.innerHTML = `
        <svg class="h-5 w-5 text-slate-400 hover:text-slate-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L6.757 6.757M9.878 9.878a3 3 0 00-.007 4.243m4.242-4.242L16.242 7.757m-6.375 6.368a3 3 0 004.243 0M15.121 9.878l-4.243 4.243"></path>
        </svg>
      `
    } else {
      input.type = 'password'
      button.innerHTML = `
        <svg class="h-5 w-5 text-slate-400 hover:text-slate-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
        </svg>
      `
    }
  }
  
  setupFormValidation() {
    // Real-time validation for better UX
    const emailField = this.element.querySelector('input[type="email"]')
    const passwordField = this.element.querySelector('input[type="password"]')
    const confirmPasswordField = this.element.querySelector('input[name*="password_confirmation"]')
    
    if (emailField) {
      emailField.addEventListener('blur', this.validateEmail.bind(this))
    }
    
    if (passwordField && confirmPasswordField) {
      confirmPasswordField.addEventListener('blur', this.validatePasswordMatch.bind(this))
    }
  }
  
  validateEmail(event) {
    const email = event.target.value
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    const fieldContainer = event.target.closest('.space-y-2')
    
    this.removeValidationMessage(fieldContainer)
    
    if (email && !emailRegex.test(email)) {
      this.addValidationMessage(fieldContainer, 'Please enter a valid email address', 'error')
    } else if (email && emailRegex.test(email)) {
      this.addValidationMessage(fieldContainer, 'Email looks good!', 'success')
    }
  }
  
  validatePasswordMatch(event) {
    const password = this.element.querySelector('input[name*="[password]"]').value
    const confirmation = event.target.value
    const fieldContainer = event.target.closest('.space-y-2')
    
    this.removeValidationMessage(fieldContainer)
    
    if (confirmation && password !== confirmation) {
      this.addValidationMessage(fieldContainer, 'Passwords do not match', 'error')
    } else if (confirmation && password === confirmation) {
      this.addValidationMessage(fieldContainer, 'Passwords match!', 'success')
    }
  }
  
  addValidationMessage(container, message, type) {
    const existingMessage = container.querySelector('.validation-message')
    if (existingMessage) {
      existingMessage.remove()
    }
    
    const messageElement = document.createElement('div')
    messageElement.className = `validation-message text-sm mt-1 ${
      type === 'error' ? 'text-red-600' : 'text-green-600'
    }`
    messageElement.textContent = message
    
    container.appendChild(messageElement)
  }
  
  removeValidationMessage(container) {
    const existingMessage = container.querySelector('.validation-message')
    if (existingMessage) {
      existingMessage.remove()
    }
  }
  
  toggleAffiliateFields(event) {
    const checkbox = event.target
    const affiliateFields = this.hasAffiliateFieldsTarget ? this.affiliateFieldsTarget : null
    
    if (affiliateFields) {
      if (checkbox.checked) {
        affiliateFields.style.display = 'block'
        affiliateFields.style.opacity = '1'
      } else {
        affiliateFields.style.opacity = '0'
        setTimeout(() => {
          affiliateFields.style.display = 'none'
        }, 200)
      }
    }
  }
}
