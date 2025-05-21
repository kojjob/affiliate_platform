import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submitButton"]

  connect() {
    console.log("Contact form controller connected")
  }

  submit(event) {
    event.preventDefault()
    
    const form = event.target
    const submitButton = this.submitButtonTarget
    const originalText = submitButton.textContent
    
    // Show loading state
    submitButton.textContent = "Sending..."
    submitButton.disabled = true
    
    // Simulate form submission (replace with actual submission logic)
    setTimeout(() => {
      // Show success message
      this.showSuccessMessage()
      
      // Reset form
      form.reset()
      
      // Reset button
      submitButton.textContent = originalText
      submitButton.disabled = false
    }, 2000)
  }

  showSuccessMessage() {
    // Create success message
    const successMessage = document.createElement('div')
    successMessage.className = 'bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg mb-6'
    successMessage.innerHTML = `
      <div class="flex items-center">
        <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
        </svg>
        <span>Thank you for your message! We'll get back to you within 24 hours.</span>
      </div>
    `
    
    // Insert message at the top of the form
    this.element.insertBefore(successMessage, this.element.firstChild)
    
    // Remove message after 5 seconds
    setTimeout(() => {
      successMessage.remove()
    }, 5000)
    
    // Scroll to top of form
    this.element.scrollIntoView({ behavior: 'smooth' })
  }
}