import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]
  
  connect() {
    // Auto-dismiss after 5 seconds
    this.messageTargets.forEach((message, index) => {
      setTimeout(() => {
        this.dismiss(message)
      }, 5000 + (index * 500)) // Stagger dismissal if multiple messages
    })
  }
  
  dismiss(event) {
    const message = event.target ? event.target.closest('[data-flash-messages-target="message"]') : event
    
    if (message) {
      message.style.transform = 'translateX(100%)'
      message.style.opacity = '0'
      
      setTimeout(() => {
        if (message.parentNode) {
          message.remove()
        }
      }, 300)
    }
  }
}
